import 'package:get/get.dart';

class DetailController extends GetxController {
  RxInt tankType = 0.obs;
  
  setTankValue(int value) {
    tankType.value = value;
  }
}