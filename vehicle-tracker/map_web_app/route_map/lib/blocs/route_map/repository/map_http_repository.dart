import 'dart:developer';

import 'package:route_map/util/toaster.dart';

import '../../../constants.dart';
import '../../../data/http_service.dart';
import '../../../models/alert_polygon/alert_polygons.dart';

class MapHttpRepository {
  static Future<List<AlertPolygon>> getAllPolygonsWithAlerts(String tenantId) async {
    try {
      String url = "$apiUrl/poi/_search?tenantId=$tenantId";

      final response = await HttpService.getRequest(url);
      if (response.statusCode != 200) {
        log("Error in calling GET ALL POLYGONS api");
        log(response.statusCode.toString());
        return [];
      }

      final json = response.body as List<dynamic>;

      List<AlertPolygon> alertPolygon = [];

      for (var item in json) {
        alertPolygon.add(AlertPolygon.fromJson(item));
      }

      return alertPolygon;
    } on FormatException {
      log("Format Exception");
      toaster("Unable to format polygons from API", isError: true);
      rethrow;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
