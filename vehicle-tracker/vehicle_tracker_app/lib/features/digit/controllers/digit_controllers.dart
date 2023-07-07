import 'package:get/get.dart';

class DigitController extends GetxController {
  RxBool check = false.obs;

  switchCheck() {
    check.toggle();
  }
}
