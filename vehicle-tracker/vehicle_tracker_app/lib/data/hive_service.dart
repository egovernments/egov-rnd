import 'package:hive_flutter/hive_flutter.dart';

import '../models/localization/localization_hive/localization_hive_model.dart';
import '../models/localization/localiztion_model/localization_model.dart';
import '../models/mdms/mdms_hive/mdms_hive_model.dart';
import '../models/mdms/mdms_model/mdms_model.dart';

class HiveService {
  // ? For storing of Localization Data into Hive
  static Future<List<LocalizationHiveModel>> storeLocalization(
      List<LocalizationMessageModel> localizationList, String locale) async {
    List<LocalizationHiveModel> localizationHiveList = [];

    // Parses through all the code and messages and it to a list of Hive Model
    for (var item in localizationList) {
      localizationHiveList.add(LocalizationHiveModel(
        code: item.code,
        message: item.message,
        locale: item.locale,
      ));
    }

    // Adds all the list at once to hive
    Hive.box(locale).addAll(localizationHiveList);

    // returns the same list to be used as an in memory variable for usage.
    return localizationHiveList;
  }

  // ? Get Localization Data
  static List<LocalizationHiveModel> getLocalization(String locale) {
    return Hive.box(locale).values.toList().cast<LocalizationHiveModel>();
  }

  // ? Delete Localization Data
  static deleteLocalization(String locale) async {
    await Hive.box(locale).clear();
  }

  // ? For storing of MDMS data into Hive
  static Future<List<MdmsHiveModel>> storeMdmsData(MdmsModel mdmsModel) async {
    List<MdmsHiveModel> mdmsHiveModelList = [];

    // Loops through all the StateInfo for lanuage
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

  // ? Get MDMS data
  static List<MdmsHiveModel> getMdmsData() {
    return Hive.box("mdms").values.toList().cast<MdmsHiveModel>();
  }

  // ? Delete MDMS data
  static deleteMdmsData() async {
    await Hive.box("mdms").clear();
  }
}
