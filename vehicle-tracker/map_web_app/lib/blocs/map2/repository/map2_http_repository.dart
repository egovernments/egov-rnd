import 'package:map_web_app/constants.dart';
import 'package:map_web_app/models/map2/alert_polygons.dart';

import '../../../data/http_service.dart';

class Map2HttpRepository {
  static Future<bool> createPolygon(AlertPolygon alertPolygon) async {
    String url = "$apiUrl/poi/_create";

    Map<String, dynamic> jsonMap = {
      "id": alertPolygon.id,
      "locationName": alertPolygon.locationName,
      "status": alertPolygon.status,
      "type":  alertPolygon.type, // ! error here
      "userId": alertPolygon.userId,
      "alert": alertPolygon.alert,
      "distanceMeters": alertPolygon.distanceMeters,
      "locationDetails": alertPolygon.locationDetails!.map((e) => e.toJson()).toList(),
    };

    print(jsonMap);

    final response = await HttpService.postRequestWithoutToken(url, jsonMap);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updatePolygon(AlertPolygon alertPolygon) async {
    String url = "$apiUrl/poi/_update";

    Map<String, dynamic> jsonMap = {
      "id": alertPolygon.id,
      "locationName": alertPolygon.locationName,
      "status": alertPolygon.status,
      "type":  alertPolygon.type == "polygon" ? "line" : alertPolygon.type, // ! error here
      "userId": alertPolygon.userId,
      "alert": alertPolygon.alert,
      "distanceMeters": alertPolygon.distanceMeters,
      "locationDetails": alertPolygon.locationDetails!.map((e) => e.toJson()).toList(),
    };

    print(jsonMap);

    final response = await HttpService.putRequestWithoutToken(url, jsonMap);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<AlertPolygon>> getAllPolygonsWithAlerts() async {
    String url = "$apiUrl/poi/_search?isAlertLocation=true";

    final response = await HttpService.getRequest(url);
    if (response.statusCode != 200) {
      return [];
    }

    final json = response.body as List<dynamic>;

    List<AlertPolygon> alertPolygon = [];

    for (var item in json) {
      alertPolygon.add(AlertPolygon.fromJson(item));
    }

    return alertPolygon;
  }
}
