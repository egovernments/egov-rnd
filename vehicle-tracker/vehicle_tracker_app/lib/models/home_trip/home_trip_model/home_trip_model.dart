// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_trip_model.freezed.dart';
part 'home_trip_model.g.dart';

@unfreezed
class HomeTripModel with _$HomeTripModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  factory HomeTripModel(
      {required String id,
      String? routeId,
      String? serviceCode,
      String? status,
      String? plannedStartTime,
      String? plannedEndTime,
      Operator? operator,
      String? actualStartTime,
      String? actualEndTime,
      String? userId,
      Citizen? citizen,
      String? pickupLocation,
      String? dropLocation,
      String? name,
      String? tenantId,
      Vehicle? vehicle,
      String? locationAlerts}) = _HomeTripModel;

  factory HomeTripModel.fromJson(Map<String, dynamic> json) => _$HomeTripModelFromJson(json);
}

@freezed
class Operator with _$Operator {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Operator({
    String? id,
    String? name,
    String? email,
    String? contactNumber,
    String? vehicleNumber,
  }) = _Operator;

  factory Operator.fromJson(Map<String, dynamic> json) => _$OperatorFromJson(json);
}

@freezed
class Citizen with _$Citizen {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Citizen({
    String? name,
    String? contactNumber,
  }) = _Citizen;

  factory Citizen.fromJson(Map<String, dynamic> json) => _$CitizenFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Vehicle({
    String? registrationNumber,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}
