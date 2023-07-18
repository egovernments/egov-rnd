import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/inbox/controllers/inbox_controllers.dart';
import 'package:vehicle_tracker_app/features/inbox/widgets/inbox_card_widget.dart';
import 'package:vehicle_tracker_app/util/widgets/drawer_widget.dart';

import '../widgets/inbox_header_widget.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    InboxControllers inboxControllers = Get.put(InboxControllers());
    return Scaffold(
      // * APP BAR
      appBar: AppBar(
        title: const Text("Municipal Corporation"),
      ),

      // * DRAWER
      drawer: const CustomDrawer(),

      // * BODY
      body: Obx(() {
        if (inboxControllers.isLoaded.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return const ScrollableContent(
          header: InboxHeaderWidget(),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: InboxCardWidget(),
              // child: DigitCard(
              //   child: Text(
              //     "No Application Found",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              //   ),
              // ),
            ),
          ],
        );
      }),
    );
  }
}
