import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';
import 'package:vehicle_tracker_app/widgets/drawer_widget.dart';

import '../../widgets/home/info_page_widget.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final infoControllers = Get.find<InfoController>();
    final theme = DigitTheme.instance;

    return SafeArea(
      child: Scaffold(
        // * App Bar
        appBar: AppBar(),

        // * Drawer
        drawer: const CustomDrawer(),

        // * Body
        body: ScrollableContent(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // * Footer
          footer: Padding(
            padding: theme.buttonPadding,
            child: DigitElevatedButton(
              child: Text(AppTranslation.START_TRIP.tr),
              onPressed: () => (),
            ),
          ),

          header: Row(
            // * Back Button
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DigitIconButton(iconText: AppTranslation.BACK.tr, onPressed: () => Get.back(), icon: Icons.keyboard_arrow_left),
              DigitIconButton(iconText: AppTranslation.HELP.tr, onPressed: () {}, icon: Icons.help_outline_rounded),
            ],
          ),

          // * Body
          children: [
            DigitCard(
              padding: theme.buttonPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Locality....."),
                  textColumnWidget(["-- values --"], theme)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
