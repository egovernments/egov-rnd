import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../blocs/route_map/controllers/route_controllers.dart';
import '../../constants.dart';

PolylineLayer polyLineWidget(RouteControllers controller) => PolylineLayer(
      polylines: [
        Polyline(
          points: controller.polyPoints,
          strokeWidth: 2.0,
          color: DigitTheme.instance.colors.curiousBlue,
        ),
      ],
    );

MarkerLayer markerLayerWidget(RouteControllers controller) => MarkerLayer(
      rotate: true,
      markers: [
        // * Start Location
        Marker(
          point: controller.polyPoints.first,
          builder: (ctx) => Icon(Icons.fire_truck, color: DigitTheme.instance.colors.curiousBlue),
        ),

        // * End Location
        Marker(
          rotate: true,
          point: controller.polyPoints.last,
          builder: (ctx) => Icon(Icons.warehouse, color: DigitTheme.instance.colors.curiousBlue),
        ),

        // * Alert Markers
        for (final marker in controller.alertMarkers)
          Marker(
            point: marker,
            builder: (ctx) => Icon(
              Icons.warning,
              color: DigitTheme.instance.colors.lavaRed,
            ),
          ),
      ],
    );

TileLayer tileLayerWidget() => TileLayer(
      urlTemplate: urlTemplate,
      subdomains: subDomain,
    );
