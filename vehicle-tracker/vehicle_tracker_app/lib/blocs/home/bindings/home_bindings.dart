import 'package:get/get.dart';

import '../controllers/inbox_controllers.dart';
import '../controllers/map_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapControllers>(() => MapControllers());
    Get.lazyPut<InboxController>(() => InboxController());
  }
}