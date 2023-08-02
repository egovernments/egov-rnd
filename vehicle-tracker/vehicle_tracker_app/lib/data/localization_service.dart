// ignore_for_file: prefer_conditional_assignment

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';
import 'package:vehicle_tracker_app/data/token_service.dart';
import 'package:vehicle_tracker_app/models/localization_model.dart';

class LocalizationService {
  static late List<LocalizationMessageModel> localizationList;
  static Map<String, String> english = {};

  static fetchLocalization() async {
    dynamic localizations;
    bool storage = true;

    // await SecureStorageService.delete("localization");

    // * Checks local storage
    log("Checking local storage");
    localizations = await getLocalizationFromStorage();
    if (localizations == null) {
      // * Call API
      log("Calling API");
      storage = false;
      localizations = await getLocalicationFromAPI();
      // * Store in local storage
      log("Storing in local storage");
      await SecureStorageService.write("localization", localizations);
    }

    if (storage) {
      localizations = jsonDecode(localizations);
    }

    final parsed = localizations["messages"] as List<dynamic>;

    // * Parse the data
    localizationList = parseLocalization(parsed);

    // * Store in map
    englishMapper(localizationList);

    log(english.toString());
  }

  static englishMapper(List<LocalizationMessageModel> localizationList) {
    for (var item in englishList) {
      int index = localizationList.indexWhere((element) => element.code == item);
      if (index != -1) {
        english[item] = localizationList[index].message;
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

  static Future<dynamic> getLocalizationFromStorage() async {
    dynamic localization = await SecureStorageService.read("localization");
    return localization;
  }

  static Future<dynamic> getLocalicationFromAPI() async {
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
      body = response.body;
      return body;
    } else {
      log(response.statusCode.toString());
      log(response.body.toString());
      return null;
    }
  }
}
