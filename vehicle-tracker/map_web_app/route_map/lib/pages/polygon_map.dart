import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:route_map/constants.dart';
import 'package:route_map/widgets/polygon_map/menu_tile_widget.dart';

import '../blocs/polygon_map/controllers/map_controllers.dart';
import '../util/geolocation_permission_util.dart';
import '../widgets/polygon_map/map2_tile_widgets.dart';
import '../widgets/polygon_map/tile_layer_widget.dart';

class PolygonMapPage extends StatefulWidget {
  const PolygonMapPage({super.key});

  @override
  State<PolygonMapPage> createState() => _PolygonMapPageState();
}

class _PolygonMapPageState extends State<PolygonMapPage> {
  final geolocationPermission = GeolocationPermissionUtil();
  var mapCenterPosition = defaultLatLng;

  @override
  void initState() {
    _updateMapPosition();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _updateMapPosition() async {
    final isPermissionGranted = await geolocationPermission.handleLocationPermission();
    log("isPermissionGranted : $isPermissionGranted");
    if (isPermissionGranted) {
      log("Getting current location");
      final position = await geolocationPermission.getCurrentLocation();
      log("Current Position : $position");
      setState(() {
        log("Setting mapCenterPosition : $position");
        mapCenterPosition = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = Get.parameters['userid'];
    final tenantId = Get.parameters['tenantid'];

    if (userId == null || tenantId == null) {
      return const Scaffold(
        body: Center(
          child: Text("User Id or Tenant Id is null"),
        ),
      );
    }

    final mapController = Get.put(MapControllers(userId, tenantId));
    mapController.fetchData();

    return GetX<MapControllers>(
      builder: (controller) {
        if (controller.isFetching.isTrue) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (controller.alertPolygons.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text("No Polygons found"),
            ),
          );
        }

        return SafeArea(
          child: Scaffold(
            // * Flutter Map
            body: FlutterMap(
              // * Options
              options: MapOptions(
                center: mapCenterPosition,
                zoom: 13,
                maxZoom: 18,
                minZoom: 1,
                onTap: (tapPosition, point) {
                  // ? The tap behavious will change accordingly when we are building a polygon
                  if (controller.isDrawing.isTrue) {
                    controller.addNewPolyPoints(point);
                  }
                },
              ),

              nonRotatedChildren: const [
                // * Menu Icon
                PolygonMenuWidget(),
              ],

              children: [
                // * Tile Layer
                tileLayerWidget(),

                // * Polygon Layer
                PolygonLayer(
                  polygons: polygonLayerWidget(controller),
                  polygonCulling: false,
                ),

                // * Marker Layer
                markerLayerWidget2(controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
