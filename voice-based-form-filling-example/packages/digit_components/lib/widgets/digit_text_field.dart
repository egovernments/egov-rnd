import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String prefixText;
  final int? maxLength;
  final int? maxLines;
  final bool isRequired;
  final ValueChanged<String>? onChange;
  final List<FilteringTextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? pattern;
  final String? message;
  final String? Function(String? value)? validator;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autoValidation;
  final bool obscureText;
  final bool isDisabled;
  final bool readOnly;
  final bool? isFilled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final String? hintText;

  const DigitTextField({
    super.key,
    required this.label,
    this.prefixText = '',
    this.maxLength,
    this.controller,
    this.isRequired = false,
    this.textInputType,
    this.inputFormatter,
    this.pattern,
    this.validator,
    this.message,
    this.focusNode,
    this.textCapitalization,
    this.onChange,
    this.maxLines,
    this.autoValidation,
    this.obscureText = false,
    this.isDisabled = false,
    this.readOnly = false,
    this.isFilled,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String?> errorNotifier = ValueNotifier<String?>(null);

    return LabeledField(
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      label: isRequired ? "$label *" : label,
      textStyle: textStyle,
      child: TextFormField(
        onFieldSubmitted: (value) {
          if (validator != null) {
            errorNotifier.value = validator!(value);
          }
        },
        style: TextStyle(
            color: readOnly == true
                ? DigitTheme.instance.colorScheme.shadow
                : DigitTheme.instance.colorScheme.onSurface),
        controller: controller,
        enabled: !isDisabled,
        maxLength: maxLength,
        keyboardType: textInputType ?? TextInputType.text,
        autofocus: false,
        inputFormatters: inputFormatter,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        onChanged: onChange,
        maxLines: maxLines,
        focusNode: focusNode,
        obscureText: obscureText,
        autovalidateMode: autoValidation,
        readOnly: readOnly,
        validator: (value) => validator?.call(value),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 48,
            maxWidth: 48,
          ),
          //maxLines = 1 if suffixIcon != null
          suffixIcon: suffixIcon,
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const DigitColors().lavaRed, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const DigitColors().lavaRed, width: 1.0),
            borderRadius: BorderRadius.circular(4.0),
          ),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          prefixStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isDisabled
                  ? const DigitColors().cloudGray
                  : DigitTheme.instance.colorScheme.onBackground),
          prefixIcon: prefixIcon ??
              (prefixText == ''
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 0),
                      child: Text(
                        prefixText,
                        style: TextStyle(
                            fontSize: kIsWeb ? 15 : 16,
                            fontWeight: FontWeight.w400,
                            color: isDisabled
                                ? const DigitColors().cloudGray
                                : DigitTheme.instance.colorScheme.onBackground),
                      ),
                    )),
        ),
      ),
    );
  }
}
