import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitRadioButtonList<T> extends StatelessWidget {
  final String labelText;
  final TextStyle? labelStyle;
  final bool isRequired;
  final String formControlName;
  final String Function(T value) valueMapper;
  final List<T> options;
  final ValueChanged<T>? onValueChange;
  final bool? isEnabled;
  final Widget? secondaryWidget;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? labelPadding;
  final void Function(FormControl<dynamic>)? onChangeOfFormControl;
  final String errorMessage;

  const DigitRadioButtonList({
    super.key,
    this.isEnabled,
    required this.formControlName,
    this.secondaryWidget,
    required this.valueMapper,
    this.labelText = '',
    this.isRequired = false,
    required this.options,
    this.onValueChange,
    this.visualDensity,
    this.contentPadding,
    this.margin,
    this.labelPadding,
    this.labelStyle,
    this.onChangeOfFormControl,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 12.0, bottom: 5, right: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        labelText.trim().isNotEmpty
            ? Container(
                padding: labelPadding ??
                    const EdgeInsets.only(top: 18, bottom: 3, left: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(children: <Widget>[
                    Flexible(
                        child: Text(
                      labelText + (isRequired ? ' * ' : ''),
                      textAlign: TextAlign.left,
                      style: labelStyle ??
                          DigitTheme
                              .instance.mobileTheme.textTheme.headlineMedium,
                    )),
                  ]),
                ),
              )
            : const SizedBox.shrink(),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: options.map(
              (data) {
                return ReactiveRadioListTile<T>(
                  activeColor: isEnabled == false
                      ? const DigitColors().cloudGray
                      : DigitTheme.instance.colorScheme.secondary,
                  formControlName: formControlName,
                  contentPadding: contentPadding ?? const EdgeInsets.all(0),
                  title: Text(
                    valueMapper(data),
                    style: TextStyle(
                        color: isEnabled == false
                            ? const DigitColors().hintGrey
                            : const DigitColors().woodsmokeBlack),
                  ),
                  value: data,
                  visualDensity: visualDensity ??
                      const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                  onChanged: (isEnabled == true)
                      ? (control) {
                          final value = control.value;
                          if (value == null) return;
                          onValueChange?.call(value);
                        }
                      : null,
                  secondary: secondaryWidget != null
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: secondaryWidget)
                      : null,
                );
              },
            ).toList()),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            final radioListControl = form.control(formControlName);
            if (radioListControl.hasErrors) {
              return Text(
                errorMessage,
                style: TextStyle(
                    color: DigitTheme.instance.colorScheme.error, fontSize: 12),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ]),
    );
  }
}
