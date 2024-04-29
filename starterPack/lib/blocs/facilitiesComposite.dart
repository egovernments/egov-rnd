import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/entities/project_facility.dart';
import 'package:starterPack/model/facilities/facility.dart';
import 'package:starterPack/repositories/facility_repo.dart';
import 'package:starterPack/repositories/project_facility_repo.dart';

// Using freezed_annotation for sealed classes
part 'facilitiesComposite.freezed.dart';

// Typedef for emitting FacilityCompositeState
typedef FacilityStateEmitter = Emitter<FacilityCompositeState>;

// FacilityCompositeBloc handling FacilityCompositeEvent
class FacilityCompositeBloc
    extends Bloc<FacilityCompositeEvent, FacilityCompositeState> {
  // Constructor initializing with initial state
  FacilityCompositeBloc() : super(const FacilityCompositeEmptyState()) {
    // Event handling for loading facilities for a project
    on(_handleLoadFacilitiesForProjectId);
  }

  // Handler for loading facilities for a project
  Future<void> _handleLoadFacilitiesForProjectId(
    FacilityCompositeLoadForProjectEvent event,
    FacilityStateEmitter emit,
  ) async {
    try {
      // Emitting loading state
      emit(const FacilityCompositeLoadingState());

      // Searching for project facilities
      final projectFacilities = await ProjectFacilityRemoteRepository().search(
          ProjectFacilitySearchModel(projectId: [event.projectId]),
          event.actionMap);

      // Extracting facility IDs from project facilities
      final projectFacility =
          projectFacilities.map((e) => e.facilityId).toList();

      // Searching for facilities based on project facility IDs
      var facilities = await FacilityRemoteRepository()
          .search(FacilitySearchModel(id: projectFacility), event.actionMap);

      // Emitting fetched state with facilities
      if (facilities.isEmpty) {
        emit(const FacilityCompositeEmptyState());
      } else {
        emit(FacilityCompositeFetchedState(
          facilities: facilities,
        ));
      }
    } catch (err) {
      // Printing error and rethrowing
      print(err);
      rethrow;
    }
  }
}

// Freezed union class for FacilityCompositeEvent
@freezed
class FacilityCompositeEvent with _$FacilityCompositeEvent {
  // Load facilities for a project event
  const factory FacilityCompositeEvent.loadForProjectId({
    required String projectId,
    required Map<DataModelType, Map<ApiOperation, String>>? actionMap,
  }) = FacilityCompositeLoadForProjectEvent;
}

// Freezed union class for FacilityCompositeState
@freezed
class FacilityCompositeState with _$FacilityCompositeState {
  // Empty state
  const factory FacilityCompositeState.empty() = FacilityCompositeEmptyState;

  // Loading state
  const factory FacilityCompositeState.loading() =
      FacilityCompositeLoadingState;

  // Fetched state with facilities
  const factory FacilityCompositeState.fetched({
    required List<FacilityModel> facilities,
  }) = FacilityCompositeFetchedState;
}
