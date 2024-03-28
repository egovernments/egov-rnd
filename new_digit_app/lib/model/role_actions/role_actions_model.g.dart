// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleActionsWrapperModelImpl _$$RoleActionsWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RoleActionsWrapperModelImpl(
      actions: (json['actions'] as List<dynamic>?)
              ?.map((e) => RoleActionsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RoleActionsWrapperModelImplToJson(
        _$RoleActionsWrapperModelImpl instance) =>
    <String, dynamic>{
      'actions': instance.actions.map((e) => e.toJson()).toList(),
    };

_$RoleActionsModelImpl _$$RoleActionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RoleActionsModelImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      url: json['url'] as String?,
      displayName: json['displayName'] as String?,
      orderNumber: json['orderNumber'] as num?,
      queryParams: json['queryParams'] as String?,
      parentModule: json['parentModule'] as String?,
      enabled: json['enabled'] as bool,
      serviceCode: json['serviceCode'] as String?,
      tenantId: json['tenantId'] as String,
      createdDate: json['createdDate'] as String?,
      createdBy: json['createdBy'] as String?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      lastModifiedBy: json['lastModifiedBy'] as String?,
      path: json['path'] as String?,
      navigationURL: json['navigationURL'] as String?,
      leftIcon: json['leftIcon'] as String?,
      rightIcon: json['rightIcon'] as String?,
    );

Map<String, dynamic> _$$RoleActionsModelImplToJson(
        _$RoleActionsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'displayName': instance.displayName,
      'orderNumber': instance.orderNumber,
      'queryParams': instance.queryParams,
      'parentModule': instance.parentModule,
      'enabled': instance.enabled,
      'serviceCode': instance.serviceCode,
      'tenantId': instance.tenantId,
      'createdDate': instance.createdDate,
      'createdBy': instance.createdBy,
      'lastModifiedDate': instance.lastModifiedDate,
      'lastModifiedBy': instance.lastModifiedBy,
      'path': instance.path,
      'navigationURL': instance.navigationURL,
      'leftIcon': instance.leftIcon,
      'rightIcon': instance.rightIcon,
    };
