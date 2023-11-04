import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toaster(BuildContext? context, String message, {bool isError = false, String? error}) {
  try {
    if (context == null) {
      if (true) {
        Fluttertoast.showToast(
            msg: message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: isError ? Colors.red : Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        log(message);
      }

      if (error != null) {
        log("Error : $error");
      }
    } else {
      DigitToast.show(
        context,
        options: DigitToastOptions(
          message,
          isError,
          DigitTheme.instance.mobileTheme,
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
