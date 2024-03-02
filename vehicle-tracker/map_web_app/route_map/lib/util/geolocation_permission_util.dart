import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../constants.dart';
import 'toaster_util.dart';

class GeolocationPermissionUtil {
  Future<bool> handleLocationPermission() async {
    log("handleLocationPermission called");
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      toaster(null, "Please enable location services");
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        toaster(null, "Location permission denied");
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      toaster(null, "Location permission denied forever");
      return false;
    }

    return true;
  }

  Future<LatLng> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      log("Error in getting current location : $e");
      return defaultLatLng;
    }
  }
}
