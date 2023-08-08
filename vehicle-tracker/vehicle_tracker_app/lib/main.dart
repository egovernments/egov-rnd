import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_tracker_app/data/mdms_service.dart';
import 'package:vehicle_tracker_app/models/mdms_hive/mdms_hive_model.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/data/token_service.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data/localization_service.dart';
import 'models/localization_hive/localization_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load up the environment variables
  await dotenv.load(fileName: ".env");

  // Initialize the Hive database
  await Hive.initFlutter();

  // Registering the Hive adapters
  registerAdaptersFunc();

  // Initialize the Hive box for storing vehicle tracking data
  await openHiveBoxesFunc();

  // Fetch the mdms data via API or from local storage
  await MdmsService.fetchMdmsData();

  // Fetch the localization data via API or from local storage
  await LocalizationService.fetchLocalizationData();

  // Uses the bool value to determine the initial route
  bool isLogin = await checkLogin();

  runApp(MyApp(
    isLogin: isLogin,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLogin});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vehicle Tracker App',
      theme: DigitTheme.instance.mobileTheme,
      translations: AppTranslation(), // has all the translations
      locale: const Locale('en', 'IN'),
      getPages: getPages, // has all the routes
      initialRoute: isLogin ? DETAILS : LANG, // initial routes, if user is logged in then HOME else LOGIN
    );
  }
}

// Common function to register all the Hive adapters
registerAdaptersFunc() {
  Hive.registerAdapter(LocalizationHiveModelAdapter());
  Hive.registerAdapter(MdmsHiveModelAdapter());
  Hive.registerAdapter(LanguageHiveModelAdapter());
}

// Common function to open all the Hive boxes`
openHiveBoxesFunc() async {
  await Future.wait([
    Hive.openBox("tracker"),
    Hive.openBox("localization"),
    Hive.openBox("mdms"),
  ]);
}

// Check if the user is logged via token stored in secure storage
// returns true if token is found else false
Future<bool> checkLogin() async {
  String? token = await SecureStorageService.read("token");
  if (token != null) {
    log("Token found");
    return true;
  }
  log("Token not found");
  return false;
}
