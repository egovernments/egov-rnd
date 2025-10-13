// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/blocs/home/controllers/info_controllers.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_hive_repository.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_http_repository.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/models/trip/trip_tracker_info/trip_tracker_hive_model.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';
import 'package:vehicle_tracker_app/util/trip_tracker_utility.dart';
import 'package:wakelock/wakelock.dart';

class TripControllers extends GetxController {
  final BuildContext context;

  RxBool isRunning = false.obs; // This variable is to check if the tracking is running or not
  RxBool isLoading = false.obs; // This variable is to check if startTracking is loading or not

  HomeHTTPRepository homeHTTPRepository = HomeHTTPRepository();
  HomeHiveRepository homeHiveRepository = HomeHiveRepository();
  TripTrackerUtility tripTrackerUtility = TripTrackerUtility();
  InfoController infoController = Get.find<InfoController>();

  TripControllers(this.context);

  // * This function starts the tracking peroiodic event
  Future<void> startTracking(Rx<HomeTripModel> data) async {
    log('---- Trip and Tracking started ----');

    log("Start TRIP API");
    final status = await homeHTTPRepository.updateTrip(data.value, TripStates.ONGOING);
    if (!status) {
      toaster(null, AppTranslation.TRIP_NOT_STARTED_MESSAGE.tr, isError: true);
      data.value.status = TripStates.NOTSTARTED;
      update([data.value.id]);
      return;
    }

    toaster(null, AppTranslation.TRIP_STARTED_SUCCESFULLY_MESSAGE.tr, isError: false);

    data.value.status = TripStates.ONGOING;
    update([data.value.id]);

    // Calls the periodic function
    startPeriodicFunction(data.value);
  }

  // ? This functions starts a timer which will call the trackerLogic function every n seconds
  // ? The timer will stop if the isRunning variable is false
  // ? The main point on this function is to get and send tracker function like a cron schedule
  void startPeriodicFunction(HomeTripModel trip) {
    log('Periodic function started');
    isRunning.value = true;

    Timer.periodic(Duration(seconds: periodicTrackingFrequency), (_) async {
      log("Periodic function called");
      if (!isRunning.value) {
        log("Periodic function stopped");
        _.cancel();
      } else {
        trackerLogic("In Progress", trip);
      }
    });
  }

  // ? The tracker logic function which checks location permissions and gets the current position
  // ? If the location permissions are not granted, the function will stop and return early
  // ? If the location permissions are granted, the function will get the current location and use it accordingly
  Future<void> trackerLogic(String alert, HomeTripModel trip) async {
    bool permissions = await tripTrackerUtility.handleLocationPermission(Get.context);
    if (!permissions) {
      isRunning.value = false;
      log('Location permissions not granted');
      return;
    } else {
      log('Location permissions are granted');
    }

    log("Getting current location");
    Position? currentPosition = await tripTrackerUtility.getCurrentLocation();
    if (currentPosition == null) {
      log("Error getting current location");
      return;
    }

    log("Calling position sender logic");
    await positionSender(currentPosition, alert, trip);

    log(" ---- Tracker Logic Completed ----");
  }

  // ? This function is responsible to send the API or store the tracking data to hive
  // ? It will check if the device is connected to internet or not
  // ? If there is internet connection, it will send the data to server
  // ? If by any chance the data sending fails, it will store the data to hive
  Future<bool> positionSender(Position? position, String alert, HomeTripModel trip) async {
    TripHiveModel tripHiveModel = TripHiveModel(
      latitude: position?.latitude ?? 0,
      longitude: position?.longitude ?? 0,
      timestamp: DateTime.now().toIso8601String(),
    );
    final isConnected = await tripTrackerUtility.isConnected();

    // If connected to internet, try send the position to server
    // Else save the position to hive
    if (isConnected) {
      // Getting all the latlng from hive and adding the current position to the list
      log("Getting all the positions from hive");
      List<TripHiveModel> positions = homeHiveRepository.getTripData();
      positions.add(tripHiveModel);

      // Sending the positions to the server
      // if success delete the hive data
      // else save the data to hive
      log("Sending position to server");
      final status = await homeHTTPRepository.updateTripProgress(trip, positions);
      if (status) {
        log("Position sent successfully");
        await homeHiveRepository.deleteTripData();
        toaster(null, AppTranslation.POSITION_SENT_MESSAGE.tr);
        return status;
      } else {
        // If the position sending fails, save the data to hive
        log("Error sending position, saving to hive");
        homeHiveRepository.storeTripData(tripHiveModel);
        return status;
      }
    } else {
      // If not connected to internet, save the data to hive
      log("No internet connection, saving to hive");
      await homeHiveRepository.storeTripData(tripHiveModel);
      toaster(null, AppTranslation.POSITION_HIVE_STORE_MESSAGE.tr);
      return false;
    }
  }

