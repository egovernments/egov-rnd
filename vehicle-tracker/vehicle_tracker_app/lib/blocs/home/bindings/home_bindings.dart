// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../controllers/info_controllers.dart';
import '../controllers/trip_tracker_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TripControllers(), permanent: true);
    Get.put(InfoController(), permanent: true);
  }
}

class TripStates {
  static const String ACTIVE = "active";
  static const String PROGRESS = "progress";
  static const String COMPLETED = "completed";
  static const String RUNNING = "running";
}