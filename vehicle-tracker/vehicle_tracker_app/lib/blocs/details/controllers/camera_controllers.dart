import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraControllers extends GetxController {
  final image = Rx<File?>(null);

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      log("Image added");
      image.value = File(pickedFile.path);
    }
  }
}
