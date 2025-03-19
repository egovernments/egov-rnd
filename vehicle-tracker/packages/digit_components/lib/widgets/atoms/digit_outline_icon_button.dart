import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitOutlineIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;

  const DigitOutlineIconButton({
    super.key,
    this.iconColor,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Icon(icon)),
          const SizedBox(width: kPadding),
          Text(label),
        ],
      ),
    );
  }
}
