import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_digit_app/pages/loginPage.dart';
import 'package:new_digit_app/pages/profile.dart';
import '../blocs/app_localization.dart';
import '../pages/authenticated.dart';
import '../pages/home.dart';
import '../pages/langSelection.dart';
import '../pages/unauthenticated.dart';

part 'routes.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: [
  AutoRoute(page: UnauthenticatedScreenWrapper, path: '/', children: [
    AutoRoute(page: LoginScreen, path: 'login'),
    AutoRoute(page: SelectLanguageScreen, initial: true, path: 'langscreen')
  ]),
  AutoRoute(page: AuthenticatedScreenWrapper, path: '/', children: [
    AutoRoute(page: HomeScreen, path: 'home'),
    AutoRoute(page: ProfileScreen, path: 'profile'),
  ])
])
class AppRouter extends _$AppRouter {}
