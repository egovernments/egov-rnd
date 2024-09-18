import 'dart:async';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';

class SearchDropdownEditingController<T> extends ChangeNotifier {
  T? _value;
  SearchDropdownEditingController({T? value}) : _value = value;

  T? get value => _value;
  set value(T? newValue) {
    if (_value == newValue) return;
    _value = newValue;
    notifyListeners();
  }

  @override
  String toString() => '${describeIdentity(this)}($value)';
}

/// Create a dropdown form field
class SearchDropdownFormField<T> extends StatefulWidget {
  final bool autoFocus;

  /// It will trigger on user search
  final bool Function(T item, String str)? filterFn;

  /// Check item is selected
  final bool Function(T? item1, T? item2)? selectedFn;

  /// Return list of items what need to list for dropdown.
  final Future<List<T>> Function(String str) findFn;

  final ListTile Function(
    T item,
    int position,
    bool focused,
    bool selected,
    Function() onTap,
  ) dropdownItemFn;

  /// Build widget to display selected item inside Form Field
  final Widget Function(T? item) displayItemFn;

  final InputDecoration? decoration;
  final Color? dropdownColor;
  final SearchDropdownEditingController<T>? controller;
  final void Function(T item)? onChanged;
  final void Function(T?)? onSaved;
  final FormGroup form;

  /// height of the dropdown overlay, Default: 240
  final double? dropdownHeight;

  /// Style the search box text
  final TextStyle? searchTextStyle;

  /// Cursor color of the search box
  final Color? cursorColor;

  /// Message to display if the search does not match with any item, Default : "No matching found!"
  final String emptyText;

  /// Give action text if you want handle the empty search.
  final String emptyActionText;

  /// this function triggers on click of emptyAction button
  final Future<void> Function(String value)? onEmptyActionPressed;

  /// Separator between the dropdown items
  final Widget? dropdownItemSeparator;
  final void Function()? onFieldTap;
  final String formControlName;
  final ShowErrorsFunction<T>? showErrors;
  final bool enabled;

  const SearchDropdownFormField({
    Key? key,
    required this.form,
    required this.dropdownItemFn,
    required this.displayItemFn,
    required this.findFn,
    this.filterFn,
    this.autoFocus = false,
    this.controller,
    this.decoration,
    this.dropdownColor,
    this.onChanged,
    this.onSaved,
    this.dropdownHeight,
    this.searchTextStyle,
    this.cursorColor,
    this.emptyText = "No matching found!",
    this.emptyActionText = 'Create new',
    this.onEmptyActionPressed,
    this.dropdownItemSeparator,
    this.selectedFn,
    this.onFieldTap,
    required this.formControlName,
    this.showErrors,
    this.enabled = true,
  }) : super(key: key);

  @override
  SearchDropdownFormFieldState createState() =>
      SearchDropdownFormFieldState<T>();
}

