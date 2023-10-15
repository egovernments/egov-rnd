// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeTripModel _$$_HomeTripModelFromJson(Map<String, dynamic> json) =>
    _$_HomeTripModel(
      id: json['id'] as String,
      routeId: json['routeId'] as String?,
      serviceCode: json['serviceCode'] as String?,
      status: json['status'] as String?,
      plannedStartTime: json['plannedStartTime'] as String?,
      plannedEndTime: json['plannedEndTime'] as String?,
      operator: json['operator'] == null
          ? null
          : Operator.fromJson(json['operator'] as Map<String, dynamic>),
      actualStartTime: json['actualStartTime'] as String?,
      actualEndTime: json['actualEndTime'] as String?,
      userId: json['userId'] as String?,
      locationAlerts: json['locationAlerts'] as String?,
    );

Map<String, dynamic> _$$_HomeTripModelToJson(_$_HomeTripModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('routeId', instance.routeId);
  writeNotNull('serviceCode', instance.serviceCode);
  writeNotNull('status', instance.status);
  writeNotNull('plannedStartTime', instance.plannedStartTime);
  writeNotNull('plannedEndTime', instance.plannedEndTime);
  writeNotNull('operator', instance.operator?.toJson());
  writeNotNull('actualStartTime', instance.actualStartTime);
  writeNotNull('actualEndTime', instance.actualEndTime);
  writeNotNull('userId', instance.userId);
  writeNotNull('locationAlerts', instance.locationAlerts);
  return val;
}

_$_Operator _$$_OperatorFromJson(Map<String, dynamic> json) => _$_Operator(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      contactNumber: json['contactNumber'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
    );

Map<String, dynamic> _$$_OperatorToJson(_$_Operator instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('contactNumber', instance.contactNumber);
  writeNotNull('vehicleNumber', instance.vehicleNumber);
  return val;
}
