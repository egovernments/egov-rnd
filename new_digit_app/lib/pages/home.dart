import 'package:attendance_management/pages/manage_attendance.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/pages/manage_stocks.dart';
import 'package:inventory_management/pages/record_stock/warehouse_details.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/attendencebloc.dart';
import 'package:new_digit_app/blocs/authbloc.dart';
import 'package:new_digit_app/blocs/inventory.dart';
import 'package:new_digit_app/blocs/localization.dart';
import 'package:new_digit_app/blocs/userbloc.dart';
import 'package:new_digit_app/pages/sideBar.dart';
import 'package:new_digit_app/widget/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

class HomeScreen extends LocalizedStatefulWidget {
  const HomeScreen({super.key, super.appLocalizations});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends LocalizedState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppInitialization, InitState>(builder: (context, state) {
      final actionMap = state.entityActionMapping;
      return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => state.maybeWhen(
                orElse: () => const CircularProgressIndicator(),
                authenticated: (accesstoken, refreshtoken, userRequest) =>
                    BlocBuilder<UserBloc, UserState>(
                        builder: (context, currentUserState) {
                  context.read<UserBloc>().add(UserEvent.searchUser(
                      uuid: userRequest!.uuid, actionMap: actionMap));
                  if (currentUserState is UserUserState) {
                    final user = currentUserState.userModel;
                    return BlocBuilder<LocalizationBloc, LocalizationState>(
                        builder: (context, state) {
                      return Scaffold(
                        appBar: AppBar(),
                        body: Column(
                          children: [
                            DigitIconButton(
                              icon: Icons.fingerprint,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ManageAttendancePage(
                                              projectId:
                                                  "", //TO-DO change this line
                                              userId: "",
                                              appVersion: '1.3',
                                              attendanceListeners:
                                                  HCMAttendanceBloc(
                                                actionMap: actionMap,
                                                context: context,
                                              ),
                                            )));
                              },
                            ),
                            DigitIconButton(
                                icon: Icons.book,
                                onPressed: () => AutoRouter.of(context)
                                    .pushNamed('home/projects')),
                            //TO-DO
                            //create a way to verify if the person is indeed a distributor or a wareHouseManager

                            const Text(
                                'Text below to see if translation occurs'),
                            Text(localizations
                                .translate(i18.common.coreCommonContinue))
                          ],
                        ),
                        drawer: Drawer(child: SideBar()),
                      );
                    });
                  } else {
                    return Text('User not fetched');
                  }
                }),
              ));
    });
  }
}
