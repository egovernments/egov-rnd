import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

/* A customizable dialog with multiple action button widgets arranged in Column .*/
class DigitActionDialog extends StatelessWidget {
  final Widget widget;

  /*Constructor for the DigitActionDialog widget with required parameters
   'widget' parameter is required, and it represents the content of the dialog.*/
  const DigitActionDialog({super.key, required this.widget});

  // A static method to show the DigitActionDialog as a dialog using the showDialog function.
  // It takes the 'context' and the 'widget' as parameters and returns a Future with a result of type T.
  static Future<T?> show<T>(BuildContext context,
          {required final Widget widget}) =>
      showDialog<T>(
          context: context,
          barrierColor: DigitTheme.instance.colors.black.withOpacity(0.7),
          builder: (context) => DigitActionDialog(widget: widget));

  @override
  Widget build(BuildContext context) => Center(
        child: Wrap(
          children: [
            AlertDialog(
              insetPadding: EdgeInsets.zero,
              content: widget,
              contentPadding: const EdgeInsets.fromLTRB(
                  kPadding, kPadding * 2, kPadding, kPadding * 2),
            ),
          ],
        ),
      );
}
