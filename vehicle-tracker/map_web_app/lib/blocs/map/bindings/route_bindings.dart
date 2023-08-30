import 'package:get/get.dart';
import 'package:map_web_app/blocs/map/controllers/route_controllers.dart';

class RouteBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteControllers>(() => RouteControllers());
  }
}
