import 'package:get/get.dart';

import '../blocs/route_map/bindings/route_bindings.dart';
import '../pages/map_page.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/",
    page: () => const RouteMapPage(),
    binding: RouteMapBindings(),
  ),
];
