import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DigitToast {
  final DigitToastOptions options;

  static FToast ftoast = FToast();

  @visibleForTesting
  DigitToast({
    required this.options,
  });

  static show<T>(
    BuildContext context, {
    required DigitToastOptions options,
  }) {
    ftoast.init(context);

    return ftoast.showToast(
      child: Container(
        color: options.isError
            ? options.theme.colorScheme.error
            : options.theme.colorScheme.surfaceVariant,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              options.isError ? Icons.info_outline_rounded : Icons.check,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
                child: Text(
              options.message,
              style: const TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: DigitTheme.instance.toastDuration,
    );
  }
}

class DigitToastOptions {
  final String message;
  final bool isError;
  ThemeData theme;

  DigitToastOptions(this.message, this.isError, this.theme);
}
