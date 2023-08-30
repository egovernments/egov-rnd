import 'dart:developer';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
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
  final width = MediaQuery.of(context).size.width;

  return Align(
    alignment: Alignment.centerLeft,
    child: SizedBox(
      width: width * 0.2,
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // * Heading
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

Widget createPolygonWidget(MapControllers controller, BuildContext context) {
  final textTheme = DigitTheme.instance.mobileTheme.textTheme;
  final theme = DigitTheme.instance;
  final width = MediaQuery.of(context).size.width;

  return Align(
    alignment: Alignment.centerLeft,
    child: SizedBox(
      width: width * 0.2,
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
