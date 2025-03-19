import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitActionDialog extends StatelessWidget {
  final Widget widget;

  const DigitActionDialog({super.key, required this.widget});

  static Future<T?> show<T>(BuildContext context,
          {required final Widget widget}) =>
      showDialog<T>(
          context: context,
          barrierColor: DigitTheme.instance.colors.black.withOpacity(0.7),
          builder: (context) => DigitActionDialog(widget: widget));

  @override
  Widget build(BuildContext context) => AlertDialog(
        insetPadding: EdgeInsets.zero,
        content: widget,
      );
}
