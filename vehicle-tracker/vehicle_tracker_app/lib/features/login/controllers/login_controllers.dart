import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';

import '../../../services/http_service.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final url = "https://uat.digit.org/user/oauth/token";

  void login() async {
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
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
