import 'dart:async';
import 'dart:developer';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:latlong2/latlong.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/hive_service.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';
import 'package:vehicle_tracker_app/models/trip/trip_hive/trip_hive_model.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

class TripControllers extends GetxController {
  List<Position> positions = [];
  RxBool isRunning = false.obs;
  late LatLng start;
  late LatLng end;
  int tick = 0;

  Future<void> startTrip(BuildContext context) {
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

  Future<void> stopTracking() async {
    var hiveData = HiveService.getTripData();

    await createPOI(null, "", tripHiveModel: hiveData);

    positions.clear();
    tick = 0;
    isRunning.value = false;

    log("Trip Completed");
  }

  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      log('Error getting current location: $e');
      return null;
    }
  }

  Future<void> distancelogic(Position currentPosition, Position prevPosition) async {
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

    await statusSender([currentPosition]);

    log("--------------------");
  }

  Future<void> statusSender(List<Position> latlngs) async {
    await HiveService.storeTripData(latlngs);

    if (await isConnected()) {
      log("Connected to internet");
      await createPOI(latlngs, "");
    }
  }

  Future<bool> isConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }

  double distanceCalculator(LatLng a, LatLng b) {
    return Geolocator.distanceBetween(a.latitude, a.longitude, b.latitude, b.longitude);
  }

  // API call to create POI
  Future<void> createPOI(List<Position>? positionsList, String? locationNane, {List<TripHiveModel>? tripHiveModel}) async {
    String url = "$apiUrl/poi/_create";

    List<Map<String, dynamic>> locationData = [];

    if (positionsList == null) {
      for (var item in tripHiveModel ?? []) {
        locationData.add({
          "latitude": item.latitude,
          "longitude": item.longitude,
        });
      }
    } else {
      for (var item in positionsList) {
        locationData.add({
          "latitude": item.latitude,
          "longitude": item.longitude,
        });
      }
    }

    Map<String, dynamic> body = {};

    body["locationDetails"] = locationData;
    body["type"] = "point";

    if (locationNane != null) {
      body["locationName"] = locationNane;
    } else {
      body = {
        body["locationName"]: "",
      };
    }

    final response = await HttpService.postRequestWithoutToken(url, body);
    if (response.statusCode != 200) {
      log("Error creating POI");
    } else {
      log("POI created");
    }
  }
}
