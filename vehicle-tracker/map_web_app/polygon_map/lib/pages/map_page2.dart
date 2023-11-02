import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

import '../blocs/polygon_map/controllers/map_controllers.dart';
import '../widgets/map2_tile_widgets.dart';
import '../widgets/menu_tile_widget.dart';
import '../widgets/tile_layer_widget.dart';

class PolygonMap extends StatelessWidget {
  const PolygonMap({super.key});

  @override
  Widget build(BuildContext context) {
    
    final userId = Get.parameters['userid'];
    if (userId == null) {
     return const Scaffold(
       body: Center(
         child: Text("User Id is null"),
       ),
     ); 
    }

    final mapController = Get.find<MapControllers>();
    mapController.userID = userId;
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

        return SafeArea(
          child: Scaffold(
            // * Flutter Map
            body: FlutterMap(
              // * Options
              options: MapOptions(
                center: controller.locationSetter(),
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
                CreatePolygonWidget(),
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
