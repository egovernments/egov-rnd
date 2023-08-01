import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderControllers extends GetxController {
  RxBool appCreated = false.obs;
  RxBool dsoPending = false.obs;
  RxBool dsoInProcgress = false.obs;
  RxBool pendingPayment = false.obs;
  var sortValue = 0.obs;

  TextEditingController applicationNoCtrl = TextEditingController();
  TextEditingController mobileNoCtrl = TextEditingController();

  appCreatedToggle() {
    appCreated.toggle();
  }

  dsoPendingToggle() {
    dsoPending.toggle();
  }

  dsoInProgressToggle() {
    dsoInProcgress.toggle();
  }

  pendingPaymentToggle() {
    pendingPayment.toggle();
  }

  clearFilters() {
    appCreated.value = false;
    dsoPending.value = false;
    dsoInProcgress.value = false;
    pendingPayment.value = false;
  }

  clearSeatch() {
    applicationNoCtrl.clear();
    mobileNoCtrl.clear();
  }

  setSortValue(int value) {
    sortValue.value = value;
  }
}
