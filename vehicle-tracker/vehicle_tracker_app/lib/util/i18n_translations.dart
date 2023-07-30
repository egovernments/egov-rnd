// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

// App Translations class
class AppTranslation extends Translations {
  static String get HOME_APP_BAR => 'home';
  static String get ABOUT => 'about';
  static String get APP_HEADING => 'appHeading';
  static String get USER_ID => 'userId';
  static String get PASSWORD => 'password';
  static String get CITY => 'city';
  static String get LOGIN => 'login';
  static String get FORGOT_PASSWORD => 'forgetPassword';
  static String get FORGOT_PASSWORD_INFO => 'forgetPasswordInfo';
  static String get MY_TRIPS => 'myTrips';
  static String get HELP => 'help';
  static String get SEARCH_BAR => 'searchBar';
  static String get IN_PROGRESS => 'inProgress';
  static String get COMPLETED => 'completed';
  

  // Map of all translations for english and hindi
  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_IN': {
          HOME_APP_BAR: 'FSSM',
          ABOUT: 'About',
          APP_HEADING: 'Vehicle Tracker App',
          USER_ID: 'User Id',
          PASSWORD: 'Password',
          CITY: 'City',
          LOGIN: 'Login',
          FORGOT_PASSWORD: 'Forget Password?',
          FORGOT_PASSWORD_INFO: 'Please contact the ULB if you have forgotten your password.',
          MY_TRIPS: 'My Trips',
          HELP: 'Help',
          SEARCH_BAR: 'Search Mobile Number / Name',
          IN_PROGRESS: 'In Progress',
          COMPLETED: 'Completed'
        },

        // Hindi
        'hi_IN': {
          HOME_APP_BAR: '',
          ABOUT: 'के बारे में',
          APP_HEADING: 'वाहन ट्रैकर ऐप',
          USER_ID: 'उपयोगकर्ता आईडी',
          PASSWORD: 'पासवर्ड',
          CITY: 'शहर',
          LOGIN: 'लॉग इन करें',
          FORGOT_PASSWORD: 'पासवर्ड भूल गए?',
          FORGOT_PASSWORD_INFO: 'अगर आप अपना पासवर्ड भूल गए हैं तो कृपया नगर पालिका से संपर्क करें।',
          MY_TRIPS: 'मेरी यात्राएं',
          HELP: 'सहायता',
          SEARCH_BAR: 'मोबाइल नंबर / नाम खोजें',
          IN_PROGRESS: 'जारी है',
          COMPLETED: 'पूरा हुआ'
        },
      };
}
