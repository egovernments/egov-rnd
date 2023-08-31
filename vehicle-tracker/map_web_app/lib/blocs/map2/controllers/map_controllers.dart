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

  RxBool isFetching = false.obs;
  RxBool isDrawing = false.obs;
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

  // ? Method to start adding new location
  void startAddLocation() {
    isDrawing.value = true;
  }

  // ? method to add new polypoints to the dummy list
  void addNewPolyPoints(LatLng point) {
    newPolyPoints.add(point);
    newPolygonBuilder();

    log("Point : $point");
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

    // ? To copy the list of points into a new object
    List<LatLng> copy = List.from(newPolyPoints);

    polygons.add(Polygon(
      points: copy,
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2,
      isFilled: true,
    ));

    newPolyPoints.clear();
    newPolygon = null;
    isDrawing.value = false;
  }

  // ? method to cancel building new polygon
  void cancelNewPolygon() {
    newPolyPoints.clear();
    newPolygon = null;
    isDrawing.value = false;
  }

  void removePolygon(Polygon polygon) {
    log("Polygon removing");
    polygons.remove(polygon);
    log(polygons.length.toString());
  }
}
