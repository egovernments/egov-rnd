import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DigitOutLineButton(label: "Hindi", onPressed: () => Get.updateLocale(const Locale('hi', 'IN'))),
              const SizedBox(width: 20),
              DigitOutLineButton(label: "English", onPressed: () => Get.updateLocale(const Locale('en', 'IN'))),
            ],
          ),

          const SizedBox(height: 20),

          // * Continue Button
          DigitElevatedButton(child: const Text("Continue"), onPressed: () {})
        ],
      ),
    );
  }
}
