// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/blocs/details/bindings/detail_bindings.dart';
import 'package:vehicle_tracker_app/pages/home/info_page.dart';
import 'package:vehicle_tracker_app/pages/home/home_page.dart';
import 'package:vehicle_tracker_app/pages/login/login_lang_select_page.dart';
import 'package:vehicle_tracker_app/pages/login/login_page.dart';
import 'package:vehicle_tracker_app/pages/trip/trip_complete.dart';
import 'package:vehicle_tracker_app/pages/trip/upload_safety_photo_page.dart';

import '../blocs/home/bindings/home_bindings.dart';
import '../blocs/login/bindings/login_bindings.dart';
import '../pages/trip/trip_fill_details_page.dart';

String HOME = "/";
String LOGIN = "/login";
String LANG = "/lang";
String INFO = "/info";
String DETAILS = "/details";
String UPLOAD_SAFETY = "/upload_safety";
String UPLOAD_DROP = "/upload_drop";
String TRIP_COMPLETE = "/trip_complete";

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: HOME,
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: LOGIN,
    page: () => const LoginPage(),
    binding: LoginBindings(),
  ),
  GetPage(
    name: LANG,
    page: () => const LoginLangSelectPage(),
    binding: LoginBindings(),
  ),
  GetPage(
    name: INFO,
    page: () => const InfoPage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: DETAILS,
    page: () => const TripFillDetailsPage(),
    binding: DetailBindings(),
  ),
  GetPage(
    name: UPLOAD_SAFETY,
    page: () => UploadSafetyPhotoPgae(),
    binding: DetailBindings(),
  ),
  GetPage(
    name: UPLOAD_DROP,
    page: () => UploadSafetyPhotoPgae(),
    binding: DetailBindings(),
  ),
  GetPage(
    name: TRIP_COMPLETE,
    page: () => const TripCompletepage(),
  )
];
