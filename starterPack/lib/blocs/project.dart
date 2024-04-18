import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/project_staff/project_staff.dart';
import 'package:starterPack/model/projects/project.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';
import 'package:starterPack/repositories/project_repo.dart';
import 'package:starterPack/repositories/project_staff_repo.dart';

part 'project.freezed.dart';

// Bloc responsible for handling project-related operations
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  // Constructor for ProjectBloc
  ProjectBloc() : super(const ProjectState.initial()) {
    on(_handleFetchProjects);
    on(_selectProject);
  }

  // Handler for fetching projects
  FutureOr<void> _handleFetchProjects(
      ProjectsFetchEvent event, Emitter<ProjectState> emit) async {
    // Fetch project staff list
    final projectStaffList = await ProjectStaffRemoteRepository().searchStaff(
        ProjectStaffSearchModel(staffId: [event.uuid.toString()]),
        event.actionMap);

    // Create search body for projects based on staff's project IDs
    List<ProjectSearchModel> searchBody = [];
    for (final staff in projectStaffList) {
      searchBody.add(ProjectSearchModel(
        id: staff.projectId,
        tenantId: envConfig.variables.tenantId,
      ));
    }

    // Fetch projects based on search body
    final projectRemoteRepository = ProjectRemoteRepository();
    List<ProjectModel> projectsList =
        await projectRemoteRepository.search(searchBody, event.actionMap);

    // Emit fetched state with projects list
    emit(ProjectState.fetched(projectsList));
  }

  FutureOr<void> _selectProject(
      ProjectSelectEvent event, Emitter<ProjectState> emit) {
    final projectId = event.projectId;

    emit(ProjectState.selected(projectId));
  }
}

// Freezed union for project events
@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.fetchProjects(
          {required String uuid,
          required Map<DataModelType, Map<ApiOperation, String>> actionMap}) =
      ProjectsFetchEvent;

  const factory ProjectEvent.selectProject(String projectId) =
      ProjectSelectEvent;
}

// Freezed union for project states
@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _ProjectInitialState;
  const factory ProjectState.fetched(List<ProjectModel> projectsList) =
      ProjectFetchedState;
  const factory ProjectState.selected(projectId) = ProjectSelectedState;
}
