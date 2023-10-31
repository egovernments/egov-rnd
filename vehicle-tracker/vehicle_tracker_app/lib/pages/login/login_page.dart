import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../blocs/login/controllers/login_controllers.dart';
import '../../widgets/utils/scrollable_header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    final textTheme = DigitTheme.instance.mobileTheme.textTheme;

    return Scaffold(
      appBar: AppBar(
        // title: Text(AppTranslation.HOME_APP_BAR.tr),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: ScrollableContent(
        footer: const PoweredByDigit(),
        header: scrollableHeaderWidget(true, false),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // * Login Card
          DigitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTranslation.LOGIN.tr,
                  style: textTheme.displayMedium,
                ),

                // * Text Fields for User ID and Password
                DigitTextField(
                  label: AppTranslation.USER_ID.tr,
                  controller: loginController.userNameController,
                ),
                DigitTextField(
                  label: AppTranslation.PASSWORD.tr,
                  controller: loginController.passwordController,
                ),

                // * City Dropdown
                DigitDropdown<String>(
                  value: loginController.city,
                  label: AppTranslation.CITY.tr,
                  menuItems: cityNames,
                  onChanged: (value) => loginController.city = value ?? "",
                  valueMapper: (value) => value,
                ),

                // * Login Button
                Padding(
                  padding: const EdgeInsets.only(top: kPadding) * 2,
                  child: DigitElevatedButton(
                    child: Text(AppTranslation.LOGIN.tr),
                    onPressed: () => loginController.login(context),
                  ),
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
