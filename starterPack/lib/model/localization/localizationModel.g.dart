// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalizationModelImpl _$$LocalizationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizationModelImpl(
      messages: (json['messages'] as List<dynamic>?)
              ?.map((e) =>
                  LocalizationMessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LocalizationModelImplToJson(
        _$LocalizationModelImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

_$LocalizationMessageModelImpl _$$LocalizationMessageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizationMessageModelImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      module: json['module'] as String,
      locale: json['locale'] as String,
    );

Map<String, dynamic> _$$LocalizationMessageModelImplToJson(
        _$LocalizationMessageModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'module': instance.module,
      'locale': instance.locale,
    };
