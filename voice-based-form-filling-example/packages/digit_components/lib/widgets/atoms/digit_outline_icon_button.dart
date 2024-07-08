import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitOutlineIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;

  const DigitOutlineIconButton({
    super.key,
    this.iconColor,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.buttonStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kPadding,
        bottom: kPadding,
      ),
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40),
      child: OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle ??
            OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
        child: Padding(
          padding: const EdgeInsets.all(kPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Icon(
                icon,
                color: iconColor,
              )),
              const SizedBox(width: kPadding),
              Text(
                label,
                style: textStyle ??
                    DigitTheme.instance.mobileTheme.textTheme.headlineSmall
                        ?.apply(
                      color: onPressed != null
                          ? DigitTheme.instance.colorScheme.secondary
                          : DigitTheme.instance.colorScheme.outline,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
