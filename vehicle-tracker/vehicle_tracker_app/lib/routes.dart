import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/digit/pages/digit_page.dart';
import 'package:vehicle_tracker_app/features/home/pages/home_page.dart';
import 'package:vehicle_tracker_app/features/home/pages/map_page.dart';
import 'package:vehicle_tracker_app/features/inbox/bindings/inbox_bindings.dart';
import 'package:vehicle_tracker_app/features/inbox/pages/inbox_page.dart';

import 'features/digit/bindings/digit_bindings.dart';
import 'features/home/bindings/home_bindings.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/",
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: "/map",
    page: () => const MapPage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: "/inbox",
    page: () => const InboxPage(),
    binding: InboxBindings(),
  ),
  GetPage(
    name: "/digit",
    page: () => const DigitPage(),
    binding: DigitBindings(),
  )
];
