// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../controllers/info_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(InfoController(), permanent: true);
  }
}
// * enums
// NOTSTARTED("NotStarted"),
// ONGOING("Ongoing"),
// COMPLETED("Completed"),
// CANCELLED("Cancelled");

class TripStates {
  static const String ONGOING = "Ongoing";
  static const String COMPLETED = "Completed";
  static const String NOTSTARTED = "NotStarted";
  static const String CANCELLED = "Cancelled";
  static const String LOADING = "Loading";
}
