import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';

import '../../blocs/home/controllers/trip_tracker_controllers.dart';
import '../../models/home_trip/home_trip_model/home_trip_model.dart';
import '../../util/i18n_translations.dart';

class StartTripButton extends StatelessWidget {
  StartTripButton({Key? key, required this.data}) : super(key: key);
  final Rx<HomeTripModel> data;
  final TripControllers tripControllers = Get.find<TripControllers>();

  @override
  Widget build(BuildContext context) {
    if (data.value.status == TripStates.ONGOING) {
      log("Running previous trip");
      tripControllers.startPeriodicFunction(data.value);
    }

    return GetBuilder<TripControllers>(
      id: data.value.id,
      builder: (tripControllers) {
        if (data.value.status == TripStates.LOADING) {
          return Center(
              child: CircularProgressIndicator(
                  color: DigitTheme.instance.colors.mangoOrange));
        } else if (data.value.status == TripStates.ONGOING) {
          return SizedBox(
            width: double.infinity,
            child: DigitOutLineButton(
              label: AppTranslation.END_TRIP.tr,
              onPressed: () async {
                await tripControllers.endTrip(context, data);
              },
            ),
          );
        } else if (data.value.status == TripStates.COMPLETED) {
          return const Offstage();
        } else {
          return DigitElevatedButton(
            child: Text(AppTranslation.START_TRIP.tr),
            onPressed: () async {
              if (tripControllers.isLoading.isTrue ||
                  tripControllers.isRunning.isTrue) {
                toaster(AppTranslation.TRIP_RUNNING_MESSAGE.tr, isError: true);
                return;
              }
              await tripControllers.startTrip(context, data);
            },
          );
        }
      },
    );
  }
}
