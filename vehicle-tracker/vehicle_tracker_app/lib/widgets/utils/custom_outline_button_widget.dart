import 'package:flutter/material.dart';

class CustomOutLineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const CustomOutLineButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: theme.colorScheme.secondary,
        ),
      ),
    );
  }
}
