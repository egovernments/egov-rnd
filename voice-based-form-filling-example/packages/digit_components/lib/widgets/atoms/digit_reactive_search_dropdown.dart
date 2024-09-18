import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_reactive_search_Dropdown_bloc.dart';
import 'package:digit_components/widgets/atoms/digit_divider.dart';
import 'package:digit_components/widgets/atoms/searchable_dropdown_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class DigitReactiveSearchDropdown<T> extends StatefulWidget {
  final String label;
  final List<T> menuItems;
  final FormGroup form;
  final String formControlName;
  final bool isRequired;
  final bool enabled;
  final String Function(T value) valueMapper;
  final String? validationMessage;
  final EdgeInsets? padding;
  final void Function(dynamic)? onSelected;
  final void Function(dynamic)? onFieldTap;
  final String emptyText;
  final bool enableVoiceCommand;

  const DigitReactiveSearchDropdown({
    Key? key,
    required this.label,
    required this.form,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    required this.valueMapper,
    this.validationMessage,
    this.padding,
    this.onSelected,
    this.onFieldTap,
    this.emptyText = 'No Matches Found',
    this.enabled = true,
    this.enableVoiceCommand = false,
  }) : super(key: key);

  @override
  State<DigitReactiveSearchDropdown> createState() =>
      _DigitReactiveSearchDropdownState();
}

