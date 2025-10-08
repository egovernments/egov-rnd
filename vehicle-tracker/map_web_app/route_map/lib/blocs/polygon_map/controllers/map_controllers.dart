// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../constants.dart';
import '../../../models/alert_polygon/alert_polygons.dart';
import '../repository/map2_http_repository.dart';

class MapControllers extends GetxController {
  final String userId;
  final String tenantId;

  MapControllers(this.userId, this.tenantId);

  RxList<AlertPolygon> alertPolygons = <AlertPolygon>[].obs;

  RxList<Marker> markers = <Marker>[].obs;
  RxList<AlertPolygon> alertMarkers = <AlertPolygon>[].obs;

  RxList<LatLng> newPolyPoints = <LatLng>[].obs;

  Polygon? newPolygon;
  AlertPolygon? edittingAlertPolygon;
  var selectedPolygon = Rxn<Polygon>();

  RxBool isFetching = false.obs;
  RxBool isDrawing = false.obs;
  RxBool isEditing = false.obs;
  String siteType = siteTypes.first;

  TextEditingController siteNameController = TextEditingController();
  // TextEditingController siteDistanceController = TextEditingController();

  DigitTheme theme = DigitTheme.instance;

  // ? API to fetch data
  Future<void> fetchData() async {
    isFetching.value = true;

    final alertPolygons = await Map2HttpRepository.getAllPolygonsWithAlerts(tenantId);

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

  // ? Function to get all data from the api and set up the markers for the map
  // This will render points on the map and as the points are increasing, it will build a polygon
  // using those points.
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

  // ? method to add new polypoints to the dummy array
  void addNewPolyPoints(LatLng point) {
    newPolyPoints.add(point);
    newPolygonBuilder();
  }

  // ? method to build new polygon from the dummy object
  void newPolygonBuilder() {
    newPolygon = Polygon(
      points: newPolyPoints,
      color: theme.colors.lavaRed.withOpacity(0.5),
      borderColor: theme.colors.lavaRed,
      borderStrokeWidth: 2,
      isFilled: true,
    );
  }

  // ? Method to add new polygon to the main polygon array
  // This will use the dummy polygon and deep copy it to the main polygon array
  // This will also call the api to create new polygon in the server
  // After the polygon is created, the dummy polygon is deleted
  void addNewPolygon() async {
    if (newPolygon == null || newPolyPoints.isEmpty) {
      return;
    }

    if (siteNameController.text.isEmpty) {
      return;
    }

    List<LocationDetails> copy = [];

    for (var point in newPolyPoints) {
      copy.add(LocationDetails(
        latitude: point.latitude,
        longitude: point.longitude,
      ));
    }

    // * Add the first point to the last to make it a closed polygon
    if (newPolyPoints.length > 2) {
      copy.add(LocationDetails(
        latitude: newPolyPoints.first.latitude,
        longitude: newPolyPoints.first.longitude,
      ));
    }

    AlertPolygon newAlertPolygon = AlertPolygon(
      locationName: siteNameController.text,
      status: "active",
      type: shapeTypeSetter(copy.length),
      userId: userId,
      alert: "Alert-001",
      distanceMeters: 0,
      locationDetails: copy,
      id: '',
      tenantId: tenantId,
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

  // ? method to edit polygon
  // What it does is build a new dummy polygon on tha map with different color so as to show which polygon we are editing
  // As the user clicks on the map to add new points, the a new polygon is drawed
  // When the user clicks on the save button, the dummy polygon is deep copied and saved to the main polygon array and sent to the server
  // THe old dummy polygon is deleted after it
  void editPolygon() async {
    if (newPolygon == null || newPolyPoints.isEmpty) {
      log("empty build polygon");
      return;
    }

    if (siteNameController.text.isEmpty) {
      log("empty text field");
      return;
    }

    List<LocationDetails> copy = [];

    for (var point in newPolyPoints) {
      copy.add(LocationDetails(
        latitude: point.latitude,
        longitude: point.longitude,
      ));
    }

    // * Add the first point to the last to make it a closed polygon
    if (newPolyPoints.length > 2) {
      copy.add(LocationDetails(
        latitude: newPolyPoints.first.latitude,
        longitude: newPolyPoints.first.longitude,
      ));
    }

    AlertPolygon newAlertPolygon = AlertPolygon(
      id: edittingAlertPolygon?.id ?? "",
      locationName: siteNameController.text,
      status: "active",
      type: shapeTypeSetter(copy.length),
      userId: userId,
      alert: "Alert-001",
      distanceMeters: 0,
      locationDetails: copy,
      tenantId: tenantId,
    );

    // * Call the api to create new polygon
    final response = await Map2HttpRepository.updatePolygon(newAlertPolygon);
    if (response == false) {
      log("Error in calling CREATE POLYGON api");
      return;
    }

    // * Add the new polygon to the list
    alertPolygons.remove(edittingAlertPolygon);
    alertPolygons.add(newAlertPolygon);

    log("Done");

    // * Clear all the data
    dataClearer();
  }

  // ? A method to set the type of the polygon based on the number of points
  String shapeTypeSetter(int points) {
    switch (points) {
      case 0:
        return "None";

      case 1:
        return "point";

      case 2:
        return "line";

      default:
        return "polygon";
    }
  }

  // ? method to cancel building new polygon
  void cancelNewPolygon() {
    dataClearer();
  }

  void removePolygon(AlertPolygon alertPolygon) async {
    final isDeleted = await Map2HttpRepository.deletePolygon(alertPolygon.id ?? "", tenantId);
    if (isDeleted == false) {
      return;
    }

    alertPolygons.remove(alertPolygon);
  }

  void editPolygonSetup(AlertPolygon oldPolygon) {
    isDrawing.value = true;
    isEditing.value = true;

    selectedPolygon.value = Polygon(
      points: oldPolygon.locationDetails!.map((e) => LatLng(e.latitude, e.longitude)).toList(),
      color: theme.colors.curiousBlue.withOpacity(0.5),
      borderColor: theme.colors.curiousBlue,
      borderStrokeWidth: 2,
      isFilled: true,
    );

    edittingAlertPolygon = oldPolygon;

    log("Polygon editing");
  }

  // ? method to clear all the objwcts and reset it
  dataClearer() {
    newPolyPoints.clear();
    newPolygon = null;
    edittingAlertPolygon = null;
    selectedPolygon.value = null;
    isDrawing.value = false;
    isEditing.value = false;
    siteNameController.clear();
  }

  // ? This will calculate the centre of a polygon by taking avg of all the points in that polygom
  // ? Calculating the actual centroid of every kind of polygon would be complex and take extra computation
  String polygonCentreCalculator(List<LocationDetails> points) {
    double sumX = 0;
    double sumY = 0;

    for (var point in points) {
      if (point.longitude == null) {
        continue;
      }

      sumX += point.latitude;
      sumY += point.longitude;
    }

    String centreX = (sumX / points.length).toStringAsFixed(4);
    String centreY = (sumY / points.length).toStringAsFixed(4);

    return "$centreX, $centreY";
  }
}
