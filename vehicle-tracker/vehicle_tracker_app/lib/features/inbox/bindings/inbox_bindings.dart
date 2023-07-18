import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/inbox/controllers/inbox_controllers.dart';

import '../controllers/header_controllers.dart';

class InboxBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeaderControllers>(() => HeaderControllers());
    Get.lazyPut<InboxControllers>(() => InboxControllers());
  }
}