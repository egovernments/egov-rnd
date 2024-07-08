import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitDateFormPicker extends StatelessWidget {
  final String label;
  final bool isRequired;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  final ValueChanged<DateTime?>? onChangeOfDate;
  final String formControlName;
  final bool isEnabled;
  final String? requiredMessage;
  final String? Function(DateTime?)? validator;
  final AutovalidateMode? autoValidation;
  final Map<String, String Function(Object control)>? validationMessages;
  final EdgeInsets? margin;
  final DateTime? start;
  final DateTime? end;
  final String? hint;
  final IconData? icon;
  final String? tooltipMessage;
  final EdgeInsets? padding;
  final String cancelText;
  final String confirmText;
  final String? fieldHintText;
  final void Function(FormControl<dynamic>)? onChangeOfFormControl;

  const DigitDateFormPicker({
    super.key,
    required this.label,
    this.isRequired = false,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.onChangeOfDate,
    required this.formControlName,
    this.isEnabled = true,
    this.requiredMessage,
    this.validator,
    this.validationMessages,
    this.autoValidation,
    this.margin,
    this.end,
    this.start,
    this.hint,
    this.tooltipMessage,
    this.icon,
    this.padding,
    required this.cancelText,
    required this.confirmText,
    this.fieldHintText,
    this.onChangeOfFormControl,
  });

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      label: '$label ${isRequired ? '*' : ''}',
      padding: padding ?? const EdgeInsets.only(top: kPadding * 2),
      labelStyle: Theme.of(context).textTheme.bodyLarge,
      icon: icon,
      tooltipMessage: tooltipMessage,
      child: ReactiveDatePicker(
        formControlName: formControlName,
        firstDate: start ?? DateTime(1900),
        lastDate: end ?? DateTime.now(),
        cancelText: cancelText,
        confirmText: confirmText,
        fieldHintText: fieldHintText,
        builder: (context, picker, child) {
          return Container(
            color: !isEnabled ? const DigitColors().seaShellGray : null,
            child: ReactiveTextField(
              style: TextStyle(
                color: isEnabled == true
                    ? DigitTheme.instance.colorScheme.onBackground
                    : DigitTheme.instance.colorScheme.shadow,
              ),
              formControlName: formControlName,
              validationMessages: validationMessages,
              readOnly: true,
              valueAccessor: DateTimeValueAccessor(
                dateTimeFormat: DateFormat('dd MMM yyyy'),
              ),
              decoration: isEnabled
                  ? InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 12, 0, 12),
                      suffixIcon: const Icon(
                        Icons.date_range,
                        size: 25,
                      ),
                      label: hint == null ? null : Text(hint!),
                    )
                  : InputDecoration(
                      enabledBorder: DigitTheme
                          .instance.inputDecorationTheme.disabledBorder,
                      fillColor: DigitTheme.instance.colors.cloudGray,
                      focusedBorder: DigitTheme
                          .instance.inputDecorationTheme.disabledBorder,
                      focusColor: DigitTheme.instance.colors.cloudGray,
                      suffixIcon: const Icon(
                        Icons.date_range,
                        size: 25,
                      ),
                    ),
              enableInteractiveSelection: isEnabled,
              onTap: isEnabled == true
                  ? (control) {
                      picker.showPicker();
                    }
                  : null,
              onChanged: onChangeOfFormControl,
            ),
          );
        },
      ),
    );
  }
}
