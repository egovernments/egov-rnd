import 'dart:async';
import 'dart:developer';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_hive_repository.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_http_repository.dart';
import 'package:vehicle_tracker_app/models/trip/trip_tracker_info/trip_tracker_hive_model.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

class TripControllers extends GetxController {
  RxBool isRunning = false.obs; // This variable is to check if the tracking is running or not
  RxBool isLoading = false.obs; // This variable is to check if startTracking is loading or not

  HomeHTTPRepository homeHTTPRepository = HomeHTTPRepository();
  HomeHiveRepository homeHiveRepository = HomeHiveRepository();

  // * This function starts the tracking peroiodic event
  Future<void> startTracking() async {
    log('---- Trip and Tracking started ----');
    isRunning.value = true;

    log("Tracker loginc called");
    await trackerLogic("start");

    startPeriodicFunction();
  }

  // * This functions starts a timer which will call the trackerLogin function every n seconds
  void startPeriodicFunction() {
    log('Periodic function started');
    Timer.periodic(const Duration(seconds: 5), (_) async {
      log("Periodic function called");
      if (!isRunning.value) {
        log("Periodic function stopped");
        _.cancel();
      } else {
        trackerLogic("In Progress");
      }
    });
  }

  // * The tracker logic function which checks location permissions and gets the current position
  Future<void> trackerLogic(String alert) async {
    bool permissions = await handleLocationPermission();
    if (!permissions) {
      isRunning.value = false;
      log('Location permissions not granted');
      return;
    } else {
      log('Location permissions are granted');
    }

    log("Getting current location");
    Position? currentPosition = await getCurrentLocation();
    if (currentPosition == null) {
      log("Error getting current location");
      return;
    }

    log("Calling position sender logic");
    await positionSender(currentPosition, alert);

    log(" ---- Tracker Login Completed ----");
  }

  // * This function is responsible to send the API or store the tracking data to hive
  Future<void> positionSender(Position position, String alert) async {
    TripHiveModel tripHiveModel = TripHiveModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
    final isConnected = await this.isConnected();

    // If connected to internet, try send the position to server
    // Else save the position to hive
    if (isConnected) {
      // Getting all the latlng from hive and adding the current position to the list
      log("Getting all the positions from hive");
      List<TripHiveModel> positions = homeHiveRepository.getTripData();
      positions.add(tripHiveModel);

      // Sending the positions to the server :-
      // if success delete the hive data
      // else save the data to hive
      log("Sending position to server");
      final status = await homeHTTPRepository.callTrackingApi(positions, alert);
      if (status) {
        log("Position sent successfully");
        await homeHiveRepository.deleteTripData();
      } else {
        // If the position sending fails, save the data to hive
        log("Error sending position, saving to hive");
        homeHiveRepository.storeTripData(tripHiveModel);
      }
    } else {
      // If not connected to internet, save the data to hive
      log("No internet connection, saving to hive");
      await homeHiveRepository.storeTripData(tripHiveModel);
    }
  }

  // * This function is to check the location permissions
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    log("handleLocationPermission called");
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Location services are disabled. Please enable the services");
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Location permissions are denied. Please enable the permissions");
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }

    return true;
  }

  // * This function is to get the current location
  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      log('Error getting current location: $e');
      return null;
    }
  }

  // * This function checks if the device is connected to internet
  Future<bool> isConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }

  // * Start trip dialog box
  Future<void> startTrip(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: AppTranslation.WARNING.tr,
        titleIcon: const Icon(Icons.warning, color: Colors.red),
        contentText: "Start the trip only after reaching the pickup location.  Have you reached the applicant location?",
        primaryAction: DigitDialogActions(
          label: "Yes",
          action: (context) async {
            isLoading.value = true;
            await startTracking();
            Get.back();
            isLoading.value = false;
          },
        ),
        secondaryAction: DigitDialogActions(
          label: "No",
          action: (context) => Get.back(),
        ),
      ),
    );
  }

  // * Stop trip dialog box
  Future<void> endTrip(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: AppTranslation.WARNING.tr,
        titleIcon: const Icon(Icons.warning, color: Colors.red),
        contentText: "Are you sure you want to stop the trip?",
        primaryAction: DigitDialogActions(
          label: "Yes",
          action: (context) {
            // ! MIGHT NEED TO CHANGE THIS
            isRunning.value = false;
            Get.back();
          },
        ),
        secondaryAction: DigitDialogActions(
          label: "No",
          action: (context) => Get.back(),
        ),
      ),
    );
  }
}