  // ? Checks if any previous trip is running or not
  // ? If not completed, it will show a toast message
  bool spamChecker(BuildContext context) {
    if (isLoading.isTrue) {
      toaster(
        context,
        AppTranslation.START_LOADING_MESSAGE.tr,
        isError: true,
      );
      return true;
    }

    return false;
  }

  // ? This function starts the trip
  Future<void> startTripFunction(Rx<HomeTripModel> data) async {
    // updates the UI
    data.value.status = TripStates.LOADING;
    update([data.value.id]);

    // prevents the screen from sleeping
    Wakelock.enable();

    Get.back();

    // calls the startTracking function
    isLoading.toggle();
    await startTracking(data);
    data.value.status = TripStates.ONGOING;
    update([data.value.id]);

    isLoading.toggle();
  }

  // ? This function stops the trip
  void endTripFunction(Rx<HomeTripModel> data) async {
    log("End trip function called");

    data.value.status = TripStates.LOADING;
    update([data.value.id]);

    Get.back();

    final status = await homeHTTPRepository.updateTrip(data.value, TripStates.COMPLETED);
    if (!status) {
      data.value.status = TripStates.ONGOING;
      update([data.value.id]);
      toaster(null, AppTranslation.TRIP_NOT_END_MESSAGE.tr, isError: true);
      return;
    }

    toaster(null, AppTranslation.TRIP_ENDED_SUCCESFULLY_MESSAGE.tr, isError: false);

    log("Deleting trip data from hive");
    await homeHiveRepository.deleteTripData();

    data.value.status = TripStates.COMPLETED;
    update([data.value.id]);

    // removes the trip from the normal trip list and adds it to the completed trip list
    infoController.normalTripList.remove(data);
    infoController.completedTripList.add(data);

    // gives the screen the permission to sleep
    Wakelock.disable();

    // stops the periodic function
    isRunning.value = false;

    update();
  }

  // ? Start trip dialog box by using the tripId
  Future<void> startTrip(BuildContext context, Rx<HomeTripModel> data) async {
    await DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: AppTranslation.WARNING.tr,
        titleIcon: const Icon(Icons.warning, color: Colors.red),
        contentText: AppTranslation.START_TRIP_MESSAGE.tr,
        primaryAction: DigitDialogActions(
          label: AppTranslation.YES.tr,
          action: (context) async => await startTripFunction(data),
        ),
        secondaryAction: DigitDialogActions(
          label: AppTranslation.NO.tr,
          action: (context) {
            Get.back();
          },
        ),
      ),
    );
  }

  // ? Stop trip dialog box
  Future<void> endTrip(BuildContext context, Rx<HomeTripModel> data) async {
    await DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: AppTranslation.WARNING.tr,
        titleIcon: const Icon(Icons.warning, color: Colors.red),
        contentText: AppTranslation.END_TRIP_MESSAGE.tr,
        primaryAction: DigitDialogActions(
          label: AppTranslation.YES.tr,
          action: (context) => endTripFunction(data),
        ),
        secondaryAction: DigitDialogActions(
          label: AppTranslation.NO.tr,
          action: (context) => Get.back(),
        ),
      ),
    );
  }
}
