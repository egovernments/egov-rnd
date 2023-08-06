import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  RxBool isCompleted = false.obs;

  void toggleCompleted() {
    isCompleted.value = !isCompleted.value;
  }

  startTrip(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: "Warning",
        titleIcon: const Icon(Icons.warning_rounded, color: Colors.red),
        contentText: "Start the trip only after reaching the pickup location.  Have you reached the applicant location?",
        primaryAction: DigitDialogActions(label: "Yes", action: (context) => Get.back()),
        secondaryAction: DigitDialogActions(label: "No", action: (context) => Get.back()),
      ),
    );
  }

  endTrip(BuildContext context, String locality) => DigitDialog.show(
        context,
        options: DigitDialogOptions(
          titleText: "Warning",
          titleIcon: const Icon(Icons.warning_rounded, color: Colors.red),
          contentText: "Are you sure to end the trip for $locality?",
          primaryAction: DigitDialogActions(label: "Yes", action: (context) => Get.back()),
          secondaryAction: DigitDialogActions(label: "No", action: (context) => Get.back()),
        ),
      );
}
