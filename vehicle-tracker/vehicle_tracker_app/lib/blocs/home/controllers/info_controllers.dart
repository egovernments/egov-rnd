import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/home/bindings/home_bindings.dart';
import 'package:vehicle_tracker_app/blocs/home/repository/home_http_repository.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/secure_storage_service.dart';
import 'package:vehicle_tracker_app/models/home_trip/home_trip_model/home_trip_model.dart';
import 'package:vehicle_tracker_app/util/logout.dart';

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
    log("Info Controller Initialized and getting the trip data");
    getHomeTripData();
  }

  // ? Function to call the API to get all the Trips Data.
  Future<void> getHomeTripData() async {
    final tenantId = await SecureStorageService.read(TENANT_ID);
    final operatorId = await SecureStorageService.read(OPERATOR_ID);
    if (tenantId == null || operatorId == null) {
      log("City ID OR Driver ID is null");
      logout();
      return;
    }

    await fillList(tenantId, operatorId);
  }

  // ? It will get the trip data and filter the data based on the status.
  // ? The filters are if status is completed or not.
  Future<void> fillList(String tentantId, String operatorId) async {
    isLoading.toggle();

    // ! For now we are hardcoding the city id as "pg.citya"
    final totalList = await homeHTTPRepository.getHomeTripData("pg.citya", operatorId);

    normalTripList.value = totalList.where((element) {
      return element.value.status != TripStates.COMPLETED;
    }).toList()
      ..sort((a, b) {
        if (a.value.plannedStartTime == null && b.value.plannedStartTime == null) {
          return 0;
        } else if (a.value.plannedStartTime == null) {
          return 1;
        } else if (b.value.plannedStartTime == null) {
          return -1;
        } else {
          return b.value.plannedStartTime!.compareTo(a.value.plannedStartTime!);
        }
      });

    completedTripList.value = totalList.where((element) {
      return element.value.status == TripStates.COMPLETED;
    }).toList()
      ..sort((a, b) {
        if (a.value.plannedStartTime == null && b.value.plannedStartTime == null) {
          return 0;
        } else if (a.value.plannedStartTime == null) {
          return 1;
        } else if (b.value.plannedStartTime == null) {
          return -1;
        } else {
          return b.value.plannedStartTime!.compareTo(a.value.plannedStartTime!);
        }
      });

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
        // avoiding all null values
        if (element.value.citizen == null) return false;
        if (element.value.citizen!.name == null) return false;
        if (element.value.citizen!.contactNumber == null) return false;

        bool name = element.value.citizen!.name!.toLowerCase().contains(value.toLowerCase());
        bool contactNumber = element.value.citizen!.contactNumber!.contains(value);
        return name || contactNumber;
      }).toList();
      return;
    } else {
      // If the completed button is not pressed then the filtered list is assigned to the normal list.
      filteredNormalTripList.value = normalTripList.where((element) {
        // avoiding all null values
        if (element.value.citizen == null) return false;
        if (element.value.citizen?.name == null) return false;
        if (element.value.citizen?.contactNumber == null) return false;

        bool name = element.value.citizen!.name!.toLowerCase().contains(value.toLowerCase());
        bool contactNumber = element.value.citizen!.contactNumber!.contains(value);
        return name || contactNumber;
      }).toList();
    }
  }
}
