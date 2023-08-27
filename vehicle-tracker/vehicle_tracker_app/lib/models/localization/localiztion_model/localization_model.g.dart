// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocalizationModel _$$_LocalizationModelFromJson(Map<String, dynamic> json) =>
    _$_LocalizationModel(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) =>
                  LocalizationMessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LocalizationModelToJson(
        _$_LocalizationModel instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

_$_LocalizationMessageModel _$$_LocalizationMessageModelFromJson(
        Map<String, dynamic> json) =>
    _$_LocalizationMessageModel(
      code: json['code'] as String,
      message: json['message'] as String,
      module: json['module'] as String,
      locale: json['locale'] as String,
    );

Map<String, dynamic> _$$_LocalizationMessageModelToJson(
        _$_LocalizationMessageModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'module': instance.module,
      'locale': instance.locale,
    };
