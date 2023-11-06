import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:route_map/blocs/route_map/repository/map_http_repository.dart';

import '../../../constants.dart';
import '../../../data/http_service.dart';
import '../../../models/alert_polygon/alert_polygons.dart';
import '../../../models/trip_progress/progress_report_model.dart';

class RouteControllers extends GetxController {
  final String tripId;
  final String userId;
  final String tenantId;

  RouteControllers(this.tripId, this.userId, this.tenantId);

  late Timer _timer;
  RxList<ProgressReportModel> progressReportList = <ProgressReportModel>[].obs;
  RxBool isFetching = false.obs;
  RxList<LatLng> polyPoints = <LatLng>[].obs;

  RxList<LatLng> alertMarkers = <LatLng>[].obs;
  RxList<AlertPolygon> alertPolygons = <AlertPolygon>[].obs;

  // void startPolling() {
  //   _timer = Timer.periodic(
  //     const Duration(seconds: 10),
  //     (timer) async {
  //       await fetchData();
  //     },
  //   );
  // }

  void stopPolling() {
    _timer.cancel();
  }

  Future<void> fetchData() async {
    isFetching.value = true;

    await Future.wait([
      fetchRoute(),
      fetchPolygons(),
    ]);

    isFetching.value = false;
  }

  Future<void> fetchPolygons() async {
    log("Fetching Polygons");

    final alertPolygons = await MapHttpRepository.getAllPolygonsWithAlerts(tenantId);

    this.alertPolygons = alertPolygons.obs;

    log("Alert Polygons: ${this.alertPolygons.length}");
    update();
  }

  Future<void> fetchRoute() async {
    String url = "$apiUrl/trip/_progress/_search?tripId=$tripId";

    final response = await HttpService.getRequest(url);
    if (response.statusCode == 200) {
      final data = response.body as List<dynamic>;
      for (var item in data) {
        final progressReport = ProgressReportModel.fromJson(item);
        progressReportList.add(progressReport);
      }
    }

    for (var item in progressReportList) {
      final list = item.location;
      if (list == null) {
        continue;
      }

      if (item.alert != null) {
        final point = LatLng(list.latitude, list.longitude);
        alertMarkers.add(point);
        continue;
      }

      polyPoints.add(LatLng(list.latitude, list.longitude));
    }

    update();

    log("Alert Markers: ${alertMarkers.length}");
    log("Polyline Points: ${polyPoints.length}");
  }

  List<LatLng> polygonPointBuilder(List<LocationDetails>? locationDetails) {
    List<LatLng> points = [];

    if (locationDetails == null) {
      return points;
    }

    for (var locationDetail in locationDetails) {
      if (locationDetail.longitude == null) {
        continue;
      }

      points.add(LatLng(locationDetail.latitude, locationDetail.longitude));
    }

    return points;
  }
}
