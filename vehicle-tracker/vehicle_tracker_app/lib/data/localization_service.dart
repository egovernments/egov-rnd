// ignore_for_file: prefer_conditional_assignment

import 'dart:developer';

import 'package:vehicle_tracker_app/data/hive_service.dart';
import 'package:vehicle_tracker_app/data/http_service.dart';

import '../constants.dart';
import '../models/localization/localization_hive/localization_hive_model.dart';
import '../models/localization/localiztion_model/localization_model.dart';

class LocalizationService {
  // This english translation map is used in AppTranslation class for english translations
  static Map<String, String> englishMap = {};
  // This orissa translation map is used in AppTranslation class for hindi translations
  static Map<String, String> orissaMap = {};

  static Future<void> i18nMapBuilder() async {
    await Future.wait([
      fetchhLocalizationData("en_IN"),
      fetchhLocalizationData("or_IN"),
    ]);
  }

  static Future<void> fetchhLocalizationData(String locale) async {
    List<LocalizationHiveModel> localizationList = [];

    // Checks local storage
    final localizationHiveList = HiveService.getLocalization(locale);
    if (localizationHiveList.isEmpty) {
      //  Call API
      log("Calling API for $locale localization");
      final localizations = await getLocalicationFromAPI(locale);
      if (localizations == null) {
        log("Error fetching $locale localization from API");
        return;
      }

      // Store in local storage
      log("Storing $locale localizations in local storage");
      localizationList = await HiveService.storeLocalization(localizations, locale);
    } else {
      // If not empty, store in local variable
      log("Fetching $locale localizations from local storage");
      localizationList = localizationHiveList;
    }

    // Map english localization
    mapper(localizationList, locale);
    log("Mapped $locale localizations");
  }

  static mapper(List<LocalizationHiveModel> localizationList, String locale) {
    for (var item in localizationList) {
      switch (locale) {
        case "en_IN":
          englishMap[item.code] = item.message;
          break;
        case "or_IN":
          orissaMap[item.code] = item.message;
          break;
        default:
          continue;
      }
    }
  }

  // parse localization
  static List<LocalizationMessageModel> parseLocalization(dynamic localizations) {
    List<LocalizationMessageModel> localizationList = [];

    for (var localization in localizations) {
      localizationList.add(LocalizationMessageModel.fromJson(localization));
    }

    return localizationList;
  }

  // get localization from API
  static Future<List<LocalizationMessageModel>?> getLocalicationFromAPI(String locale) async {
    final localizationUrl = "$unifiedDevApiUrl/localization/messages/v1/_search";
    final url = "$localizationUrl?module=rainmaker-fsm&locale=$locale&tenantId=pb.amritsar";

    Map<String, dynamic> body = {
      "RequestInfo": {
        "apiId": "Rainmaker",
        "authToken": "e89ab88c-031c-482f-a950-36b278bde855",
        "msgId": "1683277829758|en_IN",
        "plainAccessRequest": {}
      }
    };

    // http request
    final response = await HttpService.postRequest(url, body);
    if (response.statusCode == 200) {
      final parsed = response.body["messages"] as List<dynamic>;
      final localizationList = parseLocalization(parsed);
      return localizationList;
    } else {
      return null;
    }
  }
}
