// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:polygon_map/pages/map_page2.dart';

import 'blocs/polygon_map/bindings/map_bindings.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/",
    page: () => const PolygonMap(),
    binding: PolygonMapBindings(),
  ),
];
