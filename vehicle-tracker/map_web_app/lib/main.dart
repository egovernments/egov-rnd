import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:map_web_app/router/routes.dart';

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
      title: 'Flutter Demo',
      theme: DigitTheme.instance.mobileTheme,
      getPages: getPages,
      initialRoute: MAP2,
    );
  }
}
