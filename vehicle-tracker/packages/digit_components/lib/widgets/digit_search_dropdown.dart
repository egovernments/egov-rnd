import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:reactive_flutter_typeahead/reactive_flutter_typeahead.dart';

import 'digit_reactive_type_ahead.dart';

class DigitSearchDropdown<T> extends StatelessWidget {
  final Iterable<T> Function(Iterable<T> items, String pattern)
      suggestionsCallback;
  final SuggestionSelectionCallback<T>? onSuggestionSelected;
  final String label;
  final T? initialValue;
  final String? initialValueText;
  final Iterable<T> menuItems;
  final String formControlName;
  final bool isRequired;
  final VoidCallback? onChanged;
  final String Function(T value) valueMapper;
  final Map<String, String Function(Object object)>? validationMessages;

  const DigitSearchDropdown({
    Key? key,
    required this.suggestionsCallback,
    this.onSuggestionSelected,
    required this.label,
    required this.menuItems,
    required this.formControlName,
    this.isRequired = false,
    required this.valueMapper,
    this.initialValue,
    this.onChanged,
    this.validationMessages,
    this.initialValueText,
  }) : super(key: key);

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
          DigitReactiveTypeAhead<T, T>(
            formControlName: formControlName,
            stringify: valueMapper,
            initialValue: initialValue,
            initialValueText: initialValueText,
            onSuggestionSelected: onSuggestionSelected,
            debounceDuration: const Duration(milliseconds: 100),
            suggestionsCallback: (pattern) => suggestionsCallback(
              menuItems,
              pattern,
            ),
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.all(kPadding * 2),
                child: Text(
                  valueMapper(item),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
