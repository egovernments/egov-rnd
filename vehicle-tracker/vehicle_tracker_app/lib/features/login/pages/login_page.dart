import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/login/controllers/login_controllers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      body: ScrollableContent(
        footer: const PoweredByDigit(),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DigitCard(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                DigitTextField(label: "User Name", controller: loginController.userNameController),
                DigitTextField(label: "Password", controller: loginController.passwordController),
                DigitDropdown(
                  value: "ok",
                  label: "City",
                  menuItems: const ["ok", "ok2"],
                  valueMapper: (value) {
                    return value;
                  },
                ),
                const SizedBox(height: 20),
                DigitElevatedButton(child: const Text("Continue"), onPressed: () => loginController.login()),
                DigitIconButton(iconText: "Forgot Password", onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
