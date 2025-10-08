// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';

class TripTrackerUtility {

  // ? This function is to check the location permissions
  // ? If the location permissions are not granted, it will request for the permissions
  // ? If the location services are disabled, it will request to enable the services
  // ? IF the permissions are granted, it will return true othrwise false
  Future<bool> handleLocationPermission(BuildContext? context) async {
    if (context == null) {
      log("handleLocationPermission called with null context");
    }

    bool serviceEnabled;
    LocationPermission permission;
    log("handleLocationPermission called");
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      toaster(context, AppTranslation.LOCATION_SERVICE_DISABLED_MESSAGE.tr);
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        toaster(context, AppTranslation.LOCATION_PERMISSION_DENIED_MESSAGE.tr);
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      toaster(context, AppTranslation.LOCATION_PERMISSION_DENIED_FOREVER_MESSAGE.tr);
      return false;
    }

    return true;
  }

  // ? This function is to get the current location
  // ? It uses the geolocator package to get the current location
  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      log('Error getting current location: $e');
      return null;
    }
  }

  // ? This function checks if the device is connected to internet
  Future<bool> isConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
