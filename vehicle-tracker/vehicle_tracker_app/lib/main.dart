import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_tracker_app/routes.dart';
import 'package:vehicle_tracker_app/services/token_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("tracker");
  bool isLogin = await checkLogin();
  log("Login: $isLogin");
  runApp(MyApp(
    isLogin: isLogin,
  ));
}

Future<bool> checkLogin() async {
  String? token = await SecureStorageService.read();
  if (token != null) {
    return true;
  }
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
      getPages: getPages,
      initialRoute: isLogin ? "/home" : "/login",
    );
  }
}
