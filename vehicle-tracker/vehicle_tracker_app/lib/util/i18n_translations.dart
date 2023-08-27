// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/data/localization_service.dart';

// App Translations class
class AppTranslation extends Translations {
  static String get YES => 'yes';
  static String get NO => 'no';
  static String get CONTINUE => 'continue';
  static String get APP_HEADING => 'appHeading';
  static String get HOME_APP_BAR => 'homeAppBar';
  static String get USER_ID => 'userId';
  static String get PASSWORD => 'password';
  static String get CITY => 'city';
  static String get LOGIN => 'login';
  static String get FORGOT_PASSWORD => 'forgetPassword';
  static String get FORGOT_PASSWORD_INFO => 'forgetPasswordInfo';
  static String get OK => 'ok';
  static String get MY_TRIPS => 'myTrips';
  static String get HELP => 'help';
  static String get HOME => 'home';
  static String get LANGUAGE => 'language';
  static String get ORG_PROFILE => 'orgProfile';
  static String get LOGOUT => 'logout';
  static String get SEARCH_BAR_HINT => 'searchBar';
  static String get IN_PROGRESS => 'inProgress';
  static String get COMPLETED => 'completed';
  static String get HOME_HEADING => 'homeHeading';
  static String get NAME_INFO => 'nameInfo';
  static String get MOBILE_NUMBER => 'mobileNumber';
  static String get VIEW_DETAILS => 'viewDetails';
  static String get START_TRIP => 'startTrip';
  static String get END_TRIP => 'endTrip';
  static String get TRIP_COMPLETED => 'tripCompleted';
  static String get TRIP_RUNNING_STATUS => 'tripRunningStatus';
  static String get START_TRIP_MESSAGE => 'startTripMessage';
  static String get BACK => 'back';
  static String get WARNING => 'warning';
  static String get NOT_STARTED_STATUS => 'notStartedStatus';
  static String get ON_GOING_STATUS => 'onGoingStatus';
  static String get COMPLETED_TRIP_STATUS => 'completedTripStatus';
  static String get END_TRIP_MESSAGE => 'endTripMessage';
  static String get START_LOADING_MESSAGE => 'startLoadingMessage';
  static String get POSITION_SENT_MESSAGE => 'positionSentMessage';
  static String get POSITION_HIVE_STORE_MESSAGE => 'positionHiveStoreMessage';
  static String get NETWORK_ERROR_MESSAGE => 'networkErrorMessage';
  static String get LOGIN_SUCCESS_MESSAGE => 'loginSuccessMessage';
  static String get LOGIN_FAILED_MESSAGE => 'loginFailedMessage';
  static String get LOCATION_SERVICE_DISABLED_MESSAGE => 'locationServiceDisabledMessage';
  static String get LOCATION_PERMISSION_DENIED_MESSAGE => 'locationPermissionDeniedMessage';
  static String get LOCATION_PERMISSION_DENIED_FOREVER_MESSAGE => 'locationPermissionDeniedForeverMessage';
  static String get TRIP_NOT_END_MESSAGE => 'tripNotEndMessage';
  static String get TRIP_NOT_STARTED_MESSAGE => 'tripNotStartedMessage';

  static Map<String, String> englishValues = {
    YES: 'Yes',
    NO: 'No',
    CONTINUE: 'Continue',
    APP_HEADING: 'FSSM | Odisha',
    HOME_APP_BAR: 'FSSM',
    USER_ID: 'User Id',
    PASSWORD: 'Password',
    CITY: 'City',
    LOGIN: 'Login',
    FORGOT_PASSWORD: 'Forget Password?',
    FORGOT_PASSWORD_INFO: 'Please contact the ULB if you have forgotten your password.',
    OK: 'Ok',
    MY_TRIPS: 'My Trips',
    HELP: 'Help',
    HOME: 'Home',
    LANGUAGE: 'Language',
    ORG_PROFILE: 'Org Profile',
    LOGOUT: 'Logout',
    SEARCH_BAR_HINT: 'Search Mobile Number / Name',
    IN_PROGRESS: 'In Progress',
    HOME_HEADING: 'My Trips',
    COMPLETED: 'Completed',
    NAME_INFO: 'Name',
    MOBILE_NUMBER: 'Mobile Number',
    VIEW_DETAILS: 'View Details',
    START_TRIP: 'Start Trip',
    END_TRIP: 'End Trip',
    TRIP_COMPLETED: 'Trip Completed',
    TRIP_RUNNING_STATUS: 'Only one trip can be started at a time',
    START_TRIP_MESSAGE: 'Start the trip only after reaching the pickup location. Have you reached the applicant location?',
    BACK: 'Back',
    WARNING: 'Warning!',
    NOT_STARTED_STATUS: 'Not Started',
    ON_GOING_STATUS: 'On Going',
    COMPLETED_TRIP_STATUS: 'Completed',
    END_TRIP_MESSAGE: 'Are you sure you want to stop the trip?',
    START_LOADING_MESSAGE: 'Please wait while we start the trip',
    POSITION_SENT_MESSAGE: 'Position sent successfully',
    POSITION_HIVE_STORE_MESSAGE: 'No internet connection, saving to hive DB',
    NETWORK_ERROR_MESSAGE: 'Network or Server Error',
    LOGIN_SUCCESS_MESSAGE: 'Login Success',
    LOGIN_FAILED_MESSAGE: 'Login Failed',
    LOCATION_SERVICE_DISABLED_MESSAGE: 'Location services are disabled. Please enable the services',
    LOCATION_PERMISSION_DENIED_MESSAGE: 'Location permissions are denied. Please enable the permissions',
    LOCATION_PERMISSION_DENIED_FOREVER_MESSAGE: 'Location permissions are permanently denied, we cannot request permissions.',
    TRIP_NOT_END_MESSAGE: 'Trip was not able to end, pls try again later',
    TRIP_NOT_STARTED_MESSAGE: 'Trip was not able to start, pls try again later',
  };

  // Map of all translations for english and hindi
  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_IN': englishValues,

        // Hindi
        'hi_IN': LocalizationService.englishMap,
      };
}
