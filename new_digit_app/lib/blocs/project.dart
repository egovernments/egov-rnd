import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/project_staff/project_staff.dart';
import 'package:new_digit_app/model/projects/project.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/repositories/project_repo.dart';
import 'package:new_digit_app/repositories/project_staff_repo.dart';

part 'project.freezed.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectState.initial()) {
    on(_handleFetchProjects);
  }

  FutureOr<void> _handleFetchProjects(
      ProjectsFetchEvent event, Emitter<ProjectState> emit) async {
    final projectStaffList = await ProjectStaffRemoteRepository().searchStaff(
        ProjectStaffSearchModel(staffId: [event.uuid.toString()]),
        event.actionMap);

    List<ProjectSearchModel> searchBody = [];
    for (final staff in projectStaffList) {
      searchBody.add(ProjectSearchModel(
        id: staff.projectId,
        tenantId: envConfig.variables.tenantId,
      ));
    }

    final projectRemoteRepository = ProjectRemoteRepository();

    List<ProjectModel> projectsList =
        await projectRemoteRepository.search(searchBody, event.actionMap);

    emit(ProjectState.fetched(projectsList));

    // return projectsList;
  }
}

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.fetchProjects(
          {required String uuid,
          required Map<DataModelType, Map<ApiOperation, String>> actionMap}) =
      ProjectsFetchEvent;
}

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _ProjectInitialState;
  const factory ProjectState.fetched(List<ProjectModel> projectsList) =
      ProjectFetchedState;
}
