import 'package:get/get.dart';
import 'package:map_web_app/blocs/map_page/controllers/route_controllers.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouteControllers>(() => RouteControllers());
  }
}
