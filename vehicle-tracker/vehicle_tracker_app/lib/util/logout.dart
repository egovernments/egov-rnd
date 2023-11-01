import 'package:get/get.dart';

import '../blocs/home/controllers/info_controllers.dart';
import '../blocs/home/controllers/trip_tracker_controllers.dart';
import '../router/routes.dart';
import 'secure_storage_functions.dart';

Future<void> logout() async {
  await SecureStorageFunctions.deleteAll();

  if (Get.isRegistered<InfoController>()) {
    Get.delete<InfoController>(force: true);
  }

  if (Get.isRegistered<TripControllers>()) {
    Get.delete<TripControllers>(force: true);
  }

  Get.offAllNamed(LANG);
}
