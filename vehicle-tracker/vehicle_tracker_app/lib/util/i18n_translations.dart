// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

class AppTranslation extends Translations {
  static String get HOME_APP_BAR => 'home';
  static String get ABOUT => 'about';
  static String get APP_HEADING => 'appHeading';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_IN': {
          HOME_APP_BAR: 'Home',
          ABOUT: 'About',
          APP_HEADING: 'Vehicle Tracker App',
        },
        
        'hi_IN': {
          HOME_APP_BAR: 'घर',
          ABOUT: 'के बारे में',
          APP_HEADING: 'वाहन ट्रैकर ऐप',
        },
      };
}
