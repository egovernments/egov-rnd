import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:route_map/constants.dart';
import 'package:route_map/util/geolocation_permission_util.dart';
import 'package:route_map/widgets/route_map/map_legends_widget.dart';

import '../blocs/route_map/controllers/route_controllers.dart';
import '../widgets/route_map/map_tile_widgets.dart';
import '../widgets/route_map/polygon_layer_widget.dart';

class RouteMapPage extends StatefulWidget {
  const RouteMapPage({super.key});

  @override
  State<RouteMapPage> createState() => _RouteMapPageState();
}

class _RouteMapPageState extends State<RouteMapPage> {
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

  // * Update the map position to the current location
  void _updateMapPosition() async {
    final isPermissionGranted = await geolocationPermission.handleLocationPermission();
    if (isPermissionGranted) {
      final position = await geolocationPermission.getCurrentLocation();
      setState(() {
        mapCenterPosition = position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // * Get the tripId from the URL
    final tripId = Get.parameters['tripid'];
    final tenantId = Get.parameters['tenantid'];

    if (tripId == null || tenantId == null) {
      return const Scaffold(
        body: Center(
          child: Text("No tripId or tenantId found"),
        ),
      );
    }

    // * Fetch the data from the API using the tripId
    final routeController = Get.put(RouteControllers(tripId, tenantId));
    routeController.fetchData();

    return GetBuilder<RouteControllers>(
      builder: (controller) {
        if (controller.isFetching.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: Scaffold(
            //  App Bar (will be used in future)
            // appBar: AppBar(
            //   toolbarHeight: 100,
            //   backgroundColor: theme.colors.white,
            //   centerTitle: false,
            //   title: const MapAppBarWidget(),
            // ),

            // * Flutter Map
            body: FlutterMap(
              // * Map Options
              options: MapOptions(
                center: mapCenterPosition,
                zoom: 15,
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
                // * Tile Layer
                tileLayerWidget(),

                // * Polyline Layer
                polyLineWidget(controller),

                // * Polygon Layer
                PolygonLayer(
                  polygons: polygonLayerWidget(controller),
                  polygonCulling: false,
                ),

                // * Marker Layer
                if (controller.polyPoints.isNotEmpty) markerLayerWidget(controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
