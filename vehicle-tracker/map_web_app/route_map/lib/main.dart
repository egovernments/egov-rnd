import 'package:digit_components/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:route_map/pages/map_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Route Map',
      theme: DigitTheme.instance.mobileTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => const RouteMapPage(),
        "/viewroute": (context) => const RouteMapPage(),
      },
    );
  }
}
