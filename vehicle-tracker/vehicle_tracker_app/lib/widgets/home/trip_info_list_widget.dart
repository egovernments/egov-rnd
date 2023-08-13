import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../blocs/home/controllers/info_controllers.dart';
import 'home_list_widget.dart';

class TripInfoListBuilderWidget extends StatelessWidget {
  const TripInfoListBuilderWidget({
    super.key,
    required this.infoController,
  });

  final InfoController infoController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        if (infoController.isLoading.value) {
          return Center(
            child: Loaders.circularLoader(context),
          );
        }

        if (infoController.isTextControllerEmpty.value == false) {
          return ListView.builder(
            itemCount: infoController.filteredHomeTripModel.value.length,
            itemBuilder: (context, index) {
              return HomeListWidget(data: infoController.filteredHomeTripModel.value[index]);
            },
          );
        }

        return ListView.builder(
          itemCount: infoController.homeTripModel.value.length,
          itemBuilder: (context, index) {
            return HomeListWidget(data: infoController.homeTripModel.value[index]);
          },
        );
      }),
    );
  }
}