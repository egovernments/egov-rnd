// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digit_row_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitRowCardModelImpl _$$DigitRowCardModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DigitRowCardModelImpl(
      label: json['label'] as String,
      value: json['value'] as String,
      isSelected: json['isSelected'] as bool? ?? false,
    );

Map<String, dynamic> _$$DigitRowCardModelImplToJson(
        _$DigitRowCardModelImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'isSelected': instance.isSelected,
    };
