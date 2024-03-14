// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MdmsResponse _$$_MdmsResponseFromJson(Map<String, dynamic> json) =>
    _$_MdmsResponse(
      mdmsRes: json['MdmsRes'] == null
          ? null
          : MdmsRes.fromJson(json['MdmsRes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MdmsResponseToJson(_$_MdmsResponse instance) =>
    <String, dynamic>{
      'MdmsRes': instance.mdmsRes,
    };

_$_MdmsRes _$$_MdmsResFromJson(Map<String, dynamic> json) => _$_MdmsRes(
      commonMasters: json['common-masters'] == null
          ? null
          : CommonMasters.fromJson(
              json['common-masters'] as Map<String, dynamic>),
      tenant: json['tenant'] == null
          ? null
          : Tenant.fromJson(json['tenant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MdmsResToJson(_$_MdmsRes instance) =>
    <String, dynamic>{
      'common-masters': instance.commonMasters,
      'tenant': instance.tenant,
    };

_$_CommonMasters _$$_CommonMastersFromJson(Map<String, dynamic> json) =>
    _$_CommonMasters(
      stateInfo: (json['StateInfo'] as List<dynamic>?)
          ?.map((e) => StateInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CommonMastersToJson(_$_CommonMasters instance) =>
    <String, dynamic>{
      'StateInfo': instance.stateInfo,
    };

_$_StateInfo _$$_StateInfoFromJson(Map<String, dynamic> json) => _$_StateInfo(
      name: json['name'] as String?,
      code: json['code'] as String?,
      qrCodeURL: json['qrCodeURL'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      logoUrl: json['logoUrl'] as String?,
      logoUrlWhite: json['logoUrlWhite'] as String?,
      statelogo: json['statelogo'] as String?,
      hasLocalisation: json['hasLocalisation'] as bool?,
      enableWhatsApp: json['enableWhatsApp'] as bool?,
      defaultUrl: (json['defaultUrl'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      localizationModules: (json['localizationModules'] as List<dynamic>?)
          ?.map((e) => LocalizationModule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StateInfoToJson(_$_StateInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'qrCodeURL': instance.qrCodeURL,
      'bannerUrl': instance.bannerUrl,
      'logoUrl': instance.logoUrl,
      'logoUrlWhite': instance.logoUrlWhite,
      'statelogo': instance.statelogo,
      'hasLocalisation': instance.hasLocalisation,
      'enableWhatsApp': instance.enableWhatsApp,
      'defaultUrl': instance.defaultUrl,
      'languages': instance.languages,
      'localizationModules': instance.localizationModules,
    };

_$_Language _$$_LanguageFromJson(Map<String, dynamic> json) => _$_Language(
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_LanguageToJson(_$_Language instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

_$_LocalizationModule _$$_LocalizationModuleFromJson(
        Map<String, dynamic> json) =>
    _$_LocalizationModule(
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$_LocalizationModuleToJson(
        _$_LocalizationModule instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

_$_Tenant _$$_TenantFromJson(Map<String, dynamic> json) => _$_Tenant(
      tenants: (json['tenants'] as List<dynamic>?)
          ?.map((e) => Tenants.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TenantToJson(_$_Tenant instance) => <String, dynamic>{
      'tenants': instance.tenants,
    };

_$_Tenants _$$_TenantsFromJson(Map<String, dynamic> json) => _$_Tenants(
      code: json['code'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TenantsToJson(_$_Tenants instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'type': instance.type,
      'city': instance.city,
    };

_$_City _$$_CityFromJson(Map<String, dynamic> json) => _$_City(
      name: json['name'] as String,
      localName: json['localName'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$_CityToJson(_$_City instance) => <String, dynamic>{
      'name': instance.name,
      'localName': instance.localName,
      'code': instance.code,
    };
