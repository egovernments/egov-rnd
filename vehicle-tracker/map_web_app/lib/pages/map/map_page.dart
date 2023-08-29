import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_web_app/blocs/map/controllers/route_controllers.dart';
import 'package:map_web_app/constants.dart';
import 'package:map_web_app/widgets/map/map_app_bar_widget.dart';
import 'package:map_web_app/widgets/map/map_legends_widget.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouteControllers>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: const MapAppBarWidget(),
          ),
          body: FlutterMap(
            // * Map Options
            options: MapOptions(
              center: const LatLng(37.785835, -122.40642),
              zoom: 13,
              maxZoom: 18,
              minZoom: 1,
            ),

            // * Widgets
            nonRotatedChildren: const [
              Align(
                alignment: Alignment.bottomRight,
                child: MapLegendsWidget(),
              )
            ],

            // * Layers
            children: [
              TileLayer(
                urlTemplate: urlTemplate,
                subdomains: subDomain,
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: controller.polyPoints,
                    strokeWidth: 20.0,
                    color: Colors.blue,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
