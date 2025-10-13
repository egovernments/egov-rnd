import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/info_controllers.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/home/toggle_switch.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';
import '../../widgets/utils/drawer_widget.dart';
import '../../widgets/home/trip_info_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TripControllers(context), permanent: true);
    final infoController = Get.find<InfoController>();

    final theme = DigitTheme.instance;
    final textTheme = theme.mobileTheme.textTheme;

    return SafeArea(
      child: Scaffold(
        // * Appbar
        appBar: AppBar(
          centerTitle: false,
          // title: Text(AppTranslation.HOME_APP_BAR.tr),
        ),

        // * Dwawer
        drawer: const CustomDrawer(),

        // * Body
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Help Button
            Padding(
              padding: theme.buttonPadding,
              child: Align(
                alignment: Alignment.topRight,
                child: DigitIconButton(
                  icon: Icons.help_outline_rounded,
                  iconText: AppTranslation.HELP.tr,
                  onPressed: () {},
                ),
              ),
            ),

            // * App heading
            Padding(
              padding: theme.buttonPadding,
              child: Text(
                AppTranslation.MY_TRIPS.tr,
                style: textTheme.displayMedium,
              ),
            ),

            // * Digiit Search Bar
            DigitSearchBar(
              controller: infoController.searchController,
              hintText: AppTranslation.SEARCH_BAR_HINT.tr,
              onChanged: (value) {
                infoController.isTextControllerEmpty.value = value.isEmpty;
                infoController.onChangedFilter(value);
              },
            ),

            // * button bar for IN-PROGRESS and COMPLETED
            Padding(
              padding: theme.verticalMargin * 2,
              child: Center(child: toggler(context, infoController)),
            ),

            // * trip list builder widget
            TripInfoListBuilderWidget(infoController: infoController),
          ],
        ),
      ),
    );
  }
}
