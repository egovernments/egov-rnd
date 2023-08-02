import 'package:hive_flutter/hive_flutter.dart';

import '../models/localization/localization_model.dart';
import '../models/localization_hive/localization_hive_model.dart';

class HiveService {
  static Future<List<LocalizationHiveModel>> storeLocalization(List<LocalizationMessageModel> localizationList) async {
    List<LocalizationHiveModel> localizationHiveList = [];

    for (var item in localizationList) {
      localizationHiveList.add(LocalizationHiveModel(
        code: item.code,
        message: item.message,
      ));
    }

    Hive.box("localization").addAll(localizationHiveList);

    return localizationHiveList;
  }

  static List<LocalizationHiveModel> getLocalization() {
    return Hive.box("localization").values.toList().cast<LocalizationHiveModel>();
  }

  static getAllToken() {
    return Hive.box("tracker").values.toList();
  }

  static deleteLocalization() async {
    await Hive.box("localization").clear();
  }
}
