import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/utils/drawer_widget.dart';
import 'package:vehicle_tracker_app/widgets/home/trip_button.dart';
import 'package:vehicle_tracker_app/widgets/utils/scrollable_header_widget.dart';

import '../../models/home_trip/home_trip_model/home_trip_model.dart';
import '../../widgets/home/info_page_widget.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;
    final textTheme = theme.mobileTheme.textTheme;
    final Rx<HomeTripModel> data = Get.arguments as Rx<HomeTripModel>;

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
            padding: DigitTheme.instance.buttonPadding,
            child: StartTripButton(data: data),
          ),

          header: scrollableHeaderWidget(true, false),

          // * Body
          children: [
            DigitCard(
              padding: theme.buttonPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppTranslation.DETAILS.tr,
                    style: textTheme.headlineLarge,
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
