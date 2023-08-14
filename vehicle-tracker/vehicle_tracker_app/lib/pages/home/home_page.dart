import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/info_controllers.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../widgets/drawer_widget.dart';
import '../../widgets/home/trip_info_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final infoController = Get.find<InfoController>();
    final theme = DigitTheme.instance;

    return SafeArea(
      child: Scaffold(
        // * Appbar
        appBar: AppBar(
          centerTitle: false,
          title: Text(AppTranslation.HOME_APP_BAR.tr),
        ),

        // * Dwawer
        drawer: const CustomDrawer(),

        // * Body
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Help Button
            Align(
              alignment: Alignment.topRight,
              child: DigitIconButton(
                icon: Icons.help_outline_rounded,
                iconText: AppTranslation.HELP.tr,
                onPressed: () {},
              ),
            ),

            // * App heading
            Padding(
              padding: theme.buttonPadding,
              child: Text(
                AppTranslation.MY_TRIPS.tr,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),

            // * Digiit Search Bar
            DigitSearchBar(
              controller: infoController.searchController,
              hintText: AppTranslation.SEARCH_BAR.tr,
              onChanged: (value) {
                infoController.isTextControllerEmpty.value = value.isEmpty;
                infoController.onChangedFilter(value);
              },
            ),

            const SizedBox(height: 8),

            // * button bar for IN-PROGRESS and COMPLETED
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DigitOutLineButton(
                  label: AppTranslation.IN_PROGRESS.tr,
                  onPressed: () => (),
                ),
                DigitOutLineButton(
                  label: AppTranslation.COMPLETED.tr,
                  onPressed: () => (),
                ),
              ],
            ),

            // * trip list builder widget
            TripInfoListBuilderWidget(infoController: infoController),
          ],
        ),
      ),
    );
  }
}
