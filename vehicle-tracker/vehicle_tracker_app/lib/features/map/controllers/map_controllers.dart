// ignore_for_file: avoid_print

import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapControllers extends GetxController {
  List<Position> positions = [];
  RxBool isRunning = false.obs;
  late Position start;
  late Position end;

  void startPeriodicFunction() {
    Timer.periodic(const Duration(minutes: 2), (_) async {
      // * If isRunning is false, cancel the timer
      if (!isRunning.value) {
        _.cancel();
      } else {
        Position? currentPosition = await getCurrentLocation();
        if (currentPosition != null) {
          // * Add the current position to the list
          positions.add(currentPosition);

          // * If there are more than 1 positions, call the distance logic function
          if (positions.length > 1) {
            distanceLogic(currentPosition, positions[positions.length - 2]);
          }
        }
      }
    });
  }

  distanceLogic(Position currentPosition, prevPosition) {
    double distance = distanceCalculator(currentPosition, prevPosition);
    double distanceFromEnd = distanceCalculator(currentPosition, end);

    if (distance < 2500) {
      // Send slow report
    }

    if (distanceFromEnd < 2500) {
      // Send near to destination report
    }

    if (distanceFromEnd < 500) {
      // Send reached destination report
    }
  }

  statusSender(String message) {
    if (isConnected()) {
      // send the status via API 
      // if gets an error for any reason, store it in local db
    } else {
      // store it in local db
    }
  }

  bool isConnected() {
    // check Internet connection

    return true;
  }

  double distanceCalculator(Position a, b) {
    return Geolocator.distanceBetween(a.latitude, a.longitude, b.latitude, b.longitude);
  }

  Future<Position?> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
    } catch (e) {
      print('Error getting current location: $e');
      return null;
    }
  }

  void startTracking(Position start, end) {
    this.start = start;
    this.end = end;
    isRunning.value = true;
    startPeriodicFunction();
  }

  void stopTracking() {
    // send completed status via API
    isRunning.value = false;
  }
}
