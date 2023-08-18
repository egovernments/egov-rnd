import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_http_repository.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';

class InfoController extends GetxController {
  RxBool isCompleted = false.obs; // To check if the completed button is pressed or not.
  RxBool isLoading = false.obs; // To check if the data is loading or not.
  RxBool isTextControllerEmpty = true.obs; // To check if the search text is empty or not.
  
  HomeHTTPRepository homeHTTPRepository = HomeHTTPRepository();
  final TextEditingController searchController = TextEditingController();
  final normalTripList = RxList<Rx<HomeTripModel>>([]);
  final filteredNormalTripList = RxList<Rx<HomeTripModel>>([]);
  final completedTripList = RxList<Rx<HomeTripModel>>([]);
  final filteredCompletedTripList = RxList<Rx<HomeTripModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getHomeTripData("rajan123");
  }

  // ? Function to call the API to get all the Trips Data.
  Future<void> getHomeTripData(String userId) async {
    await fillList(userId);
  }

  // ? It will get the trip data and filter the data based on the status.
  // ? The filters are if status is completed or not.
  Future<void> fillList(String userId) async {
    isLoading.toggle();
    final totalList = await homeHTTPRepository.getHomeTripData(userId);

    normalTripList.value = totalList.where((element) {
      return element.value.status != TripStates.COMPLETED;
    }).toList();

    completedTripList.value = totalList.where((element) {
      return element.value.status == TripStates.COMPLETED;
    }).toList();

    isLoading.toggle();
  }

  // ? The original list is filtered based on the search text (Name or Contact Number).
  // ? The filtered list is assigned to a new list.
  // ? The original list is used when the search text is empty.
  // ? The filtered list is used when the search text is not empty.
  void onChangedFilter(String value) {
    if (isCompleted.isTrue) {

      // If the completed button is pressed then the filtered list is assigned to the completed list.
      filteredCompletedTripList.value = completedTripList.where((element) {
        bool name = element.value.operator.name.toLowerCase().contains(value.toLowerCase());
        bool contactNumber = element.value.operator.contactNumber.contains(value);
        return name || contactNumber;
      }).toList();
      return;
    } else {

      // If the completed button is not pressed then the filtered list is assigned to the normal list.
      filteredNormalTripList.value = normalTripList.where((element) {
        bool name = element.value.operator.name.toLowerCase().contains(value.toLowerCase());
        bool contactNumber = element.value.operator.contactNumber.contains(value);
        return name || contactNumber;
      }).toList();
    }
  }
}
