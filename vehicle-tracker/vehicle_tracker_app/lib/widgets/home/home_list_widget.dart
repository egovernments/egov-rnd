import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/home/info_page_widget.dart';

import '../../blocs/home/controllers/info_controllers.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({super.key, required this.data});
  final HomeTripModel data;

  @override
  Widget build(BuildContext context) {
    final inboxController = Get.find<InfoController>();

    return Obx(
      () => DigitCard(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Locality Heading
              Text(
                data.routeId.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),

              homeTextColumnWidget(data.operator.name, data.operator.contactNumber),

              // ! Have to reverse the direction of arrow position
              DigitIconButton(
                iconText: AppTranslation.VIEW_DETAILS.tr,
                icon: Icons.arrow_forward,
                onPressed: () => Get.toNamed(INFO, arguments: data),
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

Widget homeTextColumnWidget(String name, String phoneNumber) => Padding(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paddedText(name),
              paddedText(phoneNumber),
            ],
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
