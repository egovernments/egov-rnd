import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../constants.dart';
import '../utils/languages_button_widget.dart';

class LangSelectCard extends StatelessWidget {
  const LangSelectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;
    final textTheme = theme.mobileTheme.textTheme;

    return Padding(
      padding: theme.verticalMargin,
      child: DigitCard(
        child: Padding(
          padding: theme.buttonPadding,
          child: Column(
            children: [
              // * Heading
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppTranslation.LOGIN.tr, style: textTheme.headlineLarge),
                ],
              ),

              // * Language Button
              const LanguageButtonsWidget(
                  bottomPadding: false, isSideBar: false),

              // * Continue Button
              DigitElevatedButton(
                  child: Text(AppTranslation.CONTINUE.tr),
                  onPressed: () => Get.toNamed(LOGIN))
            ],
          ),
        ),
      ),
    );
  }
}
