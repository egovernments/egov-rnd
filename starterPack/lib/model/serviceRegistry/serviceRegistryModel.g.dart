// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serviceRegistryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRegistryModelImpl _$$ServiceRegistryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceRegistryModelImpl(
      serviceRegistryWrapper: json['HCM-SERVICE-REGISTRY'] == null
          ? null
          : ServiceRegistryWrapper.fromJson(
              json['HCM-SERVICE-REGISTRY'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServiceRegistryModelImplToJson(
        _$ServiceRegistryModelImpl instance) =>
    <String, dynamic>{
      'HCM-SERVICE-REGISTRY': instance.serviceRegistryWrapper,
    };

_$ServiceRegistryWrapperImpl _$$ServiceRegistryWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceRegistryWrapperImpl(
      serviceRegistry: (json['serviceRegistry'] as List<dynamic>?)
          ?.map((e) => ServiceRegistry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceRegistryWrapperImplToJson(
        _$ServiceRegistryWrapperImpl instance) =>
    <String, dynamic>{
      'serviceRegistry': instance.serviceRegistry,
    };

_$ServiceRegistryImpl _$$ServiceRegistryImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceRegistryImpl(
      json['service'] as String?,
      (json['actions'] as List<dynamic>?)
          ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceRegistryImplToJson(
        _$ServiceRegistryImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'actions': instance.actions,
    };

_$ActionImpl _$$ActionImplFromJson(Map<String, dynamic> json) => _$ActionImpl(
      action: json['action'] as String,
      entityName: json['entityName'] as String,
      path: json['path'] as String,
    );

Map<String, dynamic> _$$ActionImplToJson(_$ActionImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'entityName': instance.entityName,
      'path': instance.path,
    };
