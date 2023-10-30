import 'package:get/get.dart';

import '../controllers/map_controllers.dart';

class PolygonMapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapControllers>(() => MapControllers());
  }
}
