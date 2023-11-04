import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../blocs/home/controllers/info_controllers.dart';
import 'trip_info_card_widget.dart';

class TripInfoListBuilderWidget extends StatelessWidget {
  const TripInfoListBuilderWidget({
    super.key,
    required this.infoController,
  });

  final InfoController infoController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () => infoController.getHomeTripData(),
        child: Obx(() {
          if (infoController.isLoading.value) {
            return Center(
              child: Loaders.circularLoader(context),
            );
          }

          // ? If the search text is empty and the isCompleted is false, then the normalTripList is displayed.
          if (infoController.isTextControllerEmpty.isTrue && infoController.isCompleted.isFalse) {
            final list = infoController.normalTripList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return TripInfoCardWidget(data: list[index]);
              },
            );
          }

          // ? If the search text is empty and the isCompleted is true, then the completedTripList is displayed.
          if (infoController.isTextControllerEmpty.isTrue && infoController.isCompleted.isTrue) {
            final list = infoController.completedTripList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return TripInfoCardWidget(data: list[index]);
              },
            );
          }

          // ? If the search text is not empty and the isCompleted is false, then the filteredNormalTripList is displayed.
          if (infoController.isTextControllerEmpty.isFalse && infoController.isCompleted.isFalse) {
            final list = infoController.filteredNormalTripList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return TripInfoCardWidget(data: list[index]);
              },
            );
          }

          // ? If the search text is not empty and the isCompleted is true, then the filteredCompletedTripList is displayed.
          final list = infoController.filteredCompletedTripList;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return TripInfoCardWidget(data: list[index]);
            },
          );
        }),
      ),
    );
  }
}
