import 'package:latlong2/latlong.dart';
import 'package:map_web_app/constants.dart';
import 'package:map_web_app/models/map2/alert_polygons.dart';

import '../../../data/http_service.dart';

class Map2HttpRepository {
  static Future<bool> createPolygon(int distance, List<LatLng> positions) async {
    String url = "$apiUrl/poi/_create";

    List<Map<String, dynamic>> locationDetails = [];

    for (var position in positions) {
      Map<String, dynamic> location = {
        "latitude": position.latitude,
        "longitude": position.longitude,
      };
      locationDetails.add(location);
    }

    Map<String, dynamic> jsonMap = {
      "locationName": "",
      "status": "active",
      "type": "polygon",
      "userId": "rajan123",
      "alert": ["Alert-001"],
      "distanceMeters": distance,
      "locationDetails": locationDetails,
    };

    final response = await HttpService.postRequestWithoutToken(url, jsonMap);

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
