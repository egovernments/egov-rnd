import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/models/login/login_data_model/login_data_model.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/util/toaster.dart';

import '../../../data/http_service.dart';
import '../../../data/secure_storage_service.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final url = "https://uat.digit.org/user/oauth/token";
  String city = cities.keys.first;

  void login(context) async {
    try {
      Map<String, dynamic> formData = {
        "grant_type": "password",
        "scope": "read",
        "username": userNameController.text.trim(),
        "password": passwordController.text.trim(),
        "userType": "EMPLOYEE",
        "tenantId": cities[city],
      };

      final response = await HttpService.postWithFormData(url, formData);
      if (response.statusCode == 200) {
        final loginModel = LoginDataModel.fromJson(response.body);

        await Future.wait([
          SecureStorageService.write(token, loginModel.access_token),
          SecureStorageService.write(uuid, loginModel.UserRequest.uuid),
          SecureStorageService.write(tenantId, loginModel.UserRequest.tenantId)
        ]);

        toaster(context, AppTranslation.LOGIN_SUCCESS_MESSAGE.tr);
        Get.offAllNamed(HOME);
      } else {
        toaster(context, AppTranslation.LOGIN_FAILED_MESSAGE.tr, isError: true);
      }
    } on FormatException catch (e) {
      toaster(context, e.message, isError: true);
    } on Exception catch (e) {
      toaster(context, e.toString(), isError: true);
    }
  }

  // * Forgot Password Dialog Box
  forgetPassword(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
          titleText: AppTranslation.FORGOT_PASSWORD.tr,
          titleIcon: const Icon(Icons.warning_rounded, color: Colors.red),
          contentText: AppTranslation.FORGOT_PASSWORD_INFO.tr,
          primaryAction: DigitDialogActions(label: AppTranslation.OK.tr, action: (context) => Get.back())),
    );
  }
}
