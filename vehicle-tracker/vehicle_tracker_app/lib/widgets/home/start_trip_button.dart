import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';
import '../../models/home_trip/home_trip_model/home_trip_model.dart';
import '../../util/i18n_translations.dart';

class StartTripButton extends StatefulWidget {
  const StartTripButton({super.key, required this.data});
  final Rx<HomeTripModel> data;

  @override
  State<StartTripButton> createState() => _StartTripButtonState();
}

class _StartTripButtonState extends State<StartTripButton> {
  @override
  Widget build(BuildContext context) {
    final tripControllers = Get.find<TripControllers>();

    return Obx(() {
      if (widget.data.value.status == "RUNNING") {
        return Center(
          child: DigitOutLineButton(
              label: AppTranslation.END_TRIP.tr,
              onPressed: () async {
                tripControllers.isLoading.toggle();
                bool res = await tripControllers.endTrip(context, widget.data.value.id);
                if (!res) {
                  tripControllers.isLoading.toggle();
                  return;
                }
                setState(() => widget.data.value.status = "COMPLETED");
                tripControllers.isLoading.toggle();
              }),
        );
      }

      if (widget.data.value.status == "COMPLETED") {
        return Center(
          child: DigitOutLineButton(
            label: "Trip Completed",
            onPressed: () {},
          ),
        );
      }

      return DigitElevatedButton(
        child: Text(AppTranslation.START_TRIP.tr),
        onPressed: () async {
          tripControllers.isLoading.toggle();
          bool res = await tripControllers.startTrip(context, widget.data.value.id);
          if (!res) {
            tripControllers.isLoading.toggle();
            return;
          }
          setState(() => widget.data.value.status = "RUNNING");
          tripControllers.isLoading.toggle();
        },
      );
    });
  }
}
