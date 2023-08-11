// ignore_for_file: invalid_annotation_target, depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_model.freezed.dart';
part 'localization_model.g.dart';

@freezed
class LocalizationModel with _$LocalizationModel {
  @JsonSerializable(explicitToJson: true)
  const factory LocalizationModel({
    @Default([]) List<LocalizationMessageModel> messages,
  }) = _LocalizationModel;

  factory LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationModelFromJson(json);
}

@freezed
class LocalizationMessageModel with _$LocalizationMessageModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory LocalizationMessageModel({
    required String code,
    required String message,
    required String module,
    required String locale,
  }) = _LocalizationMessageModel;

  factory LocalizationMessageModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizationMessageModelFromJson(json);
}