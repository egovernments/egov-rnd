import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../blocs/home/controllers/inbox_controllers.dart';
import '../../widgets/drawer_widget.dart';
import '../../widgets/home/home_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inboxController = Get.find<InboxController>();
    final theme = DigitTheme.instance;

    return Scaffold(
      // * appbar
      appBar: AppBar(
        centerTitle: false,
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
              child: DigitIconButton(
                icon: Icons.help_outline_rounded,
                iconText: AppTranslation.HELP.tr,
                onPressed: () {},
              ),
            ),

            // * app heading
            Padding(
              padding: theme.buttonPadding,
              child: Text(AppTranslation.MY_TRIPS.tr),
            ),

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
