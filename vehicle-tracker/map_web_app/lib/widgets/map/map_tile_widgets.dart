import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:map_web_app/blocs/map/controllers/route_controllers.dart';

import '../../constants.dart';

PolylineLayer polyLineWidget(RouteControllers controller) => PolylineLayer(
      polylines: [
        Polyline(
          points: controller.polyPoints,
          strokeWidth: 2.0,
          color: Colors.blue,
        ),
      ],
    );

MarkerLayer markerLayerWidget(RouteControllers controller) => MarkerLayer(
      rotate: true,
      markers: [
        // * Start Location
        Marker(
          point: controller.polyPoints.first,
          builder: (ctx) => const Icon(Icons.fire_truck, color: Colors.blue),
        ),

        // * End Location
        Marker(
          rotate: true,
          point: controller.polyPoints.last,
          builder: (ctx) => const Icon(Icons.warehouse, color: Colors.blue),
        ),
      ],
    );

TileLayer tileLayerWidget() => TileLayer(
      urlTemplate: urlTemplate,
      subdomains: subDomain,
    );
