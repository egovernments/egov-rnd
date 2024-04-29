import 'package:attendance_management/router/attendance_router.gm.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/models/entities/inventory_transport_type.dart';
import 'package:inventory_management/router/inventory_router.gm.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:referral_reconciliation/router/referral_reconciliation_router.gm.dart';
import 'package:starterPack/blocs/app_init.dart';
import 'package:starterPack/blocs/attendencebloc.dart';
import 'package:starterPack/blocs/authbloc.dart';
import 'package:starterPack/blocs/inventory.dart';
import 'package:starterPack/blocs/localization.dart';
import 'package:starterPack/blocs/project.dart';
import 'package:starterPack/blocs/referral_recon.dart';
import 'package:starterPack/blocs/userbloc.dart';
import 'package:starterPack/utils/context_utility.dart';
import 'package:starterPack/utils/envConfig.dart';
import 'package:starterPack/widget/localized.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeScreen extends LocalizedStatefulWidget {
  const HomeScreen({
    super.key,
    super.appLocalizations,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends LocalizedState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: BlocBuilder<AppInitialization, InitState>(
            builder: (context, state) {
          final actionMap = state.entityActionMapping;
          final genderOptions = state.maybeWhen(
              orElse: () => null,
              initialized: (appConfig, serviceRegistryModel) =>
                  appConfig.appConfig!.appConfig?[0].genderOptions);
          final transportTypes = state.maybeWhen(
              orElse: () => null,
              initialized: (appConfig, serviceRegistryModel) =>
                  appConfig.appConfig!.appConfig?[0].transportTypes);
          final appConfig = state.maybeWhen(
              orElse: () => null,
              initialized: (appConfig, serviceRegistryModel) => appConfig);
          return BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => state.maybeWhen(
                  orElse: () => const Offstage(),
                  authenticated: (accesstoken, refreshtoken, userRequest) =>
                      BlocBuilder<LocalizationBloc, LocalizationState>(
                          builder: (context, state) {
                        return BlocBuilder<ProjectBloc, ProjectState>(
                            builder: (context, projectState) {
                          if (projectState is ProjectSelectedState) {
                            final project = projectState.project;
                            return BlocBuilder<UserBloc, UserState>(
                                builder: (context, currentUserState) {
                              context.read<UserBloc>().add(UserEvent.searchUser(
                                  uuid: userRequest!.uuid,
                                  actionMap: actionMap));
                              if (currentUserState is UserUserState) {
                                final user = currentUserState.userModel;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 10, 20, 10),
                                      child: Text('Home',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge),
                                    ),
                                    DigitListView(
                                      prefixIcon: Icons.fingerprint,
                                      sufixIcon: Icons.arrow_circle_right,
                                      title: 'Manage Attendance',
                                      onPressed: () {
                                        AutoRouter.of(context)
                                            .push(ManageAttendanceRoute(
                                          projectId: project
                                              .id, //TO-DO change this line
                                          userId: user!.uuid!,
                                          appVersion: '1.3',
                                          attendanceListeners:
                                              HCMAttendanceBloc(
                                            actionMap: actionMap,
                                            context: context,
                                          ),
                                        ));
                                      },
                                    ),
                                    DigitListView(
                                      title: 'Manage Stock',
                                      prefixIcon: Icons.inventory,
                                      sufixIcon: Icons.arrow_circle_right,
                                      onPressed: () => AutoRouter.of(context)
                                          .push(ManageStocksRoute(
                                              projectId: project.id,
                                              userId: user!.uuid!,
                                              inventoryListener:
                                                  HCMInventoryBloc(
                                                      userId: user.uuid!,
                                                      projectId: project.id,
                                                      uuid: user.uuid!,
                                                      context: context,
                                                      actionMap: actionMap,
                                                      roles: user.roles!),
                                              boundaryName: '',
                                              isDistributor: true,
                                              isWareHouseMgr: true,
                                              transportType:
                                                  transportTypes!.map((e) {
                                                final transportType =
                                                    InventoryTransportTypes();
                                                transportType.name = e.name;
                                                transportType.code = e.code;
                                                return transportType;
                                              }).toList())),
                                    ),
                                    DigitListView(
                                        prefixIcon: Icons.book_sharp,
                                        sufixIcon: Icons.arrow_circle_right,
                                        title: 'Stock Reconciliation',
                                        onPressed: () => AutoRouter.of(context)
                                            .push(StockReconciliationRoute(
                                                inventoryListener:
                                                    HCMInventoryBloc(
                                                        projectId: project.id,
                                                        userId: user!.uuid!,
                                                        uuid: user.uuid!,
                                                        context: context,
                                                        actionMap: actionMap,
                                                        roles: user.roles!),
                                                isDistributor: true,
                                                projectId: project.id,
                                                isWareHouseMgr: true,
                                                loggedInUserUuid: user.uuid!))),
                                    DigitListView(
                                        prefixIcon: Icons.report,
                                        sufixIcon: Icons.arrow_circle_right,
                                        title: 'View Reports',
                                        onPressed: () =>
                                            AutoRouter.of(context).push(
                                                InventoryReportSelectionRoute(
                                              inventoryListener:
                                                  HCMInventoryBloc(
                                                      userId: user!.uuid!,
                                                      projectId: project.id,
                                                      uuid: user.uuid!,
                                                      context: context,
                                                      actionMap: actionMap,
                                                      roles: user.roles!),
                                              isDistributor: true,
                                              projectId: project.id,
                                              isWareHouseMgr: true,
                                              loggedInUserUuid: user.uuid!,
                                            ))),
                                    DigitListView(
                                        prefixIcon: Icons.person,
                                        sufixIcon: Icons.arrow_circle_right,
                                        title: 'Search Referral Reconciliation',
                                        onPressed: () =>
                                            AutoRouter.of(context).push(
                                                SearchReferralReconciliationsRoute(
                                              referralReconListener:
                                                  HFReferralBloc(
                                                selectedProject: project,
                                                actionMap: actionMap,
                                                tenantId: envConfig
                                                    .variables.tenantId,
                                                checklistTypes: appConfig
                                                        ?.appConfig!
                                                        .appConfig?[0]
                                                        .checklistTypes
                                                        .map((e) => e.code)
                                                        .toList() ??
                                                    [],
                                              ),
                                              projectId: project.id,
                                              userName: user!.userName!,
                                              cycles: context.cycles,
                                              validIndividualAgeForCampaign:
                                                  ValidIndividualAgeForCampaign(
                                                      validMinAge: context
                                                              .selectedProjectType
                                                              ?.validMinAge ??
                                                          0,
                                                      validMaxAge: context
                                                              .selectedProjectType
                                                              ?.validMaxAge ??
                                                          0),
                                              referralReasons: appConfig
                                                      ?.referralReasons!
                                                      .referralReasonList
                                                      ?.map((e) => e.code)
                                                      .toList() ??
                                                  [],
                                              appVersion: '1.3',
                                              boundaryName: 'CAVINA1',
                                              genders: genderOptions!
                                                  .map((option) =>
                                                      option.code.toString())
                                                  .toList(),
                                              tenantId:
                                                  envConfig.variables.tenantId,
                                              checklistTypes: [],
                                            ))),
                                  ],
                                );
                              } else {
                                return Center(child: Text('No Projects Found'));
                              }
                            });
                          } else {
                            return const Center(child: Text('No Users Found'));
                          }
                        });
                      })));
        }));
  }
}
