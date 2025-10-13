import 'dart:developer';

import 'package:route_map/models/trip_progress/progress_report_model.dart';

import '../../../constants.dart';
import '../../../data/http_service.dart';
import '../../../models/alert_polygon/alert_polygons.dart';
import '../../../util/toaster_util.dart';

class MapHttpRepository {
  static Future<List<AlertPolygon>> getAllPolygonsWithAlerts(String tenantId) async {
    try {
      List<AlertPolygon> alertPolygon = [];
      String url = "$apiUrl/poi/_search?tenantId=$tenantId";

      final response = await HttpService.getRequest(url);
      if (response.statusCode != 200) {
        log("Error in calling GET ALL POLYGONS api");
        log(response.statusCode.toString());
        return alertPolygon;
      }

      final json = response.body as List<dynamic>;
      for (var item in json) {
        alertPolygon.add(AlertPolygon.fromJson(item));
      }

      return alertPolygon;
    } on FormatException {
      log("Format Exception");
      toaster(null, "Unable to format polygons from API", isError: true);
      rethrow;
    } catch (e) {
      log("Error in calling GET ALL POLYGONS api with error: $e");
      toaster(null, "Unable to fetch polygons from API", isError: true);
      log(e.toString());
      return [];
    }
  }

  static Future<List<ProgressReportModel>> getRoutePolyPoints(String tripId) async {
    try {
      String url = "$apiUrl/trip/_progress/_search?tripId=$tripId";
      List<ProgressReportModel> progressReportList = [];

      final response = await HttpService.getRequest(url);
      if (response.statusCode != 200) {
        log("Error in calling GET ALL ROUTES api");
        log(response.statusCode.toString());
        return progressReportList;
      }

      final data = response.body as List<dynamic>;
      for (var item in data) {
        progressReportList.add(ProgressReportModel.fromJson(item));
      }

      return progressReportList;
    } on FormatException {
      log("Format Exception");
      toaster(null, "Unable to format route from API", isError: true);
      rethrow;
    } catch (e) {
      log("Error in calling GET ROUTE POLYPOINTS api with error: $e");
      toaster(null, "Unable to fetch route from API", isError: true);
      log(e.toString());
      return [];
    }
  }
}
