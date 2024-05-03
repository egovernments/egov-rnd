import 'package:digit_components/digit_components.dart';
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
  });

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: isRequired ? "$label *" : label,
      child: TextFormField(
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
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 48,
            maxWidth: 48,
          ),
          //maxLines = 1 if suffixIcon != null
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
