import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/widgets/utils/scrollable_header_widget.dart';
import 'package:vehicle_tracker_app/widgets/trip/camera_widget.dart';

import '../../blocs/details/controllers/camera_controllers.dart';
import '../../widgets/utils/drawer_widget.dart';

enum PhotoType { Drop, Safety }

class UploadPhotoPage extends StatelessWidget {
  final PhotoType photoType;

  const UploadPhotoPage({Key? key, required this.photoType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cameraController = Get.find<CameraControllers>();

    return Scaffold(
      appBar: AppBar(centerTitle: false),
      drawer: const CustomDrawer(),
      body: ScrollableContent(
        header: scrollableHeaderWidget(true, true),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DigitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(photoType == PhotoType.Drop
                    ? "Your drop location is not within FSTP boundary!"
                    : "Your safety location is not within FSTP boundary!"),
                const Text(
                    "Please upload Photograph at FSTP for additional verification"),
                CameraWidget(),
                DigitElevatedButton(
                    child: const Text("End Trip"),
                    onPressed: () {}), // TODO: Implement End Trip Functionality
                Obx(() {
                  if (cameraController.imageDrop.value != null) {
                    return Center(
                      child: DigitOutLineButton(
                        label: "Re - Upload Photograph",
                        onPressed: () => cameraController.pickImageDrop(),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
