import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/login/repository/login_http_reposotry.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String city = cities.keys.first;

  void login(context) async {
    final isLogin = await LoginHTTPRepository.login(
      context,
      userNameController.text,
      passwordController.text,
      cities[city] ?? "",
    );

    if (isLogin) {
      Get.offAllNamed(HOME);
    }
  }

  // * Forgot Password Dialog Box
  forgetPassword(BuildContext context) {
    return DigitDialog.show(
      context,
      options: DigitDialogOptions(
          titleText: AppTranslation.FORGOT_PASSWORD.tr,
          titleIcon: const Icon(Icons.warning_rounded, color: Colors.red),
          contentText: AppTranslation.FORGOT_PASSWORD_MESSAGE.tr,
          primaryAction: DigitDialogActions(label: AppTranslation.OK.tr, action: (context) => Get.back())),
    );
  }
}
