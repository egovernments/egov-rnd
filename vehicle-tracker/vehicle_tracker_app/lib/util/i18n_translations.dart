// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/data/localization_service.dart';

// App Translations class
class AppTranslation extends Translations {
  static String get YES => 'YES';
  static String get NO => 'NO';
  static String get CONTINUE => 'CONTINUE';
  static String get APP_HEADING => 'APP_HEADING';
  static String get HOME_APP_BAR => 'HOME_APP_BAR';
  static String get USER_ID => 'USER_ID';
  static String get PASSWORD => 'PASSWORD';
  static String get CITY => 'CITY';
  static String get LOGIN => 'LOGIN';
  static String get FORGOT_PASSWORD => 'FORGOT_PASSWORD';
  static String get FORGOT_PASSWORD_MESSAGE => 'FORGOT_PASSWORD_MESSAGE';
  static String get OK => 'OK';
  static String get MY_TRIPS => 'MY_TRIPS';
  static String get HELP => 'HELP';
  static String get HOME => 'HOME';
  static String get ENGLISH => 'ENGLISH';
  static String get ORG_PROFILE => 'ORG_PROFILE';
  static String get LOGOUT => 'LOGOUT';
  static String get SEARCH_BAR_HINT => 'SEARCH_BAR_HINT';
  static String get IN_PROGRESS => 'IN_PROGRESS';
  static String get COMPLETED => 'COMPLETED';
  static String get HOME_HEADING => 'HOME_HEADING';
  static String get NAME => 'NAME';
  static String get MOBILE_NUMBER => 'MOBILE_NUMBER';
  static String get VIEW_DETAILS => 'VIEW_DETAILS';
  static String get START_TRIP => 'START_TRIP';
  static String get END_TRIP => 'END_TRIP';
  static String get TRIP_COMPLETED => 'TRIP_COMPLETED';
  static String get TRIP_RUNNING_MESSAGE => 'TRIP_RUNNING_MESSAGE';
  static String get START_TRIP_MESSAGE => 'START_TRIP_MESSAGE';
  static String get BACK => 'BACK';
  static String get WARNING => 'WARNING';
  static String get NOT_STARTED_STATUS => 'NOT_STARTED_STATUS';
  static String get ON_GOING_STATUS => 'ON_GOING_STATUS';
  static String get COMPLETED_TRIP_STATUS => 'COMPLETED_TRIP_STATUS';
  static String get END_TRIP_MESSAGE => 'END_TRIP_MESSAGE';
  static String get START_LOADING_MESSAGE => 'START_LOADING_MESSAGE';
  static String get POSITION_SENT_MESSAGE => 'POSITION_SENT_MESSAGE';
  static String get POSITION_HIVE_STORE_MESSAGE => 'POSITION_HIVE_STORE_MESSAGE';
  static String get NETWORK_ERROR_MESSAGE => 'NETWORK_ERROR_MESSAGE';
  static String get LOGIN_SUCCESS_MESSAGE => 'LOGIN_SUCCESS_MESSAGE';
  static String get LOGIN_FAILED_MESSAGE => 'LOGIN_FAILED_MESSAGE';
  static String get LOCATION_SERVICE_DISABLED_MESSAGE => 'LOCATION_SERVICE_DISABLED_MESSAGE';
  static String get LOCATION_PERMISSION_DENIED_MESSAGE => 'LOCATION_PERMISSION_DENIED_MESSAGE';
  static String get LOCATION_PERMISSION_DENIED_FOREVER_MESSAGE => 'LOCATION_PERMISSION_DENIED_FOREVER_MESSAGE';
  static String get TRIP_NOT_END_MESSAGE => 'TRIP_NOT_END_MESSAGE';
  static String get TRIP_NOT_STARTED_MESSAGE => 'TRIP_NOT_STARTED_MESSAGE';
  static String get NONE_TRIP_STATUS => 'NONE_TRIP_STATUS';
  static String get ODIA => 'ODIA';
  static String get TRIP_ID => 'TRIP_ID';
  static String get VEHICLE_NUMBER => 'VEHICLE_NUMBER';
  static String get PICK_UP_LOCATION => 'PICK_UP_LOCATION';
  static String get DROP_LOCATION => 'DROP_LOCATION';
  static String get DATE => 'DATE';
  static String get DETAILS => 'DETAILS';
  static String get STATUS => 'STATUS';
  static String get TRIP_STARTED_SUCCESFULLY_MESSAGE => 'TRIP_STARTED_SUCCESFULLY_MESSAGE';
  static String get TRIP_ENDED_SUCCESFULLY_MESSAGE => 'TRIP_ENDED_SUCCESFULLY_MESSAGE';
  

