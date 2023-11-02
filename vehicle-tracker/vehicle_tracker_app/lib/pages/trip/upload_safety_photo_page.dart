import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/router/routes.dart';
import 'package:vehicle_tracker_app/widgets/utils/scrollable_header_widget.dart';
import 'package:vehicle_tracker_app/widgets/trip/camera_widget.dart';

import '../../blocs/details/controllers/camera_controllers.dart';
import '../../widgets/utils/drawer_widget.dart';

class UploadSafetyPhotoPgae extends StatelessWidget {
  UploadSafetyPhotoPgae({super.key});

  final cameraController = Get.find<CameraControllers>();

  @override
  Widget build(BuildContext context) {
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
                const Text("Upload your photo with Safety Gear"),
                const Text("This is to verify that the necessary safety protocols are followed. "),

                // todo: Take image widget
                CameraWidget(),

                DigitElevatedButton(child: const Text("End Trip"), onPressed: () => Get.toNamed(TRIP_COMPLETE)),

                Obx(() {
                  if (cameraController.imageSafety.value != null) {
                    return Center(
                      child: DigitOutLineButton(
                        label: "Re - Upload Photograph",
                        onPressed: () => cameraController.pickImageSafety(),
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
