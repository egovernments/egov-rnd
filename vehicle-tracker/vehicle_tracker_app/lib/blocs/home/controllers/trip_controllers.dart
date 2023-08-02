import 'dart:async';
import 'dart:developer';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

class TripControllers extends GetxController {
  List<Position> positions = [];
  RxBool isRunning = false.obs;
  late LatLng start;
  late LatLng end;
  int tick = 0;

  // * starts from here
  void startTracking(LatLng start, LatLng end) async {
    log('startTracking called');
    bool permissions = await handleLocationPermission();
    if (!permissions) return;
    log('Permissions are ok');
    this.start = start;
    this.end = end;
    isRunning.value = true;
    startPeriodicFunction();
  }

  // ! not used
  startStream() {
    LocationSettings custom = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: custom).listen((position) {
      log("Stream position: ${position.latitude}, ${position.longitude}");
    });
  }

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    log("handleLocationPermission called");
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Location services are disabled. Please enable the services");
      return false;
    }

    log("Location services are enabled");

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

  void stopTracking() {
    // send completed status via API
    tick = 0;
    isRunning.value = false;
  }

  void startPeriodicFunction() {
    log('startPeriodicFunction called');
    Timer.periodic(const Duration(seconds: 5), (_) async {
      tick++;
      log("Tick $tick");
      if (!isRunning.value) {
        _.cancel();
      } else {
        Position? currentPosition = await getCurrentLocation();
        if (currentPosition != null) {
          positions.add(currentPosition);
          if (positions.length > 1) {
            await distancelogic(currentPosition, positions[positions.length - 2]);
          }
        }
      }
    });
  }

  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      log('Error getting current location: $e');
      return null;
    }
  }

  distancelogic(Position currentPosition, Position prevPosition) async {
    double distance = distanceCalculator(
      LatLng(currentPosition.latitude, currentPosition.longitude),
      LatLng(prevPosition.latitude, prevPosition.longitude),
    );
    double distanceFromEnd = distanceCalculator(
      LatLng(currentPosition.latitude, currentPosition.longitude),
      end,
    );

    log('Distance from previous point: $distance');
    log('Distance from end: $distanceFromEnd');
    // await statusSender("ok");

    if (distanceFromEnd < 1000) {
      log("Reached destination");
      stopTracking();
    }

    if (distance < 2500) {
      log("Distance less than 2.5km");
    }

    await statusSender("ok");

    log("--------------------");
  }

  statusSender(String message) async {
    if (await isConnected()) {
      // send the status via API
      // if gets an error for any reason, store it in local db
      log("Connected to internet");
    } else {
      // store it in local db
      log("Not connected");
    }
  }

  Future<bool> isConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }

  double distanceCalculator(LatLng a, LatLng b) {
    return Geolocator.distanceBetween(a.latitude, a.longitude, b.latitude, b.longitude);
  }

  startTrip(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
        titleText: AppTranslation.WARNING.tr,
        titleIcon: const Icon(Icons.warning, color: Colors.red),
        contentText: "Start the trip only after reaching the pickup location.  Have you reached the applicant location?",
        primaryAction: DigitDialogActions(
          label: "Yes",
          action: (context) {
            // startTracking(LatLng(28.7041, 77.1025), LatLng(28.7041, 77.1025));
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
