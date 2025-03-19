import 'package:digit_components/widgets/atoms/digit_date_form_picker.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitDobPicker extends StatelessWidget {
  final String datePickerFormControl;

  final bool isVerified;

  final ControlValueAccessor? valueAccessor;
  final String datePickerLabel;
  final String ageFieldLabel;
  final String separatorLabel;

  const DigitDobPicker({
    super.key,
    required this.datePickerFormControl,
    this.isVerified = false,
    this.valueAccessor,
    required this.datePickerLabel,
    required this.ageFieldLabel,
    required this.separatorLabel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: Colors.grey, style: BorderStyle.solid, width: 1.0),
        ),
        child: Column(
          children: [
            DigitDateFormPicker(
              label: datePickerLabel,
              formControlName: datePickerFormControl,
            ),
            const SizedBox(height: 16),
            Text(
              separatorLabel,
              style: theme.textTheme.bodyLarge,
            ),
            DigitTextFormField(
              maxLength: 3,
              valueAccessor: DobValueAccessor(),
              formControlName: datePickerFormControl,
              label: ageFieldLabel,
              keyboardType: TextInputType.number,
              readOnly: isVerified,
              onChanged: (formControl) {
                /// Validates that control's value must be `true`
                Map<String, dynamic>? requiredTrue(
                    AbstractControl<dynamic> control) {
                  String value =
                      (DateTime.now().difference(formControl.value).inDays /
                              365)
                          .round()
                          .toStringAsFixed(0);
                  return int.parse(value) <= 150
                      ? null
                      : {'Age Shoud be less than 150': true};
                }

                formControl.setValidators([requiredTrue]);
              },
            )
          ],
        ),
      ),
    );
  }
}

class DobValueAccessor extends ControlValueAccessor<DateTime, String> {
  @override
  String? modelToViewValue(DateTime? modelValue) {
    if (modelValue == null) return null;
    return (DateTime.now().difference(modelValue).inDays / 365)
        .round()
        .toStringAsFixed(0);
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    if (viewValue == null) return null;
    final value = int.tryParse(viewValue);
    if (value == null) return null;
    return DateTime(
      DateTime.now().subtract(Duration(days: value * 365)).year,
      1,
      1,
    );
  }
}
