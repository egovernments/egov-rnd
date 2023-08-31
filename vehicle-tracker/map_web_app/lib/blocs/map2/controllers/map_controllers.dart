import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../constants.dart';

class MapControllers extends GetxController {
  // * Dummy Data
  RxList<Polygon> polygons = <Polygon>[
    Polygon(
      points: [newDelhi, newDelhi2, newDelhi3],
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2,
      isFilled: true,
    ),
    Polygon(
      points: [random1, random2, random3],
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2,
      isFilled: true,
    ),
  ].obs;

  RxList<Marker> markers = <Marker>[].obs;

  RxList<LatLng> newPolyPoints = <LatLng>[].obs;
  Polygon? newPolygon;
  Polygon? edittingPolygon;

  RxBool isFetching = false.obs;
  RxBool isDrawing = false.obs;
  RxBool isEditing = false.obs;
  String siteType = siteTypes.first;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // ? API to fetch data
  Future<void> fetchData() async {
    isFetching.value = true;
    // todo: fetch data from api
    isFetching.value = false;
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

  // ? method to add new polygon to the main list
  void addNewPolygon() {
    if (newPolygon == null) {
      return;
    }

    // todo: call any apis if needed

    // ? To copy the list of points into a new object
    List<LatLng> copy = List.from(newPolyPoints);

    polygons.add(Polygon(
      points: copy,
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2,
      isFilled: true,
    ));

    // ? Clear all the data
    dataClearer();
  }

  // ? method to cancel building new polygon
  void cancelNewPolygon() {
    dataClearer();
  }

  void removePolygon(Polygon polygon) {
    log("Polygon removing");
    
    // todo: call any apis if needed

    polygons.remove(polygon);
  }

  void editPolygonSetup(Polygon oldPolygon) {
    isDrawing.value = true;
    isEditing.value = true;

    polygons.add(
      Polygon(
        points: oldPolygon.points,
        color: Colors.blue.withOpacity(0.5),
        borderColor: Colors.blue,
        borderStrokeWidth: 2,
        isFilled: true,
      ),
    );

    edittingPolygon = oldPolygon;
  }

  void editPolygon() {
    if (newPolygon == null) {
      return;
    }

    // todo: call any apis if needed

    // ? To copy the list of points into a new object
    List<LatLng> copy = List.from(newPolyPoints);

    // ? Remove the old copy polygon
    polygons.removeLast();

    // ? Remove the actual previous polygon
    polygons.remove(edittingPolygon);

    // ? Add the new polygon
    polygons.add(
      Polygon(
        points: copy,
        color: Colors.red.withOpacity(0.5),
        borderColor: Colors.red,
        borderStrokeWidth: 2,
        isFilled: true,
      ),
    );

    // ? Clear all the data
    dataClearer();
  }

  cancelEditPolygon() {
    // ? Remove the old copy polygon
    polygons.removeLast();

    // ? Clear all the data
    dataClearer();
  }

  dataClearer() {
    newPolyPoints.clear();
    newPolygon = null;
    edittingPolygon = null;
    isDrawing.value = false;
    isEditing.value = false;
  }

  String polygonCentreCalculator(List<LatLng> points) {
    double sumX = 0;
    double sumY = 0;

    for (var point in points) {
      sumX += point.latitude;
      sumY += point.longitude;
    }

    String centreX = (sumX / points.length).toStringAsFixed(4);
    String centreY = (sumY / points.length).toStringAsFixed(4);

    return "$centreX, $centreY";
  }
}
