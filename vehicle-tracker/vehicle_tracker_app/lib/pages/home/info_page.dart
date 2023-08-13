import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/trip_controllers.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/drawer_widget.dart';
import 'package:vehicle_tracker_app/widgets/scrollable_header_widget.dart';

import '../../models/home_trip/home_trip_model/home_trip_model.dart';
import '../../widgets/home/info_page_widget.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tripControllers = Get.find<TripControllers>();
    final theme = DigitTheme.instance;
    final HomeTripModel data = Get.arguments as HomeTripModel;

    return SafeArea(
      child: Scaffold(
        // * App Bar
        appBar: AppBar(),

        // * Drawer
        drawer: const CustomDrawer(),

        // * Body
        body: ScrollableContent(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // * Footer
          footer: Padding(
            padding: theme.buttonPadding,
            child: DigitElevatedButton(
              child: Text(AppTranslation.START_TRIP.tr),
              onPressed: () => tripControllers.startTrip(context),
            ),
          ),

          header:  scrollableHeaderWidget(true, false),

          // * Body
          children: [
            DigitCard(
              padding: theme.buttonPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    data.routeId.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  textColumnWidget(data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
