import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/home/controllers/place_controller.dart';
import 'package:vehicle_tracker_app/features/map/controllers/map_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceController>(() => PlaceController());
    Get.lazyPut<MapControllers>(() => MapControllers());
  }
}