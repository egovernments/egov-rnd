import 'package:flutter/material.dart';

class DigitCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?>? onChanged;

  const DigitCheckbox({
    super.key,
    required this.label,
    this.onChanged,
    this.value = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: InkWell(
        onTap: () => onChanged?.call(!value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Checkbox(
                value: value,
                side: MaterialStateBorderSide.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return BorderSide(
                      width: 2.0,
                      color: theme.colorScheme.secondary,
                    );
                  }
                  return const BorderSide(width: 1.0);
                }),
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return theme.colorScheme.surface;
                  }
                  return theme.colorScheme.secondary;
                }),
                checkColor: theme.colorScheme.secondary,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
