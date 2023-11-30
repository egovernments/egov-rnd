import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:route_map/blocs/route_map/repository/map_http_repository.dart';
import 'package:route_map/util/distance_calculator.dart';

import '../../../models/alert_polygon/alert_polygons.dart';
import '../../../models/trip_progress/progress_report_model.dart';

class RouteControllers extends GetxController {
  final String tripId;
  final String tenantId;

  RouteControllers(this.tripId, this.tenantId);

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
    log("Fetching Route");

    progressReportList.value = await MapHttpRepository.getRoutePolyPoints(tripId);

    int listLength = progressReportList.length;
    for (int i = 0; i < listLength - 1; i++) {
      final item = progressReportList[i].location;
      if (item == null) {
        continue;
      }

      polyPoints.add(LatLng(item.latitude, item.longitude));

      if (progressReportList[i].alert != null) {
        final point = LatLng(item.latitude, item.longitude);
        alertMarkers.add(point);
      }

      if (listLength > 3 && i < listLength - 3) {
        final isSlow = isVehicleSlow(item, progressReportList[i + 3].location);
        if (isSlow) {
          final point = LatLng(item.latitude, item.longitude);
          alertMarkers.add(point);
        }
      }
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
      points.add(LatLng(locationDetail.latitude, locationDetail.longitude));
    }

    return points;
  }

  bool isVehicleSlow(Location? marker1, Location? marker2) {
    if (marker1 == null || marker2 == null) {
      return false;
    }

    int distance = calculateDistance(
      LatLng(marker1.latitude, marker1.longitude),
      LatLng(marker2.latitude, marker2.longitude),
    ).toInt();
    if (distance < 10) {
      return true;
    }

    return false;
  }
}
