import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/home/widgets/home_list_widget.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../../util/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final placeController = Get.find<PlaceController>();

    return Scaffold(
      // * appbar
      appBar: AppBar(
        title: Text(AppTranslation.hello.tr),
      ),

      // * dwawer
      drawer: const CustomDrawer(),

      // * body
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const HomeListWidget();
        },
      ),
    );
  }
}
