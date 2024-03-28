// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      username: json['username'] as String?,
      password: json['password'] as String?,
      tenantId: json['tenantId'] as String?,
      userType: json['userType'] as String?,
      grant_type: json['grant_type'] as String?,
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'tenantId': instance.tenantId,
      'userType': instance.userType,
      'grant_type': instance.grant_type,
    };
