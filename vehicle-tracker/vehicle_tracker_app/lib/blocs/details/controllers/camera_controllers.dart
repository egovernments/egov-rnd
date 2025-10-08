import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraControllers extends GetxController {
  final imageSafety = Rx<File?>(null);
  final imageDrop = Rx<File?>(null);

  Future<void> pickImageSafety() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      log("Image added");
      imageSafety.value = File(pickedFile.path);
    }
  }

  Future<void> pickImageDrop() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      log("Image added");
      imageDrop.value = File(pickedFile.path);
    }
  }
}
