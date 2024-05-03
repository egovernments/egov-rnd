import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitReactiveDropdown<T> extends StatelessWidget {
  final String label;
  final T? initialValue;
  final List<T> menuItems;
  final String formControlName;
  final bool isRequired;
  final ValueChanged<T>? onChanged;
  final String Function(T value) valueMapper;
  final Map<String, String Function(Object object)>? validationMessages;

  const DigitReactiveDropdown({
    super.key,
    required this.label,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    required this.valueMapper,
    this.initialValue,
    this.onChanged,
    this.validationMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label${isRequired ? ' *' : ''}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          ReactiveDropdownField(
            onChanged: (control) {
              final value = control.value;
              if (value == null) return;
              onChanged?.call(value);
            },
            validationMessages: validationMessages,
            formControlName: formControlName,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(16, 12, 0, 12),
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
        ],
      ),
    );
  }
}

class MenuItemModel {
  final String name;
  final String code;

  const MenuItemModel({
    required this.name,
    required this.code,
  });
}
