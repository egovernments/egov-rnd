import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';

import '../../../services/http_service.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final url = "https://uat.digit.org/user/oauth/token";

  void login(context) async {
    Map<String, dynamic> formData = {
      "grant_type": "password",
      "scope": "read",
      "username": userNameController.text,
      "password": passwordController.text,
      "userType": "EMPLOYEE",
      "tenantId": "pg.citya"
    };

    final response = await HttpService.postWithFormData(url, formData);
    if (response.statusCode == 200) {
      toaster(context, "Login Success");
      Get.toNamed("/home");
    } else {
      toaster(context, "Login Failed", isError: true);
    }
  }
}
