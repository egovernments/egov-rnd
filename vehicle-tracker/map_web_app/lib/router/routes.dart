import 'package:get/get.dart';

import '../pages/map_page/map_page.dart';

String MAP = "/map";

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: MAP,
    page: () => const MapPage(),
    // binding: MapBindings(),
  ),
];
