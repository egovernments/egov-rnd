import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_tracker_app/routes.dart';
import 'package:vehicle_tracker_app/services/token_service.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Load up the environment variables
  await dotenv.load(fileName: ".env");

  // Initialize the Hive box for storing vehicle tracking data
  await Hive.openBox("tracker");

  // Uses the bool value to determine the initial route
  bool isLogin = await checkLogin();

  runApp(MyApp(
    isLogin: isLogin,
  ));
}

// Check if the user is logged via token stored in secure storage
Future<bool> checkLogin() async {
  String? token = await SecureStorageService.read();
  if (token != null) {
    log("Token not found");
    return true;
  }
  log("Token found");
  return false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});

  final bool isLogin;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vehicle Tracker App',
      theme: DigitTheme.instance.mobileTheme,
      translations: AppTranslation(),
      locale: const Locale('en', 'IN'),
      getPages: getPages,
      initialRoute: isLogin ? HOME : LOGIN,
    );
  }
}
