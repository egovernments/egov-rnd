import 'package:flutter/material.dart';

import '../theme/digit_theme.dart';

class DigitOutLineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;

  const DigitOutLineButton({
    super.key,
    required this.label,
    this.onPressed,
    this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle ??
          OutlinedButton.styleFrom(
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
            minimumSize: Size(
              MediaQuery.of(context).size.width / 1.25,
              50,
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: kPadding * 2, right: kPadding * 2),
        child: Text(
          label,
          style: DigitTheme.instance.mobileTheme.textTheme.headlineSmall?.apply(
            color: onPressed != null
                ? theme.colorScheme.secondary
                : theme.colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
