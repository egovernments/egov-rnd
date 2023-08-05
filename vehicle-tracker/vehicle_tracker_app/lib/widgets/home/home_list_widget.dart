import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/home/info_page_widget.dart';

import '../../blocs/home/controllers/inbox_controllers.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inboxController = Get.find<InboxController>();

    return Obx(
      () => DigitCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Locality Heading
              const Text("-- Locality Name --"),

              homeTextColumnWidget(["values"]),

              // ! Have to reverse the direction of arrow position
              DigitIconButton(
                iconText: AppTranslation.VIEW_DETAILS.tr,
                icon: Icons.arrow_forward,
                onPressed: () => Get.toNamed(INFO),
              ),

              // ! change after API integration
              inboxController.isCompleted.value
                  ? Center(
                      child: DigitOutLineButton(
                      label: AppTranslation.END_TRIP.tr,
                      onPressed: () {},
                    ))
                  : DigitElevatedButton(
                      child: Text(AppTranslation.START_TRIP.tr),
                      onPressed: () {},
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget homeTextColumnWidget(List<String> values) => Padding(
      padding: DigitTheme.instance.verticalMargin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddedText("Name", bold: true),
              paddedText("Mobile Number", bold: true),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              paddedText(values[0]),
              paddedText(values[0]),
            ],
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
