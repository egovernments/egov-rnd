import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/widgets/utils/scrollable_header_widget.dart';
import 'package:vehicle_tracker_app/widgets/trip/camera_widget.dart';

import '../../blocs/details/controllers/camera_controllers.dart';
import '../../widgets/utils/drawer_widget.dart';

class UploadDropPhotoPgae extends StatelessWidget {
  const UploadDropPhotoPgae({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraController = Get.find<CameraControllers>();

    return Scaffold(
      // * AppBar
      appBar: AppBar(
        // title: Text(AppTranslation.HOME_APP_BAR.tr),
        centerTitle: false,
      ),

      // * Drawer
      drawer: const CustomDrawer(),

      // * Body
      body: ScrollableContent(
        // * Headers
        header: scrollableHeaderWidget(true, true),

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DigitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Your drop location is not within FSTP boundary!"),
                const Text("Please upload Photograph at FSTP for additional verification"),

                // todo: Take image widget
                CameraWidget(),

                DigitElevatedButton(child: const Text("End Trip"), onPressed: () {}),

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
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
