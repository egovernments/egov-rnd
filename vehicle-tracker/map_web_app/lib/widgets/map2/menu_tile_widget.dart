import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:map_web_app/blocs/map2/controllers/map_controllers.dart';
import 'package:map_web_app/constants.dart';

class CreatePolygonWidget extends StatelessWidget {
  const CreatePolygonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MapControllers>(
      builder: (controller) {
        if (controller.isDrawing.isTrue) {
          return addPolygonWidget(controller, context);
        }
        return createPolygonWidget(controller, context);
      },
    );
  }
}

Widget addPolygonWidget(MapControllers controller, BuildContext context) {
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;
  final theme = DigitTheme.instance;
  // final width = MediaQuery.of(context).size.width;

  return Align(
    alignment: Alignment.centerLeft,
    child: SizedBox(
      width: 350,
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * Heading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kPadding),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: theme.colors.burningOrange),
                  Text("Add Point Location", style: textTheme.headlineMedium),
                ],
              ),
            ),

            // * Text Fields for Site Name
            const DigitTextField(label: "Site Name"),

            // * Dropdown Menu for Site Type
            DigitDropdown<String>(
              value: controller.siteType,
              label: "Site Type",
              menuItems: siteTypes,
              valueMapper: (value) => value,
              onChanged: (value) => controller.siteType = value ?? "",
            ),

            // * Text Field for Alert Distance
            const DigitTextField(label: "Alert when within a distance (meters) of "),

            // * Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // * Button to Add Location
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: DigitElevatedButton(
                    onPressed: () {
                      controller.addNewPolygon();
                      log("Polygon Added");
                    },
                    child: const Text("Add Location"),
                  ),
                ),

                // * Button to Cancel
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPadding),
                  child: DigitOutLineButton(
                    onPressed: () {
                      controller.cancelNewPolygon();
                    },
                    label: "\t\tCancel\t\t",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

TableRow tableRowHead() {
  return const TableRow(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 2),
        child: Text("Location"),
      ),
      Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text("Last Week \nStops"),
      ),
      Padding(
        padding: EdgeInsets.all(kPadding),
        child: Text("Actions"),
      ),
    ],
  );
}

TableRow tableRowItemBuilder(Polygon polygon, DigitTheme theme, MapControllers controller) {
  log(controller.polygons.length.toString());

  return TableRow(children: [
    const Padding(
      padding: EdgeInsets.symmetric(vertical: kPadding, horizontal: kPadding * 2),
      child: Text("Name"),
    ),
    const Padding(
      padding: EdgeInsets.all(kPadding),
      child: Text("12"),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
          color: theme.colors.burningOrange,
        ),
        IconButton(
          onPressed: () => controller.removePolygon(polygon),
          icon: const Icon(Icons.delete),
          color: theme.colors.burningOrange,
        ),
      ],
    ),
  ]);
}

Widget createPolygonWidget(MapControllers controller, BuildContext context) {
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;
  final theme = DigitTheme.instance;

  return Align(
    alignment: Alignment.centerLeft,
    child: SizedBox(
      width: 400,
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * List of all the polygons
            Table(
              border: TableBorder.all(color: theme.colors.black),
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
              },
              children: [
                tableRowHead(),
                for (final polygon in controller.polygons) tableRowItemBuilder(polygon, theme, controller),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: theme.colors.burningOrange),
                  Text("Add Point Location", style: textTheme.headlineLarge),
                ],
              ),
            ),
            DigitElevatedButton(
              onPressed: () {
                controller.isDrawing.value = true;
              },
              child: const Text("Create Polygon"),
            ),
          ],
        ),
      ),
    ),
  );
}
