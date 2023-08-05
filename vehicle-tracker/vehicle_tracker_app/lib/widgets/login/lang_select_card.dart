import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

class LangSelectCard extends StatelessWidget {
  const LangSelectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        children: [
          // * Heading
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("FSSM | Odisha"),
            ],
          ),

          // * Language Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DigitOutLineButton(label: "Hindi", onPressed: () => Get.updateLocale(const Locale('hi', 'IN'))),
              DigitOutLineButton(label: "English", onPressed: () => Get.updateLocale(const Locale('en', 'IN'))),
            ],
          ),

          // * Continue Button
          Padding(
            padding: DigitTheme.instance.buttonPadding,
            child: DigitElevatedButton(child: Text(AppTranslation.EMAIL_RESET.tr), onPressed: () => Get.toNamed(LOGIN)),
          )
        ],
      ),
    );
  }
}
