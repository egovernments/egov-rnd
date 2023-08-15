import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toaster(BuildContext? context, String message, {bool isError = false}) {
  if (context == null) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    return;
  }

  DigitToast.show(context, options: DigitToastOptions(message, isError, DigitTheme.instance.mobileTheme));
}