class _DigitReactiveSearchDropdownState<T>
    extends State<DigitReactiveSearchDropdown<T>> {
  SearchDropdownEditingController<T>? controller =
      SearchDropdownEditingController();
  late DigitReactiveSearchDropdownBloc _bloc;

  @override
  void initState() {
    super.initState();
    if (widget.enableVoiceCommand) {
      _bloc = DigitReactiveSearchDropdownBloc();
    }
  }

  void _selectDropdownItem(String recognizedWords) {
    print('Selecting dropdown item for recognized words: $recognizedWords');
    final matchedItem = widget.menuItems.cast<T?>().firstWhere(
      (item) => widget.valueMapper(item!).toLowerCase() == recognizedWords.toLowerCase(),
      orElse: () => null,
    );

    if (matchedItem != null) {
      print('Matched item found: ${widget.valueMapper(matchedItem)}');
      widget.form.control(widget.formControlName).value = matchedItem;
      setState(() {}); // Trigger a UI rebuild
    } 
    // error handling
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: LabeledField(
        padding: widget.padding ?? const EdgeInsets.only(top: kPadding * 2),
        label: '${widget.label}${widget.isRequired ? '*' : ''}',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchDropdownFormField<T>(
              form: widget.form,
              controller: controller,
              enabled: widget.enabled,
              formControlName: widget.formControlName,
              emptyText: widget.emptyText,
              displayItemFn: (dynamic str) => Text(
                str != null ? widget.valueMapper(str) : '',
                style: TextStyle(
                    fontSize: 14,
                    color: !widget.enabled
                        ? const DigitColors().hintGrey
                        : const DigitColors().woodsmokeBlack),
              ),
              findFn: (dynamic str) async => widget.menuItems,
              filterFn: (dynamic item, str) => widget
                  .valueMapper(item)
                  .toLowerCase()
                  .contains(str.toLowerCase()),
              dropdownItemSeparator: const DigitDivider(),
              dropdownItemFn:
                  (dynamic item, position, focused, selected, onTap) => ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.valueMapper(item),
                      style: TextStyle(
                          color: selected
                              ? DigitTheme.instance.colorScheme.secondary
                              : DigitTheme.instance.colorScheme.onSurface,
                          fontSize: 16),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                dense: true,
                style: ListTileStyle.list,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                tileColor: focused
                    ? DigitTheme.instance.colorScheme.surface
                    : Colors.transparent,
                onTap: !widget.enabled
                    ? null
                    : () {
                        widget.form.control(widget.formControlName).value = item;
                        onTap();
                        if (widget.onSelected != null) {
                          widget.onSelected!(item);
                        }
                        setState(() {}); // Trigger a UI rebuild
                      },
              ),
              onFieldTap: !widget.enabled
                  ? null
                  : () {
                      widget.form.control(widget.formControlName).value = null;
                      if (widget.isRequired) {
                        widget.form
                            .control(widget.formControlName)
                            .setErrors({'': true});
                      }
                      if (widget.onFieldTap != null) {
                        widget.onFieldTap!(null);
                      }
                      setState(() {}); // Trigger a UI rebuild
                    },
            ),
            ReactiveFormConsumer(
              builder: (context, form, child) {
                final formControl = widget.form.control(widget.formControlName);
                if (formControl.hasErrors) {
                  return Text(
                    widget.validationMessage ?? '',
                    style: TextStyle(
                      color: DigitTheme.instance.colorScheme.error,
                      fontSize: 12,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            if (widget.enableVoiceCommand)
              BlocConsumer<DigitReactiveSearchDropdownBloc, DigitReactiveSearchDropdownState>(
                listener: (context, state) {
                  if (state is SpeechRecognitionSuccess) {
                    print('Speech recognition successful with words: ${state.recognizedWords}');
                    _selectDropdownItem(state.recognizedWords);
                  }
                },
                builder: (context, state) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(state is ListeningState ? Icons.mic : Icons.mic_none),
                      onPressed: () {
                        if (state is ListeningState) {
                          print('Stopping listening');
                          _bloc.add(StopListening());
                        } else {
                          print('Starting listening');
                          _bloc.add(StartListening());
                        }
                      },
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}





// old code 






// without bloc and voice command

// import 'package:digit_components/digit_components.dart';
// import 'package:digit_components/widgets/atoms/digit_divider.dart';
// import 'package:digit_components/widgets/atoms/searchable_dropdown_field.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// class DigitReactiveSearchDropdown<T> extends StatefulWidget {
//   final String label;
//   final List<T> menuItems;
//   final FormGroup form;
//   final String formControlName;
//   final bool isRequired;
//   final bool enabled;
//   final String Function(T value) valueMapper;
//   final String? validationMessage;
//   final EdgeInsets? padding;
//   final void Function(dynamic)? onSelected;
//   final void Function(dynamic)? onFieldTap;
//   final String emptyText;

//   const DigitReactiveSearchDropdown({
//     Key? key,
//     required this.label,
//     required this.form,
//     required this.menuItems,
//     required this.formControlName,
//     this.isRequired = false,
//     required this.valueMapper,
//     this.validationMessage,
//     this.padding,
//     this.onSelected,
//     this.onFieldTap,
//     this.emptyText = 'No Matches Found',
//     this.enabled = true,
//   }) : super(key: key);

//   @override
//   State<DigitReactiveSearchDropdown> createState() =>
//       _DigitReactiveSearchDropdownState();
// }

// class _DigitReactiveSearchDropdownState<T>
//     extends State<DigitReactiveSearchDropdown<T>> {
//   SearchDropdownEditingController<T>? controller =
//       SearchDropdownEditingController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LabeledField(
//       padding: widget.padding ?? const EdgeInsets.only(top: kPadding * 2),
//       label: '${widget.label}${widget.isRequired ? '*' : ''}',
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SearchDropdownFormField<T>(
//             form: widget.form,
//             controller: controller,
//             enabled: widget.enabled,
//             formControlName: widget.formControlName,
//             emptyText: widget.emptyText,
//             displayItemFn: (dynamic str) => Text(
//               str != null ? widget.valueMapper(str) : '',
//               style: TextStyle(
//                   fontSize: 14,
//                   color: !widget.enabled
//                       ? const DigitColors().hintGrey
//                       : const DigitColors().woodsmokeBlack),
//             ),
//             findFn: (dynamic str) async => widget.menuItems,
//             filterFn: (dynamic item, str) => widget
//                 .valueMapper(item)
//                 .toLowerCase()
//                 .contains(str.toLowerCase()),
//             dropdownItemSeparator: const DigitDivider(),
//             dropdownItemFn:
//                 (dynamic item, position, focused, selected, onTap) => ListTile(
//               title: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     widget.valueMapper(item),
//                     style: TextStyle(
//                         color: selected
//                             ? DigitTheme.instance.colorScheme.secondary
//                             : DigitTheme.instance.colorScheme.onSurface,
//                         fontSize: 16),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                 ],
//               ),
//               dense: true,
//               style: ListTileStyle.list,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 16),
//               visualDensity: const VisualDensity(
//                   horizontal: VisualDensity.minimumDensity,
//                   vertical: VisualDensity.minimumDensity),
//               tileColor: focused
//                   ? DigitTheme.instance.colorScheme.surface
//                   : Colors.transparent,
//               onTap: !widget.enabled
//                   ? null
//                   : () {
//                       widget.form.control(widget.formControlName).value = item;
//                       onTap();
//                       if (widget.onSelected != null) {
//                         widget.onSelected!(item);
//                       }
//                     },
//             ),
//             onFieldTap: !widget.enabled
//                 ? null
//                 : () {
//                     widget.form.control(widget.formControlName).value = null;
//                     if (widget.isRequired) {
//                       widget.form
//                           .control(widget.formControlName)
//                           .setErrors({'': true});
//                     }
//                     if (widget.onFieldTap != null) {
//                       widget.onFieldTap!(null);
//                     }
//                   },
//           ),
//           ReactiveFormConsumer(
//             builder: (context, form, child) {
//               final formControl = widget.form.control(widget.formControlName);
//               if (formControl.hasErrors) {
//                 return Text(
//                   widget.validationMessage ?? '',
//                   style: TextStyle(
//                     color: DigitTheme.instance.colorScheme.error,
//                     fontSize: 12,
//                   ),
//                 );
//               } else {
//                 return const SizedBox.shrink();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


