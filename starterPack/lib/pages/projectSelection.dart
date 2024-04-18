import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starterPack/blocs/app_init.dart';
import 'package:starterPack/blocs/authbloc.dart';
import 'package:starterPack/blocs/localization.dart';
import 'package:starterPack/blocs/project.dart';
import 'package:starterPack/blocs/userbloc.dart';
import 'package:starterPack/routes/routes.dart';
import 'package:starterPack/widget/localized.dart';

@RoutePage()

/// Widget for the project selection screen.
class ProjectSelectionScreen extends LocalizedStatefulWidget {
  /// Constructor for [ProjectSelectionScreen].
  const ProjectSelectionScreen({super.key, super.appLocalizations});

  @override
  State<ProjectSelectionScreen> createState() => _ProjectSelectionPageState();
}

class _ProjectSelectionPageState
    extends LocalizedState<ProjectSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AppInitialization, InitState>(
      builder: (context, state) {
        final actionMap = state.entityActionMapping;
        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) => BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) => state.maybeWhen(
                orElse: () => const Offstage(),
                authenticated: (accesstoken, refreshtoken, userRequest) =>
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        context.read<UserBloc>().add(UserEvent.searchUser(
                            uuid: userRequest!.uuid, actionMap: actionMap));
                        if (state is UserUserState) {
                          final user = state.userModel;
                          context
                              .read<ProjectBloc>()
                              .add(ProjectEvent.fetchProjects(
                                uuid: user!.uuid!,
                                actionMap: actionMap,
                              ));
                          return BlocBuilder<ProjectBloc, ProjectState>(
                            builder: (context, projectState) {
                              if (projectState is ProjectFetchedState) {
                                final projectList = projectState.projectsList;
                                if (projectList.isEmpty) {
                                  return const Text(
                                      'No Projects to be fetched');
                                }
                                return Scaffold(
                                  backgroundColor:
                                      theme.scaffoldBackgroundColor,
                                  body: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      for (final project in projectList)
                                        Center(
                                          child: DigitCard(
                                            child: DigitOutLineButton(
                                              label: project.name,
                                              onPressed: () {
                                                context.read<ProjectBloc>().add(
                                                    ProjectEvent.selectProject(
                                                        project.id));
                                                AutoRouter.of(context)
                                                    .replace(HomeRoute());
                                              },
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              } else {
                                return const Offstage();
                              }
                            },
                          );
                        } else {
                          return Scaffold(
                            appBar: AppBar(),
                            body:
                                const Center(child: Text('No Projects Found')),
                          );
                        }
                      },
                    )),
          ),
        );
      },
    );
  }
}
