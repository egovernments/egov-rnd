import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/drawer_widget.dart';

import '../../blocs/home/controllers/trip_controllers.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tripControllers = Get.find<TripControllers>();

    return SafeArea(
      child: Scaffold(
        // * App Bar
        appBar: AppBar(),

        // * Drawer
        drawer: const CustomDrawer(),

        // * Body
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ScrollableContent(
            crossAxisAlignment: CrossAxisAlignment.start,

            // * Footer
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DigitElevatedButton(
                child: Text(AppTranslation.START_TRIP.tr),
                onPressed: () => tripControllers.startTrip(context),
              ),
            ),

            // * Body
            children: [
              // * Back Button
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DigitIconButton(iconText: AppTranslation.BACK.tr, onPressed: () => Get.back(), icon: Icons.keyboard_arrow_left),
                  DigitIconButton(iconText: AppTranslation.HELP.tr, onPressed: () {}, icon: Icons.help_outline_rounded),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}