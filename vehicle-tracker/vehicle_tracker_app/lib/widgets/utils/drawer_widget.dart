import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/trip_tracker_controllers.dart';
import 'package:vehicle_tracker_app/data/hive_service.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../constants.dart';
import '../../router/routes.dart';
import '../../util/logout.dart';
import 'custom_outline_button_widget.dart';
import 'languages_button_widget.dart';

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
          color: DigitTheme.instance.colors.quillGray,
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
            title: Get.locale == ENG_LOCALE
                ? AppTranslation.ENGLISH.tr
                : AppTranslation.ODIA.tr,
            onPressed: () {},
            content: const LanguageButtonsWidget(
                bottomPadding: false, isSideBar: true),
            icon: Icons.language,
          ),
          GetBuilder<TripControllers>(
            builder: (tripControllers) {
              return DigitIconTile(
                title: AppTranslation.LOGOUT.tr,
                // onPressed: (){
                  
                //   if(
                //   tripControllers.isLoading.isTrue ||
                //  tripControllers.isRunning.isTrue){
                //   tripControllers.endTrip(context, data);
                  
                //  }
                // },
                onPressed: logout,
                icon: Icons.logout,
              );
            }
          ),
        ],
      ),
    );
  }
}
