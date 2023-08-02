// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/data/localization_service.dart';

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
  static String get NAME_INFO => 'nameInfo';
  static String get MOBILE_NUMBER => 'mobileNumber';
  static String get VIEW_DETAILS => 'viewDetails';
  static String get START_TRIP => 'startTrip';
  static String get END_TRIP => 'endTrip';
  static String get BACK => 'back';
  static String get WARNING => 'warning';
  static String get ACTION_TEST_LME_PERFORMANCE_REPORT => 'actionTestLmePerformanceReport';
  static String get CORE_COMMON_PHONE_NUMBER => 'coreCommonPhoneNumber';

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
          COMPLETED: 'Completed',
          NAME_INFO: 'Name',
          MOBILE_NUMBER: 'Mobile Number',
          VIEW_DETAILS: 'View Details',
          START_TRIP: 'Start Trip',
          END_TRIP: 'End Trip',
          BACK: 'Back',
          WARNING: 'Warning!',
          ACTION_TEST_LME_PERFORMANCE_REPORT: 'test',
          CORE_COMMON_PHONE_NUMBER: 'Phone Number',
        },

        // Hindi
        'hi_IN': LocalizationService.englishMap,
      };
}
