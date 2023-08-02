import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../blocs/login/controllers/login_controllers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslation.HOME_APP_BAR.tr),
        centerTitle: false,
      ),
      body: ScrollableContent(
        footer: const PoweredByDigit(),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Back Button
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topLeft,
            child: DigitIconButton(iconText: "Back", onPressed: () {}, icon: Icons.arrow_back),
          ),

          // * Login Card
          DigitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Login"),

                // * Text Fields for User ID and Password
                DigitTextField(label: AppTranslation.ACTION_TEST_LME_PERFORMANCE_REPORT.tr, controller: loginController.userNameController),
                DigitTextField(label: AppTranslation.PASSWORD.tr, controller: loginController.passwordController),

                // * City Dropdown
                DigitDropdown<String>(
                  value: loginController.city,
                  label: AppTranslation.CITY.tr,
                  menuItems: cityNames,
                  onChanged: (value) => loginController.city = value ?? "",
                  valueMapper: (value) => value,
                ),

                // * Login Button
                const SizedBox(height: 20),
                DigitElevatedButton(
                  child: Text(AppTranslation.LOGIN.tr),
                  onPressed: () => loginController.login(context),
                ),

                // * Forgot Password Button
                Center(
                  child: DigitIconButton(
                    iconText: AppTranslation.FORGOT_PASSWORD.tr,
                    onPressed: () => loginController.forgetPassword(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
