import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

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
                  Text(AppTranslation.APP_HEADING.tr, style: textTheme.headlineLarge),
                ],
              ),
            ),

            // * Language Button
            Padding(
              padding: theme.buttonPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DigitElevatedButton(
                      child: Padding(
                        padding: theme.buttonPadding * 0.4,
                        child: const Text("Hindi"),
                      ),
                      onPressed: () {}),
                  DigitOutLineButton(
                    label: AppTranslation.ENGLISH.tr,
                    onPressed: () => Get.updateLocale(
                      const Locale('en', 'IN'),
                    ),
                  ),
                ],
              ),
            ),

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
