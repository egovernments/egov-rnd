import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/home/controllers/inbox_controllers.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../../util/widgets/drawer_widget.dart';
import '../widgets/home_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inboxController = Get.find<InboxController>();

    return Scaffold(
      // * appbar
      appBar: AppBar(
        title: Text(AppTranslation.HOME_APP_BAR.tr),
      ),

      // * dwawer
      drawer: const CustomDrawer(),

      // * body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * help button
            Align(
              alignment: Alignment.topRight,
              child: DigitIconButton(icon: Icons.help, iconText: AppTranslation.HELP.tr, onPressed: () {}),
            ),

            // * app heading
            Text(AppTranslation.MY_TRIPS.tr),

            // ! search bar needs icons support
            DigitSearchBar(
              hintText: AppTranslation.SEARCH_BAR.tr,
              onChanged: (value) {},
            ),

            const SizedBox(height: 8),

            // * button bar for IN-PROGRESS and COMPLETED
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DigitOutLineButton(
                  label: AppTranslation.IN_PROGRESS.tr,
                  onPressed: () => inboxController.toggleCompleted(),
                ),
                DigitOutLineButton(
                  label: AppTranslation.COMPLETED.tr,
                  onPressed: () => inboxController.toggleCompleted(),
                ),
              ],
            ),

            // * list view
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const HomeListWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
