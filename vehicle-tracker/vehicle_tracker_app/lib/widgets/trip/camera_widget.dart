import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/details/controllers/camera_controllers.dart';

class CameraWidget extends StatelessWidget {
  CameraWidget({super.key});

  final cameraController = Get.find<CameraControllers>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DigitTheme.instance.buttonPadding,
      child: SizedBox(
        height: 200,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Colors.white,
          ),
          child: Center(child: Obx(() {
            if (cameraController.image.value != null) {
              return Image.file(cameraController.image.value!, fit: BoxFit.cover);
            }

            return DigitIconButton(
              icon: Icons.camera_alt_outlined,
              iconText: "Click to add photo",
              onPressed: () => cameraController.pickImage(),
            );
          })),
        ),
      ),
    );
  }
}
