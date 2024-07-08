import 'package:digit_components/widgets/atoms/checkbox_icon.dart';
import 'package:flutter/material.dart';

/*A single checkbox component */
class DigitCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?>? onChanged;
  final EdgeInsetsGeometry padding;

  // Constructor for the DigitCheckbox widget with required parameters
  const DigitCheckbox({
    super.key,
    required this.label,
    this.onChanged,
    this.value = false,
    this.padding = const EdgeInsets.only(left: 4.0),
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: padding,
      child: InkWell(
        onTap: () => onChanged?.call(!value),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 24,
                width: 24,
                child: CheckboxIcon(
                  value: value,
                )),
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
