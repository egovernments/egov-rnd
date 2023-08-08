import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/details/controllers/camera_controllers.dart';

import '../controllers/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
    Get.lazyPut(() => CameraControllers());
  }
}
