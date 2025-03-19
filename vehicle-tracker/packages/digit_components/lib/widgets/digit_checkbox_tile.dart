import 'package:flutter/material.dart';

class DigitCheckboxTile extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool>? onChanged;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const DigitCheckboxTile({
    this.value = false,
    required this.label,
    this.onChanged,
    this.padding,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: margin ?? const EdgeInsets.all(8.0),
      child: Material(
        child: InkWell(
          onTap: () => onChanged?.call(!value),
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
            child: Row(
              children: [
                Icon(
                  value
                      ? Icons.check_box_outline_blank_sharp
                      : Icons.check_box_outlined,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
