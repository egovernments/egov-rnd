// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mdms_model.freezed.dart';
part 'mdms_model.g.dart';

@freezed
class MdmsModel with _$MdmsModel {
  const factory MdmsModel({
    required String tenantId,
    required String moduleName,
    required List<StateInfoModel> StateInfo,
  }) = _MdmsModel;

  factory MdmsModel.fromJson(Map<String, dynamic> json) => _$MdmsModelFromJson(json);
}

@freezed
class StateInfoModel with _$StateInfoModel {
  const factory StateInfoModel({
    required String name,
    required String code,
    required String qrCodeURL,
    required String bannerUrl,
    required String logoUrl,
    required String logoUrlWhite,
    required String statelogo,
    required bool hasLocalisation,
    required bool enableWhatsApp,
    required Map<String, String> defaultUrl,
    required List<Language> languages,
    required List<LocalizationModule> localizationModules,
  }) = _StateInfo;

  factory StateInfoModel.fromJson(Map<String, dynamic> json) => _$StateInfoModelFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({
    required String label,
    required String value,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}

@freezed
class LocalizationModule with _$LocalizationModule {
  const factory LocalizationModule({
    required String label,
    required String value,
  }) = _LocalizationModule;

  factory LocalizationModule.fromJson(Map<String, dynamic> json) => _$LocalizationModuleFromJson(json);
}
