import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_web_app/models/map2/alert_polygons.dart';

import '../../../constants.dart';
import '../repository/map2_http_repository.dart';

class MapControllers extends GetxController {
  RxList<AlertPolygon> alertPolygons = <AlertPolygon>[].obs;

  RxList<Marker> markers = <Marker>[].obs;
  RxList<AlertPolygon> alertMarkers = <AlertPolygon>[].obs;

  RxList<LatLng> newPolyPoints = <LatLng>[].obs;

  Polygon? newPolygon;
  Polygon? edittingPolygon;

  RxBool isFetching = false.obs;
  RxBool isDrawing = false.obs;
  RxBool isEditing = false.obs;
  String siteType = siteTypes.first;

  TextEditingController siteNameController = TextEditingController();
  TextEditingController siteDistanceController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // ? API to fetch data
  Future<void> fetchData() async {
    isFetching.value = true;

    final alertPolygons = await Map2HttpRepository.getAllPolygonsWithAlerts();

    for (var alartPolygon in alertPolygons) {
      if (alartPolygon.type == "point") {
        alertMarkers.add(alartPolygon);
      } else {
        this.alertPolygons.add(alartPolygon);
      }
    }

    log("Alert Markers: ${alertMarkers.length}");
    log("Alert Polygons: ${this.alertPolygons.length}");

    isFetching.value = false;
  }

  LatLng locationSetter() {
    return custom;

    if (alertMarkers.isNotEmpty && alertMarkers.first.locationDetails!.isNotEmpty) {
      return LatLng(
        alertMarkers.first.locationDetails!.last.latitude!,
        alertMarkers.first.locationDetails!.last.longitude!,
      );
    } else {
      return newDelhi;
    }
  }

  List<LatLng> polygonPointBuilder(List<LocationDetails>? locationDetails) {
    List<LatLng> points = [];

    if (locationDetails == null) {
      return points;
    }

    for (var locationDetail in locationDetails) {
      if (locationDetail.latitude == null || locationDetail.longitude == null) {
        continue;
      }

      points.add(LatLng(locationDetail.latitude!, locationDetail.longitude!));
    }

    return points;
  }

  // ? method to add new polypoints to the dummy list
  void addNewPolyPoints(LatLng point) {
    newPolyPoints.add(point);
    newPolygonBuilder();
  }

  // ? method to build new polygon from the dummy list
  void newPolygonBuilder() {
    newPolygon = Polygon(
      points: newPolyPoints,
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2,
      isFilled: true,
    );
  }

  // ? Method to add new polygon to the main list
  void addNewPolygon() async {
    if (newPolygon == null || newPolyPoints.isEmpty) {
      return;
    }

    if (siteNameController.text.isEmpty || siteDistanceController.text.isEmpty) {
      return;
    }

    List<LocationDetails> copy = [];

    for (var point in newPolyPoints) {
      copy.add(LocationDetails(
        latitude: point.latitude,
        longitude: point.longitude,
      ));
    }

    AlertPolygon newAlertPolygon = AlertPolygon(
      locationName: siteNameController.text,
      status: "active",
      type: shapeTypeSetter(copy.length),
      userId: "rajan123",
      alert: ["Alert-001"],
      distanceMeters: int.parse(siteDistanceController.text),
      locationDetails: copy,
    );

    // * Call the api to create new polygon
    final response = await Map2HttpRepository.createPolygon(newAlertPolygon);
    if (response == false) {
      log("Error in calling CREATE POLYGON api");
      return;
    }

    // * Add the new polygon to the list
    alertPolygons.add(newAlertPolygon);

    // * Clear all the data
    dataClearer();
  }

  String shapeTypeSetter(int points) {
    switch (points) {
      case 0:
        return "None";

      case 1:
        return "Point";

      case 2:
        return "Line";

      default:
        return "Polygon";
    }
  }

  // ? method to cancel building new polygon
  void cancelNewPolygon() {
    dataClearer();
  }

  void removePolygon(AlertPolygon alertPolygon) {
    log("Polygon removing");

    // todo: call any apis if needed

    alertPolygons.remove(alertPolygon);
  }

  // void editPolygonSetup(Polygon oldPolygon) {
  //   isDrawing.value = true;
  //   isEditing.value = true;

  //   polygons.add(
  //     Polygon(
  //       points: oldPolygon.points,
  //       color: Colors.blue.withOpacity(0.5),
  //       borderColor: Colors.blue,
  //       borderStrokeWidth: 2,
  //       isFilled: true,
  //     ),
  //   );

  //   edittingPolygon = oldPolygon;
  // }

  // void editPolygon() {
  //   if (newPolygon == null) {
  //     return;
  //   }

  //   // todo: call any apis if needed

  //   // ? To copy the list of points into a new object
  //   List<LatLng> copy = List.from(newPolyPoints);

  //   // ? Remove the old copy polygon
  //   polygons.removeLast();

  //   // ? Remove the actual previous polygon
  //   polygons.remove(edittingPolygon);

  //   // ? Add the new polygon
  //   polygons.add(
  //     Polygon(
  //       points: copy,
  //       color: Colors.red.withOpacity(0.5),
  //       borderColor: Colors.red,
  //       borderStrokeWidth: 2,
  //       isFilled: true,
  //     ),
  //   );

  //   // ? Clear all the data
  //   dataClearer();
  // }

  // cancelEditPolygon() {
  //   // ? Remove the old copy polygon
  //   polygons.removeLast();

  //   // ? Clear all the data
  //   dataClearer();
  // }

  dataClearer() {
    newPolyPoints.clear();
    newPolygon = null;
    edittingPolygon = null;
    isDrawing.value = false;
    isEditing.value = false;
    siteNameController.clear();
    siteDistanceController.clear();
  }

  String polygonCentreCalculator(List<LocationDetails> points) {
    double sumX = 0;
    double sumY = 0;

    for (var point in points) {
      if (point.latitude == null || point.longitude == null) {
        continue;
      }

      sumX += point.latitude!;
      sumY += point.longitude!;
    }

    String centreX = (sumX / points.length).toStringAsFixed(4);
    String centreY = (sumY / points.length).toStringAsFixed(4);

    return "$centreX, $centreY";
  }
}
