// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdmsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MdmsRequestModelImpl _$$MdmsRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsRequestModelImpl(
      mdmsCriteria: json['MdmsCriteria'] == null
          ? null
          : MdmsCriteriaModel.fromJson(
              json['MdmsCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MdmsRequestModelImplToJson(
        _$MdmsRequestModelImpl instance) =>
    <String, dynamic>{
      'MdmsCriteria': instance.mdmsCriteria,
    };

_$MdmsCriteriaModelImpl _$$MdmsCriteriaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsCriteriaModelImpl(
      tenantId: json['tenantId'] as String?,
      moduleDetails: (json['moduleDetails'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : MdmsModuleDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MdmsCriteriaModelImplToJson(
        _$MdmsCriteriaModelImpl instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleDetails': instance.moduleDetails,
    };

_$MdmsModuleDetailsModelImpl _$$MdmsModuleDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsModuleDetailsModelImpl(
      moduleName: json['moduleName'] as String?,
      masterDetails: (json['masterDetails'] as List<dynamic>?)
          ?.map(
              (e) => MdmsMasterDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MdmsModuleDetailsModelImplToJson(
        _$MdmsModuleDetailsModelImpl instance) =>
    <String, dynamic>{
      'moduleName': instance.moduleName,
      'masterDetails': instance.masterDetails,
    };

_$MdmsMasterDetailsModelImpl _$$MdmsMasterDetailsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsMasterDetailsModelImpl(
      json['name'] as String,
    );

Map<String, dynamic> _$$MdmsMasterDetailsModelImplToJson(
        _$MdmsMasterDetailsModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
