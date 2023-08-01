// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:vehicle_tracker_app/pages/home/home_page.dart';
import 'package:vehicle_tracker_app/pages/inbox/inbox_page.dart';
import 'package:vehicle_tracker_app/pages/login/login_lang_select_page.dart';
import 'package:vehicle_tracker_app/pages/login/login_page.dart';

import '../blocs/home/bindings/home_bindings.dart';
import '../blocs/inbox/bindings/inbox_bindings.dart';
import '../blocs/login/bindings/login_bindings.dart';

String HOME = "/";
String INBOX = "/inbox";
String LOGIN = "/login";
String LANG = "/lang";

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
  ),
  GetPage(
    name: LANG,
    page: () => const LoginLagSelectPage(),
    binding: LoginBindings(),
  ),
];
