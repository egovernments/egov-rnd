import 'package:flutter/material.dart';

class DigitTableItemTitle extends StatelessWidget {
  final double? width;
  final String label;
  final double? height;
  final EdgeInsets? padding;

  const DigitTableItemTitle({
    super.key,
    this.width,
    required this.label,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: theme.textTheme.bodyMedium,
      ),
    );
  }
}
