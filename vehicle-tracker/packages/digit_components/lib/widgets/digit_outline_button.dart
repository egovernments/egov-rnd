import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DigitOutLineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const DigitOutLineButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Colors.white,
        side: BorderSide(
          width: 1.0,
          color: onPressed != null
              ? theme.colorScheme.secondary
              : theme.colorScheme.outline,
        ),
        minimumSize: kIsWeb
            ? Size(
                MediaQuery.of(context).size.width / 11.25,
                40,
              )
            : Size(
                MediaQuery.of(context).size.width / 1.25,
                50,
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Text(
          label,
          style: TextStyle(
            color: theme.colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
