import 'package:get/get.dart';

import '../pages/route_map.dart';
import '../pages/polygon_map.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/viewroute",
    page: () => const RouteMapPage(),
  ),
  GetPage(
    name: "/vehicledumpingsites",
    page: () => const PolygonMapPage(),
  ),
];
