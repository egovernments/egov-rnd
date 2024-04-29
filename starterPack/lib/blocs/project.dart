import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starterPack/model/appconfig/mdmsRequest.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/project_staff/project_staff.dart';
import 'package:starterPack/model/project_types/project_types.dart';
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
    List<ProjectModel> projectsList =
        await ProjectRemoteRepository().search(searchBody, event.actionMap);

    // Emit fetched state with projects list
    emit(ProjectState.fetched(projectsList));
  }

  Future<FutureOr<void>> _selectProject(
      ProjectSelectEvent event, Emitter<ProjectState> emit) async {
    final projectId = event.project.id;
    final selectedProjectTypeId = event.project.projectTypeId;

    final projectTypesResponse = await AppInitRepo().searchProjectTypes(
      MdmsRequestModel(
        mdmsCriteria: MdmsCriteriaModel(
          tenantId: envConfig.variables.tenantId,
          moduleDetails: [
            const MdmsModuleDetailsModel(
              moduleName: 'HCM-PROJECT-TYPES',
              masterDetails: [MdmsMasterDetailsModel('projectTypes')],
            ),
          ],
        ),
      ).toJson(),
    );
    final availableProjectTypes =
        projectTypesResponse.projectTypeWrapper?.projectTypes;

    //choose the project type based on the selected project
    final relevantProject = availableProjectTypes
        ?.firstWhere((element) => element.id == selectedProjectTypeId);

    emit(ProjectState.selected(event.project, relevantProject!));
  }
}

// Freezed union for project events
@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.fetchProjects(
          {required String uuid,
          required Map<DataModelType, Map<ApiOperation, String>> actionMap}) =
      ProjectsFetchEvent;

  const factory ProjectEvent.selectProject(ProjectModel project) =
      ProjectSelectEvent;
}

// Freezed union for project states
@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState.initial() = _ProjectInitialState;
  const factory ProjectState.fetched(
    List<ProjectModel> projectsList,
  ) = ProjectFetchedState;
  const factory ProjectState.selected(
          ProjectModel project, ProjectType relevantProjectType) =
      ProjectSelectedState;
}
