import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toaster(BuildContext? context, String message, {bool isError = false}) {
  if (true) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    return;
  }

  // DigitToast.show(context, options: DigitToastOptions(message, isError, DigitTheme.instance.mobileTheme));
}
