import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';
import 'package:polygon_map/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load up the environment variables
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Polygon Map',
      theme: DigitTheme.instance.mobileTheme,
      getPages: getPages,
      initialRoute: "/",
    );
  }
}
