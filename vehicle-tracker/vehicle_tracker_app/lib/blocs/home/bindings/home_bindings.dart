import 'package:get/get.dart';

import '../controllers/inbox_controllers.dart';
import '../controllers/trip_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripControllers>(() => TripControllers());
    Get.lazyPut<InboxController>(() => InboxController());
  }
}
