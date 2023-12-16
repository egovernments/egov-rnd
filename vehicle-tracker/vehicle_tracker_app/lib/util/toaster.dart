// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toaster(BuildContext? context, String message, {bool isError = false, String? error}) {
  try {
    if (context == null) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: isError ? Colors.red : Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);

      log(message);

      if (error != null) {
        log("Error : $error");
      }
    } else {
      DigitToast2.show(
        context,
        options: DigitToastOptions(
          message,
          isError,
          DigitTheme.instance,
        ),
      );
    }
  } on Exception catch (e) {
    log("Normal Toast Error : $e");
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

class DigitToast2 {
  final DigitToastOptions options;

  static FToast ftoast = FToast();

  @visibleForTesting
  DigitToast2({
    required this.options,
  });

  static show<T>(
    BuildContext context, {
    required DigitToastOptions options,
  }) {
    ftoast.init(context);

    return ftoast.showToast(
      child: Container(
        color: options.isError ? options.theme.colorScheme.error : options.theme.colors.darkSpringGreen,
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
  DigitTheme theme;

  DigitToastOptions(
    this.message,
    this.isError,
    this.theme,
  );
}
