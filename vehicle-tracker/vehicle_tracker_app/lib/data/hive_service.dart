import 'package:hive_flutter/hive_flutter.dart';
import 'package:vehicle_tracker_app/models/mdms/mdms_model.dart';
import 'package:vehicle_tracker_app/models/mdms_hive/mdms_hive_model.dart';

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

  static Future<List<MdmsHiveModel>> storeMdmsData(MdmsModel mdmsModel) async {
    List<MdmsHiveModel> mdmsHiveModelList = [];

    for (var item in mdmsModel.StateInfo) {
      List<LanguageHiveModel> languageHiveModelList = [];
      for (var language in item.languages) {
        languageHiveModelList.add(LanguageHiveModel(
          label: language.label,
          value: language.value,
        ));
      } 

      mdmsHiveModelList.add(MdmsHiveModel(
        name: item.name,
        code: item.code,
        languages: languageHiveModelList,
      ));
    }

    await Hive.box("mdms").addAll(mdmsHiveModelList);

    return mdmsHiveModelList;
  }

  static List<MdmsHiveModel> getMdmsData() {
    return Hive.box("mdms").values.toList().cast<MdmsHiveModel>();
  }

  static List<LocalizationHiveModel> getLocalization() {
    return Hive.box("localization").values.toList().cast<LocalizationHiveModel>();
  }

  static deleteLocalization() async {
    await Hive.box("localization").clear();
  }

  static deleteMdmsData() async {
    await Hive.box("mdms").clear();
  }
}
