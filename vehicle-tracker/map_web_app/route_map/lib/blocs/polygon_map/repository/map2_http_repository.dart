import 'dart:developer';

import '../../../constants.dart';
import '../../../data/http_service.dart';
import '../../../models/alert_polygon/alert_polygons.dart';
import '../../../util/toaster_util.dart';

class Map2HttpRepository {
  static Future<bool> createPolygon(AlertPolygon alertPolygon) async {
    String url = "$apiUrl/poi/_create";

    final location = alertPolygon.locationDetails?.map((e) => e.toJson()).toList();

    Map<String, dynamic> jsonMap = {
      "id": alertPolygon.id,
      "locationName": alertPolygon.locationName,
      "status": alertPolygon.status,
      "type": alertPolygon.type,
      "userId": alertPolygon.userId,
      "alert": "Alert",
      "distanceMeters": alertPolygon.distanceMeters,
      "locationDetails": location,
      "tenantId": "pg.citya"
    };

    log(url);

    final response = await HttpService.postRequestWithoutToken(url, jsonMap);

    if (response.statusCode == 200) {
      log("New Polygon added: ${response.body}");
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
      "type": alertPolygon.type == "polygon" ? "line" : alertPolygon.type,
      "userId": alertPolygon.userId,
      "alert": alertPolygon.alert,
      "distanceMeters": alertPolygon.distanceMeters,
      "locationDetails": alertPolygon.locationDetails?.map((e) => e.toJson()).toList(),
      "tenantId": alertPolygon.tenantId
    };

    final response = await HttpService.putRequestWithoutToken(url, jsonMap);

    if (response.statusCode == 200) {
      return true;
    } else {
      toaster(null, "Unable to update polygon", isError: true);
      return false;
    }
  }

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
      log(json.length.toString());

      List<AlertPolygon> alertPolygon = [];

      for (var item in json) {
        alertPolygon.add(AlertPolygon.fromJson(item));
      }

      return alertPolygon;
    } on FormatException {
      log("Format Exception");
      rethrow;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> deletePolygon(String id, String tenantId) async {
    String url = "$apiUrl/poi/_inactivate";
    Map<String, dynamic> jsonMap = {
      "id": id,
      "tenantId": tenantId,
    };
    log(jsonMap.toString());

    final response = await HttpService.putRequestWithoutToken(url, jsonMap);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      toaster(null, "Polygon deleted successfully");
      return true;
    } else {
      log(response.body.toString());
      toaster(null, "Unable to delete polygon with code ${response.statusCode}", isError: true);
      return false;
    }
  }
}
