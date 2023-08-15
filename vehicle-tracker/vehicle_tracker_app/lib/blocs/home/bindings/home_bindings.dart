// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../controllers/info_controllers.dart';
import '../controllers/trip_tracker_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripControllers>(() => TripControllers());
    Get.lazyPut<InfoController>(() => InfoController());
  }
}

class TripStates {
  static const String ACTIVE = "active";
  static const String PROGRESS = "progress";
  static const String COMPLETED = "completed";
  static const String RUNNING = "running";
}