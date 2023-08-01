import 'package:get/get.dart';

class InboxController extends GetxController {
  RxBool isCompleted = false.obs;

  void toggleCompleted() {
    isCompleted.value = !isCompleted.value;
  }
}