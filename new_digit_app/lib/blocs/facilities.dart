// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:new_digit_app/model/entities/project_facility.dart';
// import 'package:new_digit_app/model/facilities/facility.dart';

// part 'facilities.freezed.dart';

// typedef FacilityStateEmitter = Emitter<FacilityState>;

// class FacilityBloc extends Bloc<FacilityEvent, FacilityState> {
//   final FacilityRemoteRepository facilityRemoteRepository;
//   final ProjectFacilityRemoteRepository projectFacilityRemoteRepository;

//   FacilityBloc({
//     required this.facilityRemoteRepository,
//     required this.projectFacilityRemoteRepository,
//   }) : super(const FacilityEmptyState()) {
//     on(_handleLoadFacilitiesForProjectId);
//   }

//   Future<void> _handleLoadFacilitiesForProjectId(
//     FacilityLoadForProjectEvent event,
//     FacilityStateEmitter emit,
//   ) async {
//     emit(const FacilityLoadingState());

//     final projectFacilities = await projectFacilityRemoteRepository.search(
//       ProjectFacilitySearchModel(projectId: [event.projectId]),
//     );

//     List<FacilityModel> allFacilities = [
//       FacilityModel(
//         id: 'Delivery Team',
//         // additionalFields: FacilityAdditionalFields(
//         //   version: 1,
//         //   fields: [const AdditionalField('type', 'DeliveryTeam')],
//         // ),
//       ),
//     ];

//     List<FacilityModel> facilities = [];

//     if (event.loadAllProjects) {
//       var searchResult = await facilityRemoteRepository.search(
//         FacilitySearchModel(id: null),
//       );
//       allFacilities.addAll(searchResult);
//     }

//     for (final projectFacility in projectFacilities) {
//       var results = await facilityRemoteRepository.search(
//         FacilitySearchModel(id: [projectFacility.facilityId]),
//       );

//       facilities.addAll(results);
//     }

//     if (facilities.isEmpty) {
//       emit(const FacilityEmptyState());
//     } else {
//       emit(FacilityFetchedState(
//         facilities: facilities,
//         allFacilities: allFacilities,
//       ));
//     }
//   }
// }

// @freezed
// class FacilityEvent with _$FacilityEvent {
//   const factory FacilityEvent.loadForProjectId({
//     required String projectId,
//     @Default(true) bool loadAllProjects,
//   }) = FacilityLoadForProjectEvent;
// }

// @freezed
// class FacilityState with _$FacilityState {
//   const factory FacilityState.empty() = FacilityEmptyState;

//   const factory FacilityState.loading() = FacilityLoadingState;

//   const factory FacilityState.fetched({
//     required List<FacilityModel> facilities,
//     @Default([]) List<FacilityModel> allFacilities,
//   }) = FacilityFetchedState;
// }
