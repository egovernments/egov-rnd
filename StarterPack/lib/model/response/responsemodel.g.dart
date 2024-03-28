// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      access_token: json['access_token'] as String,
      token_type: json['token_type'] as String?,
      refresh_token: json['refresh_token'] as String?,
      scope: json['scope'] as String?,
      userRequest: json['UserRequest'] == null
          ? null
          : UserRequest.fromJson(json['UserRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'token_type': instance.token_type,
      'refresh_token': instance.refresh_token,
      'scope': instance.scope,
      'UserRequest': instance.userRequest,
    };

_$UserRequestImpl _$$UserRequestImplFromJson(Map<String, dynamic> json) =>
    _$UserRequestImpl(
      id: json['id'] as int,
      uuid: json['uuid'] as String,
      userName: json['userName'] as String?,
      name: json['name'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      emailId: json['emailId'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => Roles.fromJson(e as Map<String, dynamic>))
          .toList(),
      tenantId: json['tenantId'] as String,
    );

Map<String, dynamic> _$$UserRequestImplToJson(_$UserRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'userName': instance.userName,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'emailId': instance.emailId,
      'type': instance.type,
      'active': instance.active,
      'roles': instance.roles,
      'tenantId': instance.tenantId,
    };

_$RolesImpl _$$RolesImplFromJson(Map<String, dynamic> json) => _$RolesImpl(
      name: json['name'] as String?,
      code: json['code'] as String?,
      tenantId: json['tenantId'] as String?,
    );

Map<String, dynamic> _$$RolesImplToJson(_$RolesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'tenantId': instance.tenantId,
    };
