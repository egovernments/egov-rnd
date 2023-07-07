import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/digit/pages/digit_page.dart';
import 'package:vehicle_tracker_app/features/home/pages/home_page.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/",
    page: () => const HomePage(),
  ),
  GetPage(
    name: "/digit",
    page: () => const DigitPage(),
  )
];
