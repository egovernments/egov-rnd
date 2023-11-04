import 'package:get/get.dart';

import '../pages/map_page.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/",
    page: () => const RouteMapPage(),
  ),
];
