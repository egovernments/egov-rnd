import 'package:flutter/material.dart';

class DigitIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? iconText;
  final IconData? icon;
  final double? iconSize;
  final ImageIcon? imageIcon;
  final Color? iconColor;
  final Color? iconTextColor;

  const DigitIconButton({
    super.key,
    this.onPressed,
    this.iconText,
    this.icon,
    this.iconSize,
    this.imageIcon,
    this.iconColor,
    this.iconTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: theme.colorScheme.onBackground,
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: imageIcon ??
                Icon(
                  icon,
                  size: iconSize,
                  color: iconColor ?? theme.colorScheme.secondary,
                ),
          ),
          const SizedBox(
            width: 4,
          ),
          if (iconText != null)
            Text(
              iconText!,
              style: TextStyle(
                  color: iconTextColor ?? theme.colorScheme.secondary,
                  fontSize: 16),
            ),
        ],
      ),
    );
  }
}
