import 'package:get/get.dart';

import '../controllers/route_controllers.dart';

class RouteMapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteControllers>(() => RouteControllers());
  }
}
