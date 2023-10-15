import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:map_web_app/blocs/map/controllers/route_controllers.dart';
import 'package:map_web_app/widgets/map/map_app_bar_widget.dart';
import 'package:map_web_app/widgets/map/map_legends_widget.dart';
import 'package:map_web_app/widgets/map/map_tile_widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});
  @override
  Widget build(BuildContext context) {
    DigitTheme theme = DigitTheme.instance;

    return GetBuilder<RouteControllers>(
      builder: (controller) {
        if (controller.progressReportList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          child: Scaffold(
            // * App Bar
            appBar: AppBar(
              toolbarHeight: 100,
              backgroundColor: theme.colors.white,
              centerTitle: false,
              title: const MapAppBarWidget(),
            ),

            // * Flutter Map
            body: FlutterMap(
              // * Map Options
              options: MapOptions(
                center: controller.polyPoints.first,
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
                // * Tile Layer
                tileLayerWidget(),

                // * Polyline Layer
                polyLineWidget(controller),

                // * Marker Layer
                markerLayerWidget(controller),
              ],
            ),
          ),
        );
      },
    );
  }
}
