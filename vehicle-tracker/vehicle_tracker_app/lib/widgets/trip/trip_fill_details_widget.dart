import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';

import '../../blocs/details/controllers/detail_controller.dart';

Widget tankTypeSelector(DetailController detailController) => Column(
      children: [
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Conventional Septic Tank"),
          value: 0,
          groupValue: detailController.tankType.value,
          onChanged: (value) => detailController.setTankValue(0),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Septic Tank with Soak Pit"),
          value: 1,
          groupValue: detailController.tankType.value,
          onChanged: (value) => detailController.setTankValue(1),
        ),
      ],
    );

Widget skipNextButton(DetailController detailController) => Padding(
      padding: DigitTheme.instance.buttonPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DigitOutLineButton(onPressed: () {}, label: "Skip"),
          DigitElevatedButton(child: const Text("Next"), onPressed: () => Get.toNamed(UPLOAD_SAFETY))
        ],
      ),
    );
