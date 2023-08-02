// ignore_for_file: prefer_conditional_assignment

import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/hive_service.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';
import 'package:vehicle_tracker_app/models/localization_hive/localization_hive_model.dart';

import '../models/localization/localization_model.dart';

class LocalizationService {
  static Map<String, String> englishMap = {};

  static fetchLocalization() async {
    List<LocalizationHiveModel> localizationList = [];

    // * Checks local storage
    final localizationHiveList = HiveService.getLocalization();
    if (localizationHiveList.isEmpty) {
      // * Call API
      log("Calling API");
      final localizations = await getLocalicationFromAPI();
      if (localizations == null) {
        log("Error fetching localization from API");
        return;
      }

      // * Store in local storage
      log("Storing in local storage");
      localizationList = await HiveService.storeLocalization(localizations);
    } else {
      // * If not empty, store in local variable
      log("Fetching from local storage");
      localizationList = localizationHiveList;
    }

    // * Map english localization
    englishMapper(localizationList);
  }

  static englishMapper(List<LocalizationHiveModel> localizationList) {
    for (var item in englishList) {
      int index = localizationList.indexWhere((element) => element.code == item);
      if (index != -1) {
        englishMap[item] = localizationList[index].message;
      }
    }
  }

  static List<LocalizationMessageModel> parseLocalization(dynamic localizations) {
    List<LocalizationMessageModel> localizationList = [];

    for (var localization in localizations) {
      localizationList.add(LocalizationMessageModel.fromJson(localization));
    }

    return localizationList;
  }

  static Future<List<LocalizationMessageModel>?> getLocalicationFromAPI() async {
    // * Call API
    final env = dotenv.env["LOCALIZATION_API_URL"];
    final url = "${env}tenantId=default&locale=en_IN";

    Map<String, dynamic> body = {
      "RequestInfo": {
        "apiId": "emp",
        "ver": "1.0",
        "ts": "10-03-2017 00:00:00",
        "action": "create",
        "did": "1",
        "key": "abcdkey",
        "msgId": "20170310130900",
        "requesterId": "rajesh",
        "authToken": "03d9ea52-cccb-41d6-841e-b50a518165d5",
        "userInfo": {"id": 1}
      }
    };

    final response = await HttpService.postRequestWithoutToken(url, body);
    if (response.statusCode == 200) {
      final parsed = response.body["messages"] as List<dynamic>;
      final localizationList = parseLocalization(parsed);
      return localizationList;
    } else {
      log(response.statusCode.toString());
      log(response.body.toString());
      return null;
    }
  }
}
