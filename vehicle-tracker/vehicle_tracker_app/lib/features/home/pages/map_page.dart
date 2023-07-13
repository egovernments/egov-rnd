// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../constants.dart';
import '../widgets/map_marker.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? markerPosition = Get.arguments['position'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Open Street Map Preview"),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: markerPosition,
            zoom: 17,
            maxZoom: 18,
            minZoom: 1,
            onPositionChanged: (position, hasGesture) {
              setState(() {
                markerPosition = position.center ?? markerPosition;
              });
            },
          ),
          // nonRotatedChildren: [
          //   // PlaceDetails(position: position, placeController: placeController),
          //   // ConfirmButton(placeController: placeController)
          // ],
          children: [
            TileLayer(
              urlTemplate: urlTemplate,
              subdomains: const ['a', 'b', 'c'],
            ),
            Markers(position: markerPosition!)
          ],
        ),
      ),
    );
  }
}