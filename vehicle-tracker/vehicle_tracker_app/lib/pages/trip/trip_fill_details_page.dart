import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/widgets/utils/drawer_widget.dart';
import 'package:vehicle_tracker_app/widgets/home/info_page_widget.dart';

import '../../blocs/details/controllers/detail_controller.dart';
import '../../widgets/utils/scrollable_header_widget.dart';
import '../../widgets/trip/trip_fill_details_widget.dart';

class TripFillDetailsPage extends StatelessWidget {
  const TripFillDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final detailController = Get.find<DetailController>();

    return Scaffold(
      // * AppBar
      appBar: AppBar(
        // title: Text(AppTranslation.HOME_APP_BAR.tr),
        centerTitle: false,
      ),

      // * Drawer
      drawer: const CustomDrawer(),

      // * Body
      body: ScrollableContent(
        // * Heaers
        header: scrollableHeaderWidget(true, true),

        // * Main Body
        children: [
          DigitCard(
            child: Padding(
              padding: DigitTheme.instance.buttonPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  paddedText("Please fill the details", bold: true),
                  paddedText("Septic Tank Type"),

                  // * Tank selector
                  Obx(() => tankTypeSelector(detailController)),

                  paddedText("Septic Tank Size", bold: true),

                  // * Size input
                  const Row(
                    children: [
                      Flexible(child: DigitTextField(label: "Length")),
                      Flexible(child: DigitTextField(label: "Breadth")),
                      Flexible(child: DigitTextField(label: "Height")),
                    ],
                  ),

                  // * Submit button
                  skipNextButton(detailController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
