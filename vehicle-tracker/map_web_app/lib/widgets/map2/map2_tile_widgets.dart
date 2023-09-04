import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_web_app/blocs/map2/controllers/map_controllers.dart';

List<Polygon> polygonLayerWidget(MapControllers controller) {
  List<Polygon> polygons = [];

  // for (var polygon in controller.polygons) {
  //   polygons.add(polygon);
  // }

  for (var alertPolygon in controller.alertPolygons) {
    polygons.add(Polygon(
      points: controller.polygonPointBuilder(alertPolygon.locationDetails),
      color: Colors.red.withOpacity(0.5),
      borderColor: Colors.red,
      borderStrokeWidth: 2,
      isFilled: true,
    ));
  }

  if (controller.newPolygon != null) {
    polygons.add(controller.newPolygon!);
  }

  return polygons;
}

MarkerLayer markerLayerWidget2(MapControllers controller) => MarkerLayer(
      markers: [
        if (controller.newPolyPoints.isNotEmpty)
          for (var point in controller.newPolyPoints) markerBuilder(controller, point),
      ],
    );

Marker markerBuilder(MapControllers controller, LatLng point) {
  return Marker(
    point: point,
    builder: (context) => const Icon(
      Icons.location_on,
      color: Colors.red,
      size: 20,
    ),
  );
}
