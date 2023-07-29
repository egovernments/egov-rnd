import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/map/controllers/map_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapControllers>(() => MapControllers());
  }
}