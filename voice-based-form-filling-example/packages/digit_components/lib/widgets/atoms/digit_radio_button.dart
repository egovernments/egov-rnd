import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DigitRadioListTile extends StatelessWidget {
  final Object groupValue;
  final Widget title;
  final Function onchange;
  final Object value;
  final String formControlName;

  const DigitRadioListTile({
    super.key,
    required this.groupValue,
    required this.title,
    required this.onchange,
    required this.value,
    required this.formControlName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ReactiveRadio(
      formControlName: formControlName,
      activeColor: theme.colorScheme.secondary,
      onChanged: (value) => onchange,
      value: value,
    );
  }
}
