import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/data/hive_service.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../constants.dart';
import '../../router/routes.dart';
import '../../util/logout.dart';
import 'custom_outline_button_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;
    final textTheme = theme.mobileTheme.textTheme;
    final userData = HiveService.getUserData();

    return Drawer(
      child: ScrollableContent(
        header: Container(
          color: DigitTheme.instance.colors.cloudGray,
          padding: theme.buttonPadding,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding * 13),
            child: Column(
              children: [
                Text(userData.name, style: textTheme.displayMedium),
                Text(userData.mobileNumber, style: textTheme.headlineLarge),
              ],
            ),
          ),
        ),
        footer: Padding(
          padding: theme.buttonPadding,
          child: const PoweredByDigit(),
        ),
        children: [
          DigitIconTile(
            title: AppTranslation.HOME.tr,
            onPressed: () {
              if (Get.currentRoute != HOME) {
                Get.toNamed(HOME);
              } else {
                Get.back();
              }
            },
            icon: Icons.home,
          ),
          DigitIconTile(
            title: Get.locale == ENG_LOCALE ? AppTranslation.ENGLISH.tr : AppTranslation.ODIA.tr,
            onPressed: () {},
            content: const LanguageButtonsWidget(),
            icon: Icons.language,
          ),
          DigitIconTile(
            title: AppTranslation.LOGOUT.tr,
            onPressed: logout,
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}

class LanguageButtonsWidget extends StatelessWidget {
  const LanguageButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Get.locale == ENG_LOCALE) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomOutLineButton(
            label: AppTranslation.ODIA.tr,
            onPressed: () => Get.updateLocale(ORI_LOCALE),
          ),
          DigitElevatedButton(
            child: Text(AppTranslation.ENGLISH.tr),
            onPressed: () => Get.updateLocale(ENG_LOCALE),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DigitElevatedButton(
          child: Text(AppTranslation.ODIA.tr),
          onPressed: () => Get.updateLocale(ORI_LOCALE),
        ),
        CustomOutLineButton(
          label: AppTranslation.ENGLISH.tr,
          onPressed: () => Get.updateLocale(ENG_LOCALE),
        ),
      ],
    );
  }
}
