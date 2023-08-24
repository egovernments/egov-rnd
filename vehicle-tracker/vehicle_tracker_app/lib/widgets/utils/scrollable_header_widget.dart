import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/i18n_translations.dart';

Widget scrollableHeaderWidget(bool back, bool help) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      if (back)
        DigitIconButton(
          iconTextColor: Colors.black,
          iconText: AppTranslation.BACK.tr,
          iconColor: Colors.black,
          onPressed: () => Get.back(),
          icon: Icons.keyboard_arrow_left,
        ),
      if (help)
        DigitIconButton(
          iconText: AppTranslation.HELP.tr,
          onPressed: () => (log("help")),
          icon: Icons.help_outline_rounded,
        ),
    ],
  );
}
