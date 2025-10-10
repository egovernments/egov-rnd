import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../constants.dart';

class LangSelectCard extends StatelessWidget {
  const LangSelectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;
    final textTheme = theme.mobileTheme.textTheme;

    return Padding(
      padding: theme.verticalMargin,
      child: DigitCard(
        child: Column(
          children: [
            // * Heading
            Padding(
              padding: theme.buttonPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppTranslation.LOGIN.tr, style: textTheme.headlineLarge),
                ],
              ),
            ),

            // * Language Button
            LanguageButtonWidget(theme: theme),

            // * Continue Button
            Padding(
              padding: theme.buttonPadding,
              child: DigitElevatedButton(child: Text(AppTranslation.CONTINUE.tr), onPressed: () => Get.toNamed(LOGIN)),
            )
          ],
        ),
      ),
    );
  }
}

class LanguageButtonWidget extends StatelessWidget {
  const LanguageButtonWidget({
    super.key,
    required this.theme,
  });

  final DigitTheme theme;

  @override
  Widget build(BuildContext context) {
    if (Get.locale == ENG_LOCALE) {
      return Padding(
        padding: theme.buttonPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DigitOutLineButton(
              label: AppTranslation.ODIA.tr,
              onPressed: () => Get.updateLocale(ORI_LOCALE),
            ),
            DigitElevatedButton(
              child: Padding(
                padding: theme.buttonPadding * 0.4,
                child: Text(AppTranslation.ENGLISH.tr),
              ),
              onPressed: () => Get.updateLocale(ENG_LOCALE),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: theme.buttonPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DigitElevatedButton(
            child: Padding(
              padding: theme.buttonPadding * 0.4,
              child: Text(AppTranslation.ODIA.tr),
            ),
            onPressed: () => Get.updateLocale(ORI_LOCALE),
          ),
          DigitOutLineButton(
            label: AppTranslation.ENGLISH.tr,
            onPressed: () => Get.updateLocale(ENG_LOCALE),
          ),
        ],
      ),
    );
  }
}
