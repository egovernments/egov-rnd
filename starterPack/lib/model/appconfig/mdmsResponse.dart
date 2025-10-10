import 'package:freezed_annotation/freezed_annotation.dart';

part 'mdmsResponse.freezed.dart';
part 'mdmsResponse.g.dart';

@freezed
class MdmsResponseModel with _$MdmsResponseModel {
  const factory MdmsResponseModel({
    @JsonKey(name: 'HCM-FIELD-APP-CONFIG') required AppConfig? appConfig,
  }) = _MdmsResponseModel;

  factory MdmsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MdmsResponseModelFromJson(json);
}

@freezed
class AppConfig with _$AppConfig {
  const factory AppConfig(
      {@JsonKey(name: 'appConfig')
      required List<AppConfigListItems>? appConfig}) = _AppConfig;

  factory AppConfig.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppConfigFromJson(json);
}

@freezed
class AppConfigListItems with _$AppConfigListItems {
  const factory AppConfigListItems({
    @JsonKey(name: 'TENANT_ID') required String? tenantId,
    @JsonKey(name: 'LANGUAGES') required List<Language> languages,
    @JsonKey(name: 'BACKEND_INTERFACE')
    required InterfacesList? backendInterface,
    @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
    required List<GenderOptions> genderOptions,
  }) = _AppConfigListItems;

  factory AppConfigListItems.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppConfigListItemsFromJson(json);
}

@freezed
class GenderOptions with _$GenderOptions {
  factory GenderOptions({
    required String name,
    required String code,
  }) = _GenderOptions;

  factory GenderOptions.fromJson(Map<String, dynamic> json) =>
      _$GenderOptionsFromJson(json);
}

@freezed
class InterfacesList with _$InterfacesList {
  const factory InterfacesList(final List<Interfaces>? interfaces) =
      _InterfacesList;

  factory InterfacesList.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$InterfacesListFromJson(json);
}

@freezed
class Interfaces with _$Interfaces {
  const factory Interfaces({required String? type, required String? name}) =
      _Interfaces;

  factory Interfaces.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$InterfacesFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({required String label, required String value}) =
      _Language;

  factory Language.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LanguageFromJson(json);
}
