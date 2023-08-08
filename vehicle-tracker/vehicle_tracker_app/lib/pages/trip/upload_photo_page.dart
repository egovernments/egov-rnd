import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/widgets/trip/camera_widget.dart';

import '../../util/i18n_translations.dart';
import '../../widgets/drawer_widget.dart';

class UploadPhotoPgae extends StatelessWidget {
  const UploadPhotoPgae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * AppBar
      appBar: AppBar(
        title: Text(AppTranslation.HOME_APP_BAR.tr),
        centerTitle: false,
      ),

      // * Drawer
      drawer: const CustomDrawer(),

      // * Body
      body: ScrollableContent(
        // * Headers
        header: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DigitIconButton(
              iconText: AppTranslation.BACK.tr,
              onPressed: () => Get.back(),
              icon: Icons.keyboard_arrow_left,
            ),
            DigitIconButton(
              iconText: AppTranslation.HELP.tr,
              onPressed: () => (),
              icon: Icons.help_outline_rounded,
            ),
          ],
        ),

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

                DigitElevatedButton(child: const Text("End Trip"), onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
