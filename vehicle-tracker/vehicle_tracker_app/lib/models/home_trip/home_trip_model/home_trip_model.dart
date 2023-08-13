// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_trip_model.freezed.dart';
part 'home_trip_model.g.dart';

@freezed
class HomeTripModel with _$HomeTripModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory HomeTripModel(
      {required String id,
      required String routeId,
      required String serviceCode,
      required String status,
      required String plannedStartTime,
      required String plannedEndTime,
      required Operator operator,
      String? actualStartTime,
      String? actualEndTime,
      required String userId,
      String? locationAlerts}) = _HomeTripModel;

  factory HomeTripModel.fromJson(Map<String, dynamic> json) => _$HomeTripModelFromJson(json);
}

@freezed
class Operator with _$Operator {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Operator({
    required String id,
    required String name,
    required String email,
    required String contactNumber,
    required String vehicleNumber,
  }) = _Operator;

  factory Operator.fromJson(Map<String, dynamic> json) => _$OperatorFromJson(json);
}
