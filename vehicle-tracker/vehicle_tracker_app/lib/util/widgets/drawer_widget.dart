import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // ! USE SCROLLABLE CONTETNT
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    AppTranslation.appHeading.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(AppTranslation.home.tr),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(AppTranslation.about.tr),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DigitElevatedButton(
                      child: const Text("English"),
                      onPressed: () => Get.updateLocale(const Locale('en', 'IN')),
                    ),
                    DigitElevatedButton(
                      child: const Text("हिंदी"),
                      onPressed: () => Get.updateLocale(const Locale('hi', 'IN')),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          const PoweredByDigit()
        ],
      ),
    );
  }
}
