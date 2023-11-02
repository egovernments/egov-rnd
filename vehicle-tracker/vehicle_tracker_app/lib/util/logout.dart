import 'package:get/get.dart';

import '../blocs/home/controllers/info_controllers.dart';
import '../blocs/home/controllers/trip_tracker_controllers.dart';
import '../data/secure_storage_service.dart';
import '../router/routes.dart';

Future<void> logout() async {
  await SecureStorageService.deleteAll();

  if (Get.isRegistered<InfoController>()) {
    Get.delete<InfoController>(force: true);
  }

  if (Get.isRegistered<TripControllers>()) {
    Get.delete<TripControllers>(force: true);
  }

  Get.offAllNamed(LANG);
}
