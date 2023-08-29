// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../blocs/map/bindings/map_bindings.dart';
import '../pages/map/map_page.dart';

String MAP = "/map";

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: MAP,
    page: () => const MapPage(),
    binding: MapBindings(),
  ),
];
