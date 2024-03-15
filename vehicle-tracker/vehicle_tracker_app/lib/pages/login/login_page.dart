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
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppTranslation.LOGIN_SUB_LINE.tr ??
                      "Provide mobile number and validate with OTP sent to you through SMS",
                  style: textTheme.titleLarge,
                ),

                DigitTextField(
                  maxLength: 10,
                  prefixText: '+91',
                  textInputType: TextInputType.number,
                  isRequired: true,
                  label: MOBILE_NUMBER,
                  controller: loginController.userNameController,
                ),

                // * Login Button
                Padding(
                  padding: const EdgeInsets.only(top: kPadding) * 2,
                  child: Obx(() {
                    if (loginController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return DigitElevatedButton(
                        child: Text(AppTranslation.CONTINUE.tr),
                        onPressed: () => loginController.sendOTP(context),
                      );
                    }
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
