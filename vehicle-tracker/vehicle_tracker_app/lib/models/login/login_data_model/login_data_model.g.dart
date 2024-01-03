// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginDataModel _$$_LoginDataModelFromJson(Map<String, dynamic> json) =>
    _$_LoginDataModel(
      access_token: json['access_token'] as String,
      UserRequest: UserRequestModel.fromJson(
          json['UserRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginDataModelToJson(_$_LoginDataModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'UserRequest': instance.UserRequest,
    };

_$_UserRequestModel _$$_UserRequestModelFromJson(Map<String, dynamic> json) =>
    _$_UserRequestModel(
      uuid: json['uuid'] as String,
      tenantId: json['tenantId'] as String,
      name: json['name'] as String,
      mobileNumber: json['mobileNumber'] as String,
    );

Map<String, dynamic> _$$_UserRequestModelToJson(_$_UserRequestModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
    };
