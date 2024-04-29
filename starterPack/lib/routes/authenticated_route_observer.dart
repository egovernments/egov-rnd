import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthenticatedRouteObserver extends AutoRouterObserver {
  final VoidCallback onNavigated;

  AuthenticatedRouteObserver({required this.onNavigated});

  @override
  void didPop(Route route, Route? previousRoute) {
    onNavigated();
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    onNavigated();
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    onNavigated();
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
