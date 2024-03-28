import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:new_digit_app/blocs/app_localization_delegate.dart';
import 'package:new_digit_app/data/nosql/localization.dart';
import '../model/appconfig/mdmsResponse.dart';
import '../model/localization/localizationModel.dart';

class AppLocalizations {
  final Locale locale;
  final Isar isar;

  AppLocalizations(this.locale, this.isar);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static LocalizationModel? localizationModel;

  //creating a list for storing the localization strings
  static final List<Localization> _localizedStrings = <Localization>[];

  static LocalizationsDelegate<AppLocalizations> getDelegate(
          AppConfig config, Isar isar) =>
      AppLocalizationsDelegate(config, isar);

  Future<bool> load() async {
    //loading localizations from ISAR
    _localizedStrings.clear();
    final List<LocalizationWrapper> localizationList = await isar
        .localizationWrappers
        .filter()
        .localeEqualTo('${locale.languageCode}_${locale.countryCode}')
        .findAll();

    if (localizationList.isNotEmpty) {
      _localizedStrings.addAll(localizationList.first.localization!);
      return true;
    }

    return false;
  }

  //This translate method is what we will evoke according to our need. The localizations are already fetched from the load method.
  //In order use this method in any page, use "localizations.translate(code)" with the appropriate code fetched from the module list
  String translate(String localizedValues) {
    if (_localizedStrings.isEmpty) {
      return localizedValues;
    } else {
      final index = _localizedStrings.indexWhere(
        (medium) => medium.code == localizedValues,
      );

      return index != -1 ? _localizedStrings[index].message : localizedValues;
    }
  }
}
