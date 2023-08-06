import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}