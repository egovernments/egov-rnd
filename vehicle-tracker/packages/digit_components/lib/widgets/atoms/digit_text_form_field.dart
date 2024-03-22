import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitTextFormField extends StatelessWidget {
  final bool readOnly;
  final String formControlName;
  final String? hint;
  final Widget? suffix;
  final bool isRequired;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool obscureText;
  final String label;
  final int? minLength;
  final Widget? suffixIcon;
  final void Function(FormControl<dynamic>)? onChanged;
  final TextCapitalization textCapitalization;
  final ControlValueAccessor<dynamic, String>? valueAccessor;
  final Map<String, String Function(Object control)>? validationMessages;

  const DigitTextFormField({
    super.key,
    required this.label,
    required this.formControlName,
    this.hint,
    this.suffix,
    this.minLines = 1,
    this.maxLines = 1,
    this.valueAccessor,
    this.maxLength,
    this.onTap,
    this.focusNode,
    this.validationMessages,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.obscureText = false,
    this.isRequired = false,
    this.readOnly = false,
    this.onChanged,
    this.minLength,
  });

  @override
  Widget build(BuildContext context) => LabeledField(
        label: '$label ${isRequired ? '*' : ''}',
        child: ReactiveTextField(
            onChanged: onChanged,
            readOnly: readOnly,
            formControlName: formControlName,
            maxLength: maxLength,
            validationMessages: validationMessages,
            autofocus: false,
            textCapitalization: textCapitalization,
            minLines: minLines,
            maxLines: maxLines,
            obscureText: obscureText,
            focusNode: focusNode,
            keyboardType: keyboardType,
            valueAccessor: valueAccessor,
            decoration: readOnly == true
                ? InputDecoration(
                    enabledBorder:
                        DigitTheme.instance.inputDecorationTheme.disabledBorder,
                    fillColor: DigitTheme.instance.colors.cloudGray,
                    focusedBorder:
                        DigitTheme.instance.inputDecorationTheme.disabledBorder,
                    focusColor: DigitTheme.instance.colors.cloudGray,
                    suffixIcon: suffix == null
                        ? null
                        : InkWell(
                            onTap: onTap,
                            child: suffix,
                          ),
                  )
                : InputDecoration(
                    labelText: hint,
                    contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    suffixIcon: suffix == null
                        ? null
                        : InkWell(
                            onTap: onTap,
                            child: suffix,
                          ),
                  )),
      );
}
