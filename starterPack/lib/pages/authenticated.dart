import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starterPack/pages/sideBar.dart';
import 'package:starterPack/routes/authenticated_route_observer.dart';
import 'package:starterPack/routes/routes.dart';

import '../blocs/userbloc.dart';

@RoutePage()
class AuthenticatedScreenWrapper extends StatelessWidget {
  AuthenticatedScreenWrapper({Key? key}) : super(key: key);

  final StreamController<bool> _drawerVisibilityController =
      StreamController.broadcast();

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => UserBloc(),
            )
          ],
          child: ShowcaseWidget(
            enableAutoScroll: true,
            builder: Builder(
              builder: (context) => StreamBuilder<bool>(
                  stream: _drawerVisibilityController.stream,
                  builder: (context, snapshot) {
                    final showDrawer = snapshot.data ?? false;
                    return Scaffold(
                        appBar: AppBar(),
                        body: AutoRouter(
                          navigatorObservers: () => [
                            AuthenticatedRouteObserver(
                              onNavigated: () {
                                bool shouldShowDrawer;
                                switch (context.router.topRoute.name) {
                                  case ProjectSelectionRoute.name:
                                    shouldShowDrawer = false;
                                    break;
                                  default:
                                    shouldShowDrawer = true;
                                }

                                _drawerVisibilityController
                                    .add(shouldShowDrawer);
                              },
                            ),
                          ],
                        ),
                        drawer: showDrawer
                            ? const Drawer(
                                child: SideBar(),
                              )
                            : null);
                  }),
            ),
          ));
}
