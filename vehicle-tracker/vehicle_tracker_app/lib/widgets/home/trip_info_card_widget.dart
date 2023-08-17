import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/home/info_page_widget.dart';
import 'package:vehicle_tracker_app/widgets/home/start_trip_button.dart';

class TripInfoCardWidget extends StatelessWidget {
  const TripInfoCardWidget({super.key, required this.data});
  final Rx<HomeTripModel> data;

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Locality Heading
          Text(
            data.value.routeId.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),

          homeTextColumnWidget(data.value.operator.name, data.value.operator.contactNumber),

          DigitIconButton(
            iconText: AppTranslation.VIEW_DETAILS.tr,
            icon: Icons.arrow_forward,
            onPressed: () => Get.toNamed(INFO, arguments: data),
          ),

          StartTripButton(data: data)
        ],
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
