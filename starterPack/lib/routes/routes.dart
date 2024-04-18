import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:starterPack/blocs/app_localization.dart';
import 'package:starterPack/pages/authenticated.dart';
import 'package:starterPack/pages/home.dart';
import 'package:starterPack/pages/langSelection.dart';
import 'package:starterPack/pages/loginPage.dart';
import 'package:starterPack/pages/profile.dart';
import 'package:starterPack/pages/projectSelection.dart';
import 'package:starterPack/pages/unauthenticated.dart';

part 'routes.gr.dart';

@AutoRouterConfig(modules: [])
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: UnauthenticatedRouteWrapper.page, path: '/', children: [
          AutoRoute(page: LoginRoute.page, path: 'login'),
          AutoRoute(
              page: SelectLanguageRoute.page, initial: true, path: 'langscreen')
        ]),
        AutoRoute(page: AuthenticatedRouteWrapper.page, path: '/', children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: ProfileRoute.page, path: 'profile'),
          AutoRoute(
              page: ProjectSelectionRoute.page,
              path: 'projects',
              initial: true),
        ])
      ];
}
