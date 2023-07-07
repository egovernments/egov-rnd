import 'package:get/get.dart';

import '../controllers/digit_controllers.dart';

class DigitBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DigitController>(() => DigitController());
  }
}
