import 'package:freezed_annotation/freezed_annotation.dart';

part 'mdmsResponse.freezed.dart';
part 'mdmsResponse.g.dart';

@freezed
class MdmsResponseModel with _$MdmsResponseModel {
  const factory MdmsResponseModel({
    @JsonKey(name: 'HCM-FIELD-APP-CONFIG') required AppConfig? appConfig,
    @JsonKey(name: 'HCM-REFERRAL-REASONS')
    required ReferralReasonsWrapperModel? referralReasons,
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
    @JsonKey(name: 'TRANSPORT_TYPES')
    required List<TransportTypes> transportTypes,
    @JsonKey(name: 'CHECKLIST_TYPES')
    required List<ChecklistTypes> checklistTypes,
  }) = _AppConfigListItems;

  factory AppConfigListItems.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AppConfigListItemsFromJson(json);
}

@freezed
class ChecklistTypes with _$ChecklistTypes {
  const factory ChecklistTypes({
    required String name,
    required String code,
  }) = _ChecklistTypes;

  factory ChecklistTypes.fromJson(Map<String, dynamic> json) =>
      _$ChecklistTypesFromJson(json);
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

@freezed
class TransportTypes with _$TransportTypes {
  const factory TransportTypes({
    required String name,
    required String code,
  }) = _TransportTypes;

  factory TransportTypes.fromJson(Map<String, dynamic> json) =>
      _$TransportTypesFromJson(json);
}

@freezed
class ReferralReasonsWrapperModel with _$ReferralReasonsWrapperModel {
  const factory ReferralReasonsWrapperModel({
    @JsonKey(name: 'referralReasons')
    List<ReferralReasonType>? referralReasonList,
  }) = _ReferralReasonsWrapperModel;

  factory ReferralReasonsWrapperModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReferralReasonsWrapperModelFromJson(json);
}

@freezed
class ReferralReasonType with _$ReferralReasonType {
  const factory ReferralReasonType({
    required String code,
    required String name,
    required bool active,
  }) = _ReferralReasonType;

  factory ReferralReasonType.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReferralReasonTypeFromJson(json);
}
