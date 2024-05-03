import 'package:flutter/material.dart';

class LabeledField extends StatelessWidget {
  final Widget child;
  final String label;
  final IconData? icon;
  final String? tooltipMessage;

  const LabeledField(
      {super.key,
      required this.child,
      required this.label,
      this.icon,
      this.tooltipMessage});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                icon != null
                    ? Tooltip(
                        message: tooltipMessage ?? '',
                        preferBelow: false,
                        triggerMode: TooltipTriggerMode.tap,
                        child: Icon(icon ?? Icons.info_outline))
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      );
}
