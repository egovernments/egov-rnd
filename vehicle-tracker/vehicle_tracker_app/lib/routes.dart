// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/features/home/pages/home_page.dart';
import 'package:vehicle_tracker_app/features/inbox/bindings/inbox_bindings.dart';
import 'package:vehicle_tracker_app/features/inbox/pages/inbox_page.dart';
import 'package:vehicle_tracker_app/features/login/bindings/login_bindings.dart';
import 'package:vehicle_tracker_app/features/login/pages/login_page.dart';

import 'features/home/bindings/home_bindings.dart';

String HOME = "/";
String INBOX = "/inbox";
String LOGIN = "/login";

List<GetPage<dynamic>> getPages = [
  GetPage(
    name: HOME,
    page: () => const HomePage(),
    binding: HomeBindings(),
  ),
  GetPage(
    name: INBOX,
    page: () => const InboxPage(),
    binding: InboxBindings(),
  ),
  GetPage(
    name: LOGIN,
    page: () => const LoginPage(),
    binding: LoginBindings(),
  )
];
