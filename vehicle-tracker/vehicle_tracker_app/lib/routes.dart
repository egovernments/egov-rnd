import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/home/pages/home_page.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/",
    page: () => const HomePage(),
  )
];
