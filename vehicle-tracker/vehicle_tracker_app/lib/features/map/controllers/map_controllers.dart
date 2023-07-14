// ignore_for_file: avoid_print
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MapControllers extends GetxController {
  List<Position> positions = [];
  RxBool isRunning = false.obs;
  late Position start;
  late Position end;

  // * starts from here
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

  void startPeriodicFunction() {
    Timer.periodic(const Duration(minutes: 2), (_) async {
      // If isRunning is false, cancel the timer
      if (!isRunning.value) {
        _.cancel();
      } else {
        Position? currentPosition = await getCurrentLocation();
        if (currentPosition != null) {
          // Add the current position to the list
          positions.add(currentPosition);

          // If there are more than 1 positions, call the distance logic function
          if (positions.length > 1) {
            distanceLogic(currentPosition, positions[positions.length - 2]);
          }
        }
      }
    });
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

  distanceLogic(Position currentPosition, prevPosition) {
    double distance = distanceCalculator(currentPosition, prevPosition);
    double distanceFromEnd = distanceCalculator(currentPosition, end);

    if (distanceFromEnd < 2500) {
      // Send near to destination report
    }

    if (distanceFromEnd < 100) {
      // Send reached destination report
      stopTracking();
    }

    if (distance < 2500) {
      // Send slow report
    }
  }

  statusSender(String message) async {
    if (await isConnected()) {
      // send the status via API
      // if gets an error for any reason, store it in local db
    } else {
      // store it in local db
    }
  }

  Future<bool> isConnected() async {
    return await InternetConnectionChecker().hasConnection;
     
  }

  double distanceCalculator(Position a, b) {
    return Geolocator.distanceBetween(a.latitude, a.longitude, b.latitude, b.longitude);
  }

  

  
}
