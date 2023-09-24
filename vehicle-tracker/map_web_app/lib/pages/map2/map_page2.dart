
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:map_web_app/widgets/map/map_tile_widgets.dart';
import 'package:map_web_app/widgets/map2/map2_tile_widgets.dart';
import 'package:map_web_app/widgets/map2/menu_tile_widget.dart';

import '../../blocs/map2/controllers/map_controllers.dart';

class MapPage2 extends StatelessWidget {
  const MapPage2({super.key});

  @override
  Widget build(BuildContext context) {
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
