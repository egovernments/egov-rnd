// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:map_web_app/blocs/map2/bindings/map_bindings.dart';
import 'package:map_web_app/pages/map2/map_page2.dart';

import '../blocs/map/bindings/route_bindings.dart';
import '../pages/map/map_page.dart';

String MAP = "/map";
String MAP2 = "/map2";

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: MAP,
    page: () => const MapPage(),
    binding: RouteBindings(),
  ),
  GetPage(
    name: MAP2,
    page: () => const MapPage2(),
    binding: MapBindings(),
  ),
];
