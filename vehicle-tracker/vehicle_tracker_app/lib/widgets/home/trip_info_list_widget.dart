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

          List list;

          if (infoController.isTextControllerEmpty.isTrue &&
              infoController.isCompleted.isFalse) {
            list = infoController.normalTripList;
          } else if (infoController.isTextControllerEmpty.isTrue &&
              infoController.isCompleted.isTrue) {
            list = infoController.completedTripList;
          } else if (infoController.isTextControllerEmpty.isFalse &&
              infoController.isCompleted.isFalse) {
            list = infoController.filteredNormalTripList;
          } else {
            list = infoController.filteredCompletedTripList;
          }

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