  // ? This was the old way of doing translations
  // ? Its not here for reference, will be deleted soon
  // static Map<String, String> englishValues = {
  //   YES: 'Yes',
  //   NO: 'No',
  //   ODIA: "Odia",
  //   CONTINUE: 'Continue',
  //   APP_HEADING: 'FSSM | Odisha',
  //   HOME_APP_BAR: 'FSSM',
  //   USER_ID: 'User Id',
  //   PASSWORD: 'Password',
  //   CITY: 'City',
  //   LOGIN: 'Login',
  //   FORGOT_PASSWORD: 'Forget Password?',
  //   FORGOT_PASSWORD_MESSAGE: 'Please contact the ULB if you have forgotten your password.',
  //   OK: 'Ok',
  //   MY_TRIPS: 'My Trips',
  //   HELP: 'Help',
  //   HOME: 'Home',
  //   ENGLISH: 'English',
  //   ORG_PROFILE: 'Org Profile',
  //   LOGOUT: 'Logout',
  //   SEARCH_BAR_HINT: 'Search Mobile Number / Name',
  //   IN_PROGRESS: 'In Progress',
  //   HOME_HEADING: 'My Trips',
  //   COMPLETED: 'Completed',
  //   NAME: 'Name',
  //   MOBILE_NUMBER: 'Mobile Number',
  //   VIEW_DETAILS: 'View Details',
  //   START_TRIP: 'Start Trip',
  //   END_TRIP: 'End Trip',
  //   TRIP_COMPLETED: 'Trip Completed',
  //   TRIP_RUNNING_MESSAGE: 'Only one trip can be started at a time',
  //   START_TRIP_MESSAGE: 'Start the trip only after reaching the pickup location. Have you reached the applicant location?',
  //   BACK: 'Back',
  //   WARNING: 'Warning!',
  //   NOT_STARTED_STATUS: 'Not Started',
  //   ON_GOING_STATUS: 'On Going',
  //   COMPLETED_TRIP_STATUS: 'Completed',
  //   END_TRIP_MESSAGE: 'Are you sure you want to stop the trip?',
  //   START_LOADING_MESSAGE: 'Please wait while we start the trip',
  //   POSITION_SENT_MESSAGE: 'Position sent successfully',
  //   POSITION_HIVE_STORE_MESSAGE: 'No internet connection, saving to hive DB',
  //   NETWORK_ERROR_MESSAGE: 'Network or Server Error',
  //   LOGIN_SUCCESS_MESSAGE: 'Login Successfully',
  //   LOGIN_FAILED_MESSAGE: 'Login Failed',
  //   LOCATION_SERVICE_DISABLED_MESSAGE: 'Location services are disabled. Please enable the services',
  //   LOCATION_PERMISSION_DENIED_MESSAGE: 'Location permissions are denied. Please enable the permissions',
  //   LOCATION_PERMISSION_DENIED_FOREVER_MESSAGE: 'Location permissions are permanently denied, we cannot request permissions.',
  //   TRIP_NOT_END_MESSAGE: 'Trip was not able to end, pls try again later',
  //   TRIP_NOT_STARTED_MESSAGE: 'Trip was not able to start, pls try again later',
  //   NONE_TRIP_STATUS: 'Cant Start This Trip',
  // };

  // Map of all translations for english and hindi
  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_IN': LocalizationService.englishMap, // change this to english map when english is ready

        // Hindi
        'or_IN': LocalizationService.orissaMap, // change this to hindi map when hindi is ready
      };
}
