import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';
import '../../models/home_trip/home_trip_model/home_trip_model.dart';
import '../../util/i18n_translations.dart';

class StartTripButton extends StatelessWidget {
  const StartTripButton({super.key, required this.data});
  final Rx<HomeTripModel> data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripControllers>(
      id: data.value.id,
      builder: (tripControllers) {
        if (data.value.status == TripStates.PROGRESS) {
          return Center(child: CircularProgressIndicator(color: DigitTheme.instance.colors.mangoOrange));
        }

        if (data.value.status == TripStates.RUNNING) {
          return Center(
            child: DigitOutLineButton(
              label: AppTranslation.END_TRIP.tr,
              onPressed: () async {
                await tripControllers.endTrip(context, data);
              },
            ),
          );
        }

        if (data.value.status == TripStates.COMPLETED) {
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
            if (tripControllers.isLoading.isTrue || tripControllers.isRunning.isTrue) {
              toaster(context, "Only one trip can be started at a time", isError: true);
              return;
            }

            await tripControllers.startTrip(context, data);
          },
        );
      },
    );
  }
}
