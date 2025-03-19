import 'package:flutter/material.dart';

class DigitDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> menuItems;
  final bool isRequired;
  final ValueChanged<T?>? onChanged;
  final String Function(T value) valueMapper;

  const DigitDropdown({
    super.key,
    required this.value,
    required this.label,
    required this.menuItems,
    this.isRequired = false,
    required this.valueMapper,
    this.onChanged,
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
          DropdownButtonFormField<T>(
            value: value,
            onChanged: onChanged,
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
