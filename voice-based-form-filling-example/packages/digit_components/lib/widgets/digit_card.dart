import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;

  const DigitCard({
    required this.child,
    super.key,
    this.padding,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Card(
        margin: margin,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: onPressed,
          child: Padding(
            padding: padding ??
                const EdgeInsets.only(
                  left: kPadding,
                  right: kPadding,
                  top: kPadding * 2,
                  bottom: kPadding * 2,
                ),
            child: child,
          ),
        ),
      );
}
