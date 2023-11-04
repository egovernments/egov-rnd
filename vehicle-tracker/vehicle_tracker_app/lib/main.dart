import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_tracker_app/data/mdms_service.dart';
import 'package:vehicle_tracker_app/models/login/login_hive_model/login_hive_model.dart';
import 'package:vehicle_tracker_app/models/trip/trip_tracker_info/trip_tracker_hive_model.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'constants.dart';
import 'data/localization_service.dart';
import 'data/secure_storage_service.dart';
import 'models/localization/localization_hive/localization_hive_model.dart';
import 'models/mdms/mdms_hive/mdms_hive_model.dart';

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

  // Fetch the mdms and localization data via API or from local storage
  await fetchDataFunc();

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
      initialRoute: isLogin ? HOME : LANG, // initial routes, if user is logged in then HOME else LOGIN
    );
  }
}

// Common function to register all the Hive adapters
registerAdaptersFunc() {
  // For Localization 
  Hive.registerAdapter(LocalizationHiveModelAdapter());

  // For MDMS data
  Hive.registerAdapter(MdmsHiveModelAdapter());
  Hive.registerAdapter(LanguageHiveModelAdapter());

  // For tracker storing data
  Hive.registerAdapter(TripHiveModelAdapter());

  // For User Data
  Hive.registerAdapter(LoginHiveModelAdapter());
}

// Common function to open all the Hive boxes
openHiveBoxesFunc() async {
  await Future.wait([
    for (var box in hiveBoxes) Hive.openBox(box),
  ]);
}

// common function to fetch all the mdms and localization data
fetchDataFunc() async {
  await Future.wait([
    MdmsService.fetchMdmsData(),
    LocalizationService.i18nMapBuilder(),
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
