// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdmsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MdmsResponseModelImpl _$$MdmsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MdmsResponseModelImpl(
      appConfig: json['HCM-FIELD-APP-CONFIG'] == null
          ? null
          : AppConfig.fromJson(
              json['HCM-FIELD-APP-CONFIG'] as Map<String, dynamic>),
      referralReasons: json['HCM-REFERRAL-REASONS'] == null
          ? null
          : ReferralReasonsWrapperModel.fromJson(
              json['HCM-REFERRAL-REASONS'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MdmsResponseModelImplToJson(
        _$MdmsResponseModelImpl instance) =>
    <String, dynamic>{
      'HCM-FIELD-APP-CONFIG': instance.appConfig,
      'HCM-REFERRAL-REASONS': instance.referralReasons,
    };

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      appConfig: (json['appConfig'] as List<dynamic>?)
          ?.map((e) => AppConfigListItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'appConfig': instance.appConfig,
    };

_$AppConfigListItemsImpl _$$AppConfigListItemsImplFromJson(
        Map<String, dynamic> json) =>
    _$AppConfigListItemsImpl(
      tenantId: json['TENANT_ID'] as String?,
      languages: (json['LANGUAGES'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      backendInterface: json['BACKEND_INTERFACE'] == null
          ? null
          : InterfacesList.fromJson(
              json['BACKEND_INTERFACE'] as Map<String, dynamic>),
      genderOptions: (json['GENDER_OPTIONS_POPULATOR'] as List<dynamic>)
          .map((e) => GenderOptions.fromJson(e as Map<String, dynamic>))
          .toList(),
      transportTypes: (json['TRANSPORT_TYPES'] as List<dynamic>)
          .map((e) => TransportTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
      checklistTypes: (json['CHECKLIST_TYPES'] as List<dynamic>)
          .map((e) => ChecklistTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AppConfigListItemsImplToJson(
        _$AppConfigListItemsImpl instance) =>
    <String, dynamic>{
      'TENANT_ID': instance.tenantId,
      'LANGUAGES': instance.languages,
      'BACKEND_INTERFACE': instance.backendInterface,
      'GENDER_OPTIONS_POPULATOR': instance.genderOptions,
      'TRANSPORT_TYPES': instance.transportTypes,
      'CHECKLIST_TYPES': instance.checklistTypes,
    };

_$ChecklistTypesImpl _$$ChecklistTypesImplFromJson(Map<String, dynamic> json) =>
    _$ChecklistTypesImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$ChecklistTypesImplToJson(
        _$ChecklistTypesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$GenderOptionsImpl _$$GenderOptionsImplFromJson(Map<String, dynamic> json) =>
    _$GenderOptionsImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$GenderOptionsImplToJson(_$GenderOptionsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$InterfacesListImpl _$$InterfacesListImplFromJson(Map<String, dynamic> json) =>
    _$InterfacesListImpl(
      (json['interfaces'] as List<dynamic>?)
          ?.map((e) => Interfaces.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InterfacesListImplToJson(
        _$InterfacesListImpl instance) =>
    <String, dynamic>{
      'interfaces': instance.interfaces,
    };

_$InterfacesImpl _$$InterfacesImplFromJson(Map<String, dynamic> json) =>
    _$InterfacesImpl(
      type: json['type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$InterfacesImplToJson(_$InterfacesImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

_$TransportTypesImpl _$$TransportTypesImplFromJson(Map<String, dynamic> json) =>
    _$TransportTypesImpl(
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$TransportTypesImplToJson(
        _$TransportTypesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
    };

_$ReferralReasonsWrapperModelImpl _$$ReferralReasonsWrapperModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralReasonsWrapperModelImpl(
      referralReasonList: (json['referralReasons'] as List<dynamic>?)
          ?.map((e) => ReferralReasonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReferralReasonsWrapperModelImplToJson(
        _$ReferralReasonsWrapperModelImpl instance) =>
    <String, dynamic>{
      'referralReasons': instance.referralReasonList,
    };

_$ReferralReasonTypeImpl _$$ReferralReasonTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralReasonTypeImpl(
      code: json['code'] as String,
      name: json['name'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$ReferralReasonTypeImplToJson(
        _$ReferralReasonTypeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'active': instance.active,
    };