class SearchDropdownFormFieldState<T> extends State<SearchDropdownFormField>
    with SingleTickerProviderStateMixin {
  final FocusNode _widgetFocusNode = FocusNode();
  final FocusNode _searchFocusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();
  final ValueNotifier<List<T>> _listItemsValueNotifier =
      ValueNotifier<List<T>>([]);
  final TextEditingController _searchTextController = TextEditingController();
  final SearchDropdownEditingController<T> _controller =
      SearchDropdownEditingController<T>();

  bool _selectedFn(dynamic item1, dynamic item2) {
    return item1 == item2;
  }

  bool get _isEmpty => _selectedItem == null;
  bool _isFocused = false;

  OverlayEntry? _overlayEntry;
  OverlayEntry? _overlayBackdropEntry;
  List<T>? _options;
  int _listItemFocusedPosition = 0;
  T? _selectedItem;
  Widget? _displayItem;
  Timer? _debounce;
  String? _lastSearchString;

  SearchDropdownEditingController<dynamic>? get _effectiveController =>
      widget.controller ?? _controller;

  SearchDropdownFormFieldState() : super();

  @override
  void initState() {
    super.initState();

    if (widget.autoFocus) _widgetFocusNode.requestFocus();
    _selectedItem = widget.form.control(widget.formControlName).value;
    _displayItem =
        widget.displayItemFn(widget.form.control(widget.formControlName).value);
    _searchFocusNode.addListener(() {
      if (!_searchFocusNode.hasFocus && _overlayEntry != null) {
        _removeOverlay();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _displayItem =
        widget.displayItemFn(widget.form.control(widget.formControlName).value);

    return CompositedTransformTarget(
      link: this._layerLink,
      child: GestureDetector(
        onTap: widget.enabled
            ? () {
                _selectedItem = null;
                _widgetFocusNode.requestFocus();
                _toggleOverlay();
                if (widget.onFieldTap != null) {
                  widget.onFieldTap!();
                }
              }
            : null,
        child: Focus(
          autofocus: widget.autoFocus,
          focusNode: _widgetFocusNode,
          onFocusChange: (focused) {
            setState(() {
              _isFocused = focused;
            });
          },
          onKey: (focusNode, event) {
            return _onKeyPressed(event);
          },
          child: ReactiveFormField(
            formControlName: widget.formControlName,
            showErrors: widget.showErrors,
            builder: (state) {
              return InputDecorator(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: widget.decoration ??
                    InputDecoration(
                      enabled: widget.enabled,
                      border: const UnderlineInputBorder(),
                      fillColor: widget.enabled
                          ? DigitTheme.instance.colors.seaShellGray
                          : const DigitColors().white,
                      disabledBorder: DigitTheme
                          .instance.inputDecorationTheme.disabledBorder,
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 24,
                        color: widget.enabled
                            ? const DigitColors().woodsmokeBlack
                            : const DigitColors().cloudGray,
                      ),
                    ),
                isEmpty: _isEmpty,
                isFocused: _isFocused,
                child: this._overlayEntry != null
                    ? EditableText(
                        textInputAction: TextInputAction.none,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          RemoveEmojiInputFormatter(),
                        ],
                        style: widget.searchTextStyle ??
                            const TextStyle(
                                fontSize: 16, color: Colors.black87),
                        controller: _searchTextController,
                        cursorColor: widget.cursorColor ?? Colors.black87,
                        focusNode: _searchFocusNode,
                        backgroundCursorColor: widget.enabled
                            ? Colors.transparent
                            : const DigitColors().hintGrey,
                        onChanged: widget.enabled
                            ? (str) {
                                if (_overlayEntry == null) {
                                  _addOverlay();
                                }
                                _onTextChanged(str);
                              }
                            : null,
                        onSubmitted: (str) {
                          _searchTextController.value =
                              const TextEditingValue(text: "");
                          _removeOverlay();
                        },
                        onEditingComplete: () {},
                      )
                    : _displayItem ?? Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    final renderObject = context.findRenderObject() as RenderBox;
    final Size size = renderObject.size;

    var overlay = OverlayEntry(builder: (context) {
      return Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: this._layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height - 1),
          child: Material(
              elevation: 4.0,
              child: SizedBox(
                height: _options != null && _options!.length > 2
                    ? widget.dropdownHeight ?? 140
                    : (_options ?? []).length * 45,
                child: Container(
                    color: widget.dropdownColor ?? Colors.white70,
                    child: ValueListenableBuilder(
                        valueListenable: _listItemsValueNotifier,
                        builder: (context, List<T> items, child) {
                          return _options != null && _options!.isNotEmpty
                              ? ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return widget.dropdownItemSeparator ??
                                        Container();
                                  },
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: _options!.length,
                                  itemBuilder: (context, position) {
                                    T item = _options![position];
                                    onTap() {
                                      _listItemFocusedPosition = position;
                                      _searchTextController.value =
                                          const TextEditingValue(text: "");
                                      _removeOverlay();
                                      _setValue();
                                    }

                                    ListTile listTile = widget.dropdownItemFn(
                                      item,
                                      position,
                                      position == _listItemFocusedPosition,
                                      (widget.selectedFn ?? _selectedFn)(
                                          _selectedItem, item),
                                      onTap,
                                    );

                                    return listTile;
                                  })
                              : Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.emptyText,
                                        style: const TextStyle(
                                            color: Colors.black45),
                                      ),
                                      if (widget.onEmptyActionPressed != null)
                                        TextButton(
                                          onPressed: () async {
                                            await widget.onEmptyActionPressed!(
                                                _searchTextController
                                                    .value.text);
                                            _search(_searchTextController
                                                .value.text);
                                          },
                                          child: Text(widget.emptyActionText),
                                        ),
                                    ],
                                  ),
                                );
                        })),
              )),
        ),
      );
    });

    return overlay;
  }

  OverlayEntry _createBackdropOverlay() {
    return OverlayEntry(
        builder: (context) => Positioned(
            left: 0,
            top: 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: () {
                _removeOverlay();
              },
            )));
  }

  _addOverlay() {
    if (_overlayEntry == null) {
      _search("");
      _overlayBackdropEntry = _createBackdropOverlay();
      _overlayEntry = _createOverlayEntry();
      if (_overlayEntry != null) {
        // Overlay.of(context)!.insert(_overlayEntry!);
        Overlay.of(context).insertAll([_overlayBackdropEntry!, _overlayEntry!]);
        setState(() {
          _searchFocusNode.requestFocus();
        });
      }
    }
  }

  /// Detach overlay from the dropdown widget
  _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayBackdropEntry!.remove();
      _overlayEntry!.remove();
      _overlayEntry = null;
      _searchTextController.value = TextEditingValue.empty;
      setState(() {});
    }
  }

  _toggleOverlay() {
    if (_overlayEntry == null) {
      _addOverlay();
    } else {
      _removeOverlay();
    }
  }

  _onTextChanged(String? str) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (_lastSearchString != str) {
        _lastSearchString = str;
        _search(str ?? "");
      }
    });
  }

  _onKeyPressed(RawKeyEvent event) {
    if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
      if (_searchFocusNode.hasFocus) {
        setState(() {
          _selectedItem = null;
          _effectiveController?.value = null;
          _searchTextController.value = const TextEditingValue(text: "");
          _lastSearchString = "";
          _clearValue();
          _displayItem = null;
        });
        _removeOverlay();
        // if (widget.onFieldTap != null) {
        //   widget.onFieldTap!();
        // }
      } else {
        _toggleOverlay();
      }
      return KeyEventResult.ignored;
    } else if (event.isKeyPressed(LogicalKeyboardKey.escape)) {
      _removeOverlay();
      return KeyEventResult.handled;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      int v = _listItemFocusedPosition;
      v++;
      if (v >= _options!.length) v = 0;
      _listItemFocusedPosition = v;
      _listItemsValueNotifier.value = List<T>.from(_options ?? []);
      return KeyEventResult.handled;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      int v = _listItemFocusedPosition;
      v--;
      if (v < 0) v = _options!.length - 1;
      _listItemFocusedPosition = v;
      _listItemsValueNotifier.value = List<T>.from(_options ?? []);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  _search(String str) async {
    List<T> items = await widget.findFn(str) as List<T>;

    if (str.isNotEmpty && widget.filterFn != null) {
      items = items.where((item) => widget.filterFn!(item, str)).toList();
    }

    _options = items;

    _listItemsValueNotifier.value = items;
  }

  _setValue() {
    if (_options != null && _options!.isNotEmpty) {
      var item = _options![_listItemFocusedPosition];
      _selectedItem = item;

      _effectiveController!.value = _selectedItem;

      if (widget.onChanged != null) {
        widget.onChanged!(_selectedItem);
      }
    }

    setState(() {});
  }

  _clearValue() {
    var item = '';
    _effectiveController!.value = item;

    if (widget.onChanged != null) {
      widget.onChanged!(_selectedItem);
    }
    _searchTextController.value = const TextEditingValue(text: "");
  }
}
