import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';

class LangSelectCard extends StatelessWidget {
  const LangSelectCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;

    return Padding(
      padding: theme.verticalMargin,
      child: DigitCard(
        child: Column(
          children: [
            // * Heading
            Padding(
              padding: theme.buttonPadding,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("FSSM | Odisha"),
                ],
              ),
            ),

            // * Language Button
            Padding(
              padding: theme.buttonPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DigitElevatedButton(child: const Text("Hindi"), onPressed: () {}),
                  DigitOutLineButton(label: "English", onPressed: () => Get.updateLocale(const Locale('en', 'IN'))),
                ],
              ),
            ),

            // * Continue Button
            Padding(
              padding: theme.buttonPadding,
              child: DigitElevatedButton(child: const Text("Continue"), onPressed: () => Get.toNamed(LOGIN)),
            )
          ],
        ),
      ),
    );
  }
}
