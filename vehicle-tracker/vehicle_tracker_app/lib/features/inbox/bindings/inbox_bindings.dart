import 'package:get/get.dart';

import '../controllers/header_controllers.dart';

class InboxBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HeaderControllers>(() => HeaderControllers());
  }
}