import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_tracker_app/themes.dart';

toaster(BuildContext context, String message, {bool isError = false}) {
  DigitToast.show(context, options: DigitToastOptions(message, isError, CustomTheme.toastTheme));
}