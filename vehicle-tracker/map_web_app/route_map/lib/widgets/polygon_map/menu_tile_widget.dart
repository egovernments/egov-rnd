
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../blocs/polygon_map/controllers/map_controllers.dart';
import 'add_polygon_menu_widget.dart';
import 'edit_polygon_widget_menu.dart';
import 'view_polygons_menu_widget.dart';

class CreatePolygonWidget extends StatelessWidget {
  const CreatePolygonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MapControllers>(
      builder: (controller) {
        if (controller.isDrawing.isTrue && controller.isEditing.isTrue) {
          return editPolygonMenuWidget(controller, context);
        }

        if (controller.isDrawing.isTrue) {
          return addPolygonMenuWidget(controller, context);
        }

        return createPolygonMenuWidget(controller, context);
      },
    );
  }
}
