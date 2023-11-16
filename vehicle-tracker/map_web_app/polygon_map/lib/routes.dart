import 'package:get/get.dart';
import 'pages/map_page2.dart';


List<GetPage<dynamic>> getPages = [
  GetPage(
    name: "/vehicledumpingsites",
    page: () => const PolygonMap(),
  ),
];
