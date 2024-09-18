import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitReactiveDropdown<T> extends StatelessWidget {
  final String label;
  final T? initialValue;
  final List<T> menuItems;
  final String formControlName;
  final bool isRequired;
  final bool isDisabled;
  final ValueChanged<T>? onChanged;
  final String Function(T value) valueMapper;
  final Map<String, String Function(Object object)>? validationMessages;
  final EdgeInsets? padding;
  final double menuMaxHeight;

  const DigitReactiveDropdown({
    super.key,
    required this.label,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    this.isDisabled = false,
    required this.valueMapper,
    this.initialValue,
    this.onChanged,
    this.validationMessages,
    this.padding,
    this.menuMaxHeight = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(top: kPadding*2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label${isRequired ? ' *' : ''}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: kPadding),
          Container(
            color: isDisabled
                ? const DigitColors().seaShellGray
                : DigitTheme.instance.colorScheme.onError,
            child: ReactiveDropdownField(
              menuMaxHeight: menuMaxHeight,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (control) {
                final value = control.value;
                if (value == null) return;
                onChanged?.call(value);
              },
              style: DigitTheme.instance.mobileTheme.textTheme.bodyLarge,
              validationMessages: validationMessages,
              formControlName: formControlName,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(kPadding*2, 12, kPadding, 12),
              ),
              items: menuItems
                  .map(
                    (e) => DropdownMenuItem<T>(
                      value: e,
                      child: Text(valueMapper(e)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
