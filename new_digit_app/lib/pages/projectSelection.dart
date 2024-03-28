import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/pages/manage_stocks.dart';
import 'package:new_digit_app/blocs/app_init.dart';
import 'package:new_digit_app/blocs/inventory.dart';
import 'package:new_digit_app/blocs/project.dart';
import 'package:new_digit_app/blocs/userbloc.dart';
import 'package:new_digit_app/pages/sideBar.dart';
import 'package:new_digit_app/widget/localized.dart';

class ProjectSelectionScreen extends LocalizedStatefulWidget {
  const ProjectSelectionScreen({super.key, super.appLocalizations});

  @override
  State<ProjectSelectionScreen> createState() => _ProjectSelectionPageState();
}

class _ProjectSelectionPageState
    extends LocalizedState<ProjectSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserUserState) {
        final user = state.userModel;
        return BlocBuilder<AppInitialization, InitState>(
            builder: (context, state) {
          final actionMap = state.entityActionMapping;
          context.read<ProjectBloc>().add(ProjectEvent.fetchProjects(
              uuid: user!.uuid!, actionMap: actionMap));
          return BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
            if (state is ProjectFetchedState) {
              final projectList = state.projectsList;
              if (projectList.isEmpty) const Text('No Projects to be fetched');
              return Scaffold(
                drawer: Drawer(child: SideBar()),
                backgroundColor: theme.scaffoldBackgroundColor,
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final project in projectList)
                        Center(
                          child: DigitCard(
                              child: DigitOutLineButton(
                            label: project.name,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManageStocksPage(
                                            projectId: project.id,
                                            userId: user.uuid!,
                                            inventoryListener: HCMInventoryBloc(
                                                userId: user.uuid,
                                                uuid: user.uuid!,
                                                context: context,
                                                actionMap: actionMap,
                                                roles: user.roles),
                                            //TO-DO, what if the list of roles contains more elements
                                            boundaryName: '',
                                            isDistributor: true,
                                            isWareHouseMgr: true,
                                            transportType: [],
                                          )));
                            },
                            //logic for selected project
                          )),
                        )
                    ]),
              );
            } else {
              // return const Offstage();
              return const Text('Project Not fetched');
            }
          });
        });
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
