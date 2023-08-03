import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/inbox/controllers/header_controllers.dart';

class InboxControllers extends GetxController {
  RxBool isLoaded = false.obs;
  HeaderControllers headerControllers = Get.find<HeaderControllers>();
}