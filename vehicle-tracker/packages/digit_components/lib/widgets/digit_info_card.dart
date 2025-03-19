import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final Color? backgroundColor;
  final IconData? icon;
  final Color? iconColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const DigitInfoCard({
    super.key,
    required this.title,
    required this.description,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin ?? DigitTheme.instance.containerMargin,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        color: backgroundColor ?? theme.colorScheme.tertiaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.all(8),
                child: Icon(
                  icon ?? Icons.info,
                  color: iconColor ?? theme.colorScheme.surfaceTint,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.headlineMedium,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Text(
              description,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
