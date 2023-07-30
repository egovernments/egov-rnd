import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';

toaster(BuildContext context, String message, {bool isError = false}) {
  DigitToast.show(context, options: DigitToastOptions(message, isError, DigitTheme.instance.mobileTheme));
}