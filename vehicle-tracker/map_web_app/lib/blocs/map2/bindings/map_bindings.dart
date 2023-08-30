import 'package:get/get.dart';
import 'package:map_web_app/blocs/map2/controllers/map_controllers.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapControllers>(() => MapControllers());
  }
}