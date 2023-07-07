import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vehicle_tracker_app/routes.dart';
import 'package:vehicle_tracker_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vehicle Tracker App',
      theme: CustomTheme.toastTheme,
      getPages: getPages,
      initialRoute: "/digit",
    );
  }
}