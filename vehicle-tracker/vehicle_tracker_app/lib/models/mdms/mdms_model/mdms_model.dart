// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mdms_model.freezed.dart';
part 'mdms_model.g.dart';


@freezed
class MdmsResponse with _$MdmsResponse {

  factory MdmsResponse({

    @JsonKey(name: "MdmsRes")

    MdmsRes? mdmsRes,



  })= _MdmsResponse;

  factory MdmsResponse.fromJson(Map<String, dynamic> json) => _$MdmsResponseFromJson(json);
}



@freezed
class MdmsRes with _$MdmsRes {

  factory MdmsRes({

    @JsonKey(name: "common-masters")

    CommonMasters? commonMasters,
    @JsonKey(name:"tenant")
    Tenant? tenant,
  })= _MdmsRes;

  factory MdmsRes.fromJson(Map<String, dynamic> json) => _$MdmsResFromJson(json);
}


@freezed
class CommonMasters with _$CommonMasters {

  factory CommonMasters({

    @JsonKey(name: "StateInfo")

    List<StateInfo>? stateInfo
  })= _CommonMasters;

  factory CommonMasters.fromJson(Map<String, dynamic> json) => _$CommonMastersFromJson(json);
}


@freezed
class StateInfo with _$StateInfo {
  const factory StateInfo({
    String? name,
    String? code,
    String? qrCodeURL,
    String? bannerUrl,
    String? logoUrl,
    String? logoUrlWhite,
    String? statelogo,
    bool? hasLocalisation,
    bool? enableWhatsApp,
    Map<String, String>? defaultUrl,
    List<Language>? languages,
    List<LocalizationModule>? localizationModules,
  }) = _StateInfo;

  factory StateInfo.fromJson(Map<String, dynamic> json) => _$StateInfoFromJson(json);
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



@freezed
class Tenant with _$Tenant {


  factory Tenant({
    @JsonKey(name: "tenants")

    List<Tenants>?tenants

  })=_Tenant;

  factory Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);
}


@freezed
class Tenants with _$Tenants{


  factory Tenants({
    @JsonKey(name: "code")
    String? code,

    @JsonKey(name:"name")
    String? name,
    @JsonKey(name: "type")
    String? type,

    @JsonKey(name: "city")
    City? city

  })=_Tenants;

  factory Tenants.fromJson(Map<String, dynamic> json) => _$TenantsFromJson(json);
}


@freezed
class City with _$City{


  factory City({
    @JsonKey(name: "name")
    required String name,

    @JsonKey(name:"localName")
    required String localName,
    @JsonKey(name: "code")
    required String code,



  })=_City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}