import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../blocs/polygon_map/controllers/map_controllers.dart';

List<Polygon> polygonLayerWidget(MapControllers controller) {
  List<Polygon> polygons = [];

  for (var alertPolygon in controller.alertPolygons) {
    polygons.add(Polygon(
      points: controller.polygonPointBuilder(alertPolygon.locationDetails),
      color: DigitTheme.instance.colors.paleRose.withOpacity(0.6),
      borderColor: DigitTheme.instance.colors.lavaRed,
      borderStrokeWidth: 2,
      isFilled: true,
      label: alertPolygon.locationName,
      labelStyle: TextStyle(
        color: DigitTheme.instance.colors.lavaRed,
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  if (controller.newPolygon != null) {
    polygons.add(controller.newPolygon!);
  }

  // if (controller.edittingPolygon. != null) {
  //   polygons.add(controller.edittingPolygon!);
  // }

  if (controller.selectedPolygon.value != null) {
    polygons.add(controller.selectedPolygon.value!);
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
    builder: (context) => Icon(
      Icons.location_on,
      color: DigitTheme.instance.colors.lavaRed,
      size: 20,
    ),
  );
}
