import 'package:digit_components/digit_components.dart';
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

    final theme = Theme.of(context);

    return ftoast.showToast(
      child: Container(
        color: options.isError
            ? options.theme.colorScheme.error
            : options.theme.colorScheme.onSurfaceVariant,
        padding:
            const EdgeInsets.symmetric(horizontal: kPadding, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              options.isError ? Icons.info_outline_rounded : Icons.check,
              color: Colors.white,
            ),
            const SizedBox(
              width: kPadding * 2,
            ),
            Expanded(
              child: Text(
                options.message,
                style: TextStyle(
                  fontSize: theme.textTheme.bodyLarge?.fontSize,
                  fontWeight: theme.textTheme.bodyLarge?.fontWeight,
                  color: const DigitColors().white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ftoast.removeCustomToast();
              },
              child: Icon(
                Icons.close,
                color: const DigitColors().white,
              ),
            ),
          ],
        ),
      ),
      gravity: ToastGravity.SNACKBAR,
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
