import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/i18n_translations.dart';

class ScrollableHeaderWidget extends StatelessWidget {
  const ScrollableHeaderWidget({super.key});

  final bool help = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DigitIconButton(
          iconText: AppTranslation.BACK.tr,
          onPressed: () => Get.back(),
          icon: Icons.keyboard_arrow_left,
        ),
        
        if (help) DigitIconButton(
          iconText: AppTranslation.HELP.tr,
          onPressed: () => (),
          icon: Icons.help_outline_rounded,
        ),
      ],
    );
  }
}
