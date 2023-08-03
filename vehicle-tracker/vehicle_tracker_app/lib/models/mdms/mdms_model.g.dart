// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mdms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MdmsModel _$$_MdmsModelFromJson(Map<String, dynamic> json) => _$_MdmsModel(
      tenantId: json['tenantId'] as String,
      moduleName: json['moduleName'] as String,
      StateInfo: (json['StateInfo'] as List<dynamic>)
          .map((e) => StateInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MdmsModelToJson(_$_MdmsModel instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'moduleName': instance.moduleName,
      'StateInfo': instance.StateInfo,
    };

_$_StateInfo _$$_StateInfoFromJson(Map<String, dynamic> json) => _$_StateInfo(
      name: json['name'] as String,
      code: json['code'] as String,
      qrCodeURL: json['qrCodeURL'] as String,
      bannerUrl: json['bannerUrl'] as String,
      logoUrl: json['logoUrl'] as String,
      logoUrlWhite: json['logoUrlWhite'] as String,
      statelogo: json['statelogo'] as String,
      hasLocalisation: json['hasLocalisation'] as bool,
      enableWhatsApp: json['enableWhatsApp'] as bool,
      defaultUrl: Map<String, String>.from(json['defaultUrl'] as Map),
      languages: (json['languages'] as List<dynamic>)
          .map((e) => Language.fromJson(e as Map<String, dynamic>))
          .toList(),
      localizationModules: (json['localizationModules'] as List<dynamic>)
          .map((e) => LocalizationModule.fromJson(e as Map<String, dynamic>))
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
