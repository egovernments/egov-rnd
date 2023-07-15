import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/features/home/widgets/home_list_widget.dart';

import '../../../util/drawer_widget.dart';
import '../controllers/place_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final placeController = Get.find<PlaceController>();

    return Scaffold(
      // * appbar
      appBar: AppBar(
        title: const Text("Vehicle Tracker App"),
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
