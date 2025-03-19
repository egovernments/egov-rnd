// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mdms_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MdmsResponse _$MdmsResponseFromJson(Map<String, dynamic> json) {
  return _MdmsResponse.fromJson(json);
}

/// @nodoc
mixin _$MdmsResponse {
  @JsonKey(name: "MdmsRes")
  MdmsRes? get mdmsRes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsResponseCopyWith<MdmsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsResponseCopyWith<$Res> {
  factory $MdmsResponseCopyWith(
          MdmsResponse value, $Res Function(MdmsResponse) then) =
      _$MdmsResponseCopyWithImpl<$Res, MdmsResponse>;
  @useResult
  $Res call({@JsonKey(name: "MdmsRes") MdmsRes? mdmsRes});

  $MdmsResCopyWith<$Res>? get mdmsRes;
}

/// @nodoc
class _$MdmsResponseCopyWithImpl<$Res, $Val extends MdmsResponse>
    implements $MdmsResponseCopyWith<$Res> {
  _$MdmsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsRes = freezed,
  }) {
    return _then(_value.copyWith(
      mdmsRes: freezed == mdmsRes
          ? _value.mdmsRes
          : mdmsRes // ignore: cast_nullable_to_non_nullable
              as MdmsRes?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MdmsResCopyWith<$Res>? get mdmsRes {
    if (_value.mdmsRes == null) {
      return null;
    }

    return $MdmsResCopyWith<$Res>(_value.mdmsRes!, (value) {
      return _then(_value.copyWith(mdmsRes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MdmsResponseCopyWith<$Res>
    implements $MdmsResponseCopyWith<$Res> {
  factory _$$_MdmsResponseCopyWith(
          _$_MdmsResponse value, $Res Function(_$_MdmsResponse) then) =
      __$$_MdmsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "MdmsRes") MdmsRes? mdmsRes});

  @override
  $MdmsResCopyWith<$Res>? get mdmsRes;
}

/// @nodoc
class __$$_MdmsResponseCopyWithImpl<$Res>
    extends _$MdmsResponseCopyWithImpl<$Res, _$_MdmsResponse>
    implements _$$_MdmsResponseCopyWith<$Res> {
  __$$_MdmsResponseCopyWithImpl(
      _$_MdmsResponse _value, $Res Function(_$_MdmsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsRes = freezed,
  }) {
    return _then(_$_MdmsResponse(
      mdmsRes: freezed == mdmsRes
          ? _value.mdmsRes
          : mdmsRes // ignore: cast_nullable_to_non_nullable
              as MdmsRes?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsResponse implements _MdmsResponse {
  _$_MdmsResponse({@JsonKey(name: "MdmsRes") this.mdmsRes});

  factory _$_MdmsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsResponseFromJson(json);

  @override
  @JsonKey(name: "MdmsRes")
  final MdmsRes? mdmsRes;

  @override
  String toString() {
    return 'MdmsResponse(mdmsRes: $mdmsRes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsResponse &&
            (identical(other.mdmsRes, mdmsRes) || other.mdmsRes == mdmsRes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mdmsRes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsResponseCopyWith<_$_MdmsResponse> get copyWith =>
      __$$_MdmsResponseCopyWithImpl<_$_MdmsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsResponseToJson(
      this,
    );
  }
}

abstract class _MdmsResponse implements MdmsResponse {
  factory _MdmsResponse({@JsonKey(name: "MdmsRes") final MdmsRes? mdmsRes}) =
      _$_MdmsResponse;

  factory _MdmsResponse.fromJson(Map<String, dynamic> json) =
      _$_MdmsResponse.fromJson;

  @override
  @JsonKey(name: "MdmsRes")
  MdmsRes? get mdmsRes;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsResponseCopyWith<_$_MdmsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MdmsRes _$MdmsResFromJson(Map<String, dynamic> json) {
  return _MdmsRes.fromJson(json);
}

/// @nodoc
mixin _$MdmsRes {
  @JsonKey(name: "common-masters")
  CommonMasters? get commonMasters => throw _privateConstructorUsedError;
  @JsonKey(name: "tenant")
  Tenant? get tenant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsResCopyWith<MdmsRes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsResCopyWith<$Res> {
  factory $MdmsResCopyWith(MdmsRes value, $Res Function(MdmsRes) then) =
      _$MdmsResCopyWithImpl<$Res, MdmsRes>;
  @useResult
  $Res call(
      {@JsonKey(name: "common-masters") CommonMasters? commonMasters,
      @JsonKey(name: "tenant") Tenant? tenant});

  $CommonMastersCopyWith<$Res>? get commonMasters;
  $TenantCopyWith<$Res>? get tenant;
}

/// @nodoc
class _$MdmsResCopyWithImpl<$Res, $Val extends MdmsRes>
    implements $MdmsResCopyWith<$Res> {
  _$MdmsResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonMasters = freezed,
    Object? tenant = freezed,
  }) {
    return _then(_value.copyWith(
      commonMasters: freezed == commonMasters
          ? _value.commonMasters
          : commonMasters // ignore: cast_nullable_to_non_nullable
              as CommonMasters?,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as Tenant?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommonMastersCopyWith<$Res>? get commonMasters {
    if (_value.commonMasters == null) {
      return null;
    }

    return $CommonMastersCopyWith<$Res>(_value.commonMasters!, (value) {
      return _then(_value.copyWith(commonMasters: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TenantCopyWith<$Res>? get tenant {
    if (_value.tenant == null) {
      return null;
    }

    return $TenantCopyWith<$Res>(_value.tenant!, (value) {
      return _then(_value.copyWith(tenant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MdmsResCopyWith<$Res> implements $MdmsResCopyWith<$Res> {
  factory _$$_MdmsResCopyWith(
          _$_MdmsRes value, $Res Function(_$_MdmsRes) then) =
      __$$_MdmsResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "common-masters") CommonMasters? commonMasters,
      @JsonKey(name: "tenant") Tenant? tenant});

  @override
  $CommonMastersCopyWith<$Res>? get commonMasters;
  @override
  $TenantCopyWith<$Res>? get tenant;
}

/// @nodoc
class __$$_MdmsResCopyWithImpl<$Res>
    extends _$MdmsResCopyWithImpl<$Res, _$_MdmsRes>
    implements _$$_MdmsResCopyWith<$Res> {
  __$$_MdmsResCopyWithImpl(_$_MdmsRes _value, $Res Function(_$_MdmsRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonMasters = freezed,
    Object? tenant = freezed,
  }) {
    return _then(_$_MdmsRes(
      commonMasters: freezed == commonMasters
          ? _value.commonMasters
          : commonMasters // ignore: cast_nullable_to_non_nullable
              as CommonMasters?,
      tenant: freezed == tenant
          ? _value.tenant
          : tenant // ignore: cast_nullable_to_non_nullable
              as Tenant?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsRes implements _MdmsRes {
  _$_MdmsRes(
      {@JsonKey(name: "common-masters") this.commonMasters,
      @JsonKey(name: "tenant") this.tenant});

  factory _$_MdmsRes.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsResFromJson(json);

  @override
  @JsonKey(name: "common-masters")
  final CommonMasters? commonMasters;
  @override
  @JsonKey(name: "tenant")
  final Tenant? tenant;

  @override
  String toString() {
    return 'MdmsRes(commonMasters: $commonMasters, tenant: $tenant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsRes &&
            (identical(other.commonMasters, commonMasters) ||
                other.commonMasters == commonMasters) &&
            (identical(other.tenant, tenant) || other.tenant == tenant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, commonMasters, tenant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsResCopyWith<_$_MdmsRes> get copyWith =>
      __$$_MdmsResCopyWithImpl<_$_MdmsRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsResToJson(
      this,
    );
  }
}

abstract class _MdmsRes implements MdmsRes {
  factory _MdmsRes(
      {@JsonKey(name: "common-masters") final CommonMasters? commonMasters,
      @JsonKey(name: "tenant") final Tenant? tenant}) = _$_MdmsRes;

  factory _MdmsRes.fromJson(Map<String, dynamic> json) = _$_MdmsRes.fromJson;

  @override
  @JsonKey(name: "common-masters")
  CommonMasters? get commonMasters;
  @override
  @JsonKey(name: "tenant")
  Tenant? get tenant;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsResCopyWith<_$_MdmsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

CommonMasters _$CommonMastersFromJson(Map<String, dynamic> json) {
  return _CommonMasters.fromJson(json);
}

/// @nodoc
mixin _$CommonMasters {
  @JsonKey(name: "StateInfo")
  List<StateInfo>? get stateInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommonMastersCopyWith<CommonMasters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonMastersCopyWith<$Res> {
  factory $CommonMastersCopyWith(
          CommonMasters value, $Res Function(CommonMasters) then) =
      _$CommonMastersCopyWithImpl<$Res, CommonMasters>;
  @useResult
  $Res call({@JsonKey(name: "StateInfo") List<StateInfo>? stateInfo});
}

/// @nodoc
class _$CommonMastersCopyWithImpl<$Res, $Val extends CommonMasters>
    implements $CommonMastersCopyWith<$Res> {
  _$CommonMastersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateInfo = freezed,
  }) {
    return _then(_value.copyWith(
      stateInfo: freezed == stateInfo
          ? _value.stateInfo
          : stateInfo // ignore: cast_nullable_to_non_nullable
              as List<StateInfo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonMastersCopyWith<$Res>
    implements $CommonMastersCopyWith<$Res> {
  factory _$$_CommonMastersCopyWith(
          _$_CommonMasters value, $Res Function(_$_CommonMasters) then) =
      __$$_CommonMastersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "StateInfo") List<StateInfo>? stateInfo});
}

/// @nodoc
class __$$_CommonMastersCopyWithImpl<$Res>
    extends _$CommonMastersCopyWithImpl<$Res, _$_CommonMasters>
    implements _$$_CommonMastersCopyWith<$Res> {
  __$$_CommonMastersCopyWithImpl(
      _$_CommonMasters _value, $Res Function(_$_CommonMasters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateInfo = freezed,
  }) {
    return _then(_$_CommonMasters(
      stateInfo: freezed == stateInfo
          ? _value._stateInfo
          : stateInfo // ignore: cast_nullable_to_non_nullable
              as List<StateInfo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommonMasters implements _CommonMasters {
  _$_CommonMasters(
      {@JsonKey(name: "StateInfo") final List<StateInfo>? stateInfo})
      : _stateInfo = stateInfo;

  factory _$_CommonMasters.fromJson(Map<String, dynamic> json) =>
      _$$_CommonMastersFromJson(json);

  final List<StateInfo>? _stateInfo;
  @override
  @JsonKey(name: "StateInfo")
  List<StateInfo>? get stateInfo {
    final value = _stateInfo;
    if (value == null) return null;
    if (_stateInfo is EqualUnmodifiableListView) return _stateInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CommonMasters(stateInfo: $stateInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonMasters &&
            const DeepCollectionEquality()
                .equals(other._stateInfo, _stateInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_stateInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonMastersCopyWith<_$_CommonMasters> get copyWith =>
      __$$_CommonMastersCopyWithImpl<_$_CommonMasters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommonMastersToJson(
      this,
    );
  }
}

abstract class _CommonMasters implements CommonMasters {
  factory _CommonMasters(
          {@JsonKey(name: "StateInfo") final List<StateInfo>? stateInfo}) =
      _$_CommonMasters;

  factory _CommonMasters.fromJson(Map<String, dynamic> json) =
      _$_CommonMasters.fromJson;

  @override
  @JsonKey(name: "StateInfo")
  List<StateInfo>? get stateInfo;
  @override
  @JsonKey(ignore: true)
  _$$_CommonMastersCopyWith<_$_CommonMasters> get copyWith =>
      throw _privateConstructorUsedError;
}

StateInfo _$StateInfoFromJson(Map<String, dynamic> json) {
  return _StateInfo.fromJson(json);
}

/// @nodoc
mixin _$StateInfo {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get qrCodeURL => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get logoUrlWhite => throw _privateConstructorUsedError;
  String? get statelogo => throw _privateConstructorUsedError;
  bool? get hasLocalisation => throw _privateConstructorUsedError;
  bool? get enableWhatsApp => throw _privateConstructorUsedError;
  Map<String, String>? get defaultUrl => throw _privateConstructorUsedError;
  List<Language>? get languages => throw _privateConstructorUsedError;
  List<LocalizationModule>? get localizationModules =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateInfoCopyWith<StateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateInfoCopyWith<$Res> {
  factory $StateInfoCopyWith(StateInfo value, $Res Function(StateInfo) then) =
      _$StateInfoCopyWithImpl<$Res, StateInfo>;
  @useResult
  $Res call(
      {String? name,
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
      List<LocalizationModule>? localizationModules});
}

/// @nodoc
class _$StateInfoCopyWithImpl<$Res, $Val extends StateInfo>
    implements $StateInfoCopyWith<$Res> {
  _$StateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? qrCodeURL = freezed,
    Object? bannerUrl = freezed,
    Object? logoUrl = freezed,
    Object? logoUrlWhite = freezed,
    Object? statelogo = freezed,
    Object? hasLocalisation = freezed,
    Object? enableWhatsApp = freezed,
    Object? defaultUrl = freezed,
    Object? languages = freezed,
    Object? localizationModules = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeURL: freezed == qrCodeURL
          ? _value.qrCodeURL
          : qrCodeURL // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrlWhite: freezed == logoUrlWhite
          ? _value.logoUrlWhite
          : logoUrlWhite // ignore: cast_nullable_to_non_nullable
              as String?,
      statelogo: freezed == statelogo
          ? _value.statelogo
          : statelogo // ignore: cast_nullable_to_non_nullable
              as String?,
      hasLocalisation: freezed == hasLocalisation
          ? _value.hasLocalisation
          : hasLocalisation // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableWhatsApp: freezed == enableWhatsApp
          ? _value.enableWhatsApp
          : enableWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool?,
      defaultUrl: freezed == defaultUrl
          ? _value.defaultUrl
          : defaultUrl // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>?,
      localizationModules: freezed == localizationModules
          ? _value.localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<LocalizationModule>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateInfoCopyWith<$Res> implements $StateInfoCopyWith<$Res> {
  factory _$$_StateInfoCopyWith(
          _$_StateInfo value, $Res Function(_$_StateInfo) then) =
      __$$_StateInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
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
      List<LocalizationModule>? localizationModules});
}

/// @nodoc
class __$$_StateInfoCopyWithImpl<$Res>
    extends _$StateInfoCopyWithImpl<$Res, _$_StateInfo>
    implements _$$_StateInfoCopyWith<$Res> {
  __$$_StateInfoCopyWithImpl(
      _$_StateInfo _value, $Res Function(_$_StateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? qrCodeURL = freezed,
    Object? bannerUrl = freezed,
    Object? logoUrl = freezed,
    Object? logoUrlWhite = freezed,
    Object? statelogo = freezed,
    Object? hasLocalisation = freezed,
    Object? enableWhatsApp = freezed,
    Object? defaultUrl = freezed,
    Object? languages = freezed,
    Object? localizationModules = freezed,
  }) {
    return _then(_$_StateInfo(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeURL: freezed == qrCodeURL
          ? _value.qrCodeURL
          : qrCodeURL // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrlWhite: freezed == logoUrlWhite
          ? _value.logoUrlWhite
          : logoUrlWhite // ignore: cast_nullable_to_non_nullable
              as String?,
      statelogo: freezed == statelogo
          ? _value.statelogo
          : statelogo // ignore: cast_nullable_to_non_nullable
              as String?,
      hasLocalisation: freezed == hasLocalisation
          ? _value.hasLocalisation
          : hasLocalisation // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableWhatsApp: freezed == enableWhatsApp
          ? _value.enableWhatsApp
          : enableWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool?,
      defaultUrl: freezed == defaultUrl
          ? _value._defaultUrl
          : defaultUrl // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>?,
      localizationModules: freezed == localizationModules
          ? _value._localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<LocalizationModule>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateInfo implements _StateInfo {
  const _$_StateInfo(
      {this.name,
      this.code,
      this.qrCodeURL,
      this.bannerUrl,
      this.logoUrl,
      this.logoUrlWhite,
      this.statelogo,
      this.hasLocalisation,
      this.enableWhatsApp,
      final Map<String, String>? defaultUrl,
      final List<Language>? languages,
      final List<LocalizationModule>? localizationModules})
      : _defaultUrl = defaultUrl,
        _languages = languages,
        _localizationModules = localizationModules;

  factory _$_StateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_StateInfoFromJson(json);

  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? qrCodeURL;
  @override
  final String? bannerUrl;
  @override
  final String? logoUrl;
  @override
  final String? logoUrlWhite;
  @override
  final String? statelogo;
  @override
  final bool? hasLocalisation;
  @override
  final bool? enableWhatsApp;
  final Map<String, String>? _defaultUrl;
  @override
  Map<String, String>? get defaultUrl {
    final value = _defaultUrl;
    if (value == null) return null;
    if (_defaultUrl is EqualUnmodifiableMapView) return _defaultUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<Language>? _languages;
  @override
  List<Language>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LocalizationModule>? _localizationModules;
  @override
  List<LocalizationModule>? get localizationModules {
    final value = _localizationModules;
    if (value == null) return null;
    if (_localizationModules is EqualUnmodifiableListView)
      return _localizationModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StateInfo(name: $name, code: $code, qrCodeURL: $qrCodeURL, bannerUrl: $bannerUrl, logoUrl: $logoUrl, logoUrlWhite: $logoUrlWhite, statelogo: $statelogo, hasLocalisation: $hasLocalisation, enableWhatsApp: $enableWhatsApp, defaultUrl: $defaultUrl, languages: $languages, localizationModules: $localizationModules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateInfo &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.qrCodeURL, qrCodeURL) ||
                other.qrCodeURL == qrCodeURL) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.logoUrlWhite, logoUrlWhite) ||
                other.logoUrlWhite == logoUrlWhite) &&
            (identical(other.statelogo, statelogo) ||
                other.statelogo == statelogo) &&
            (identical(other.hasLocalisation, hasLocalisation) ||
                other.hasLocalisation == hasLocalisation) &&
            (identical(other.enableWhatsApp, enableWhatsApp) ||
                other.enableWhatsApp == enableWhatsApp) &&
            const DeepCollectionEquality()
                .equals(other._defaultUrl, _defaultUrl) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._localizationModules, _localizationModules));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      code,
      qrCodeURL,
      bannerUrl,
      logoUrl,
      logoUrlWhite,
      statelogo,
      hasLocalisation,
      enableWhatsApp,
      const DeepCollectionEquality().hash(_defaultUrl),
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_localizationModules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateInfoCopyWith<_$_StateInfo> get copyWith =>
      __$$_StateInfoCopyWithImpl<_$_StateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateInfoToJson(
      this,
    );
  }
}

abstract class _StateInfo implements StateInfo {
  const factory _StateInfo(
      {final String? name,
      final String? code,
      final String? qrCodeURL,
      final String? bannerUrl,
      final String? logoUrl,
      final String? logoUrlWhite,
      final String? statelogo,
      final bool? hasLocalisation,
      final bool? enableWhatsApp,
      final Map<String, String>? defaultUrl,
      final List<Language>? languages,
      final List<LocalizationModule>? localizationModules}) = _$_StateInfo;

  factory _StateInfo.fromJson(Map<String, dynamic> json) =
      _$_StateInfo.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get qrCodeURL;
  @override
  String? get bannerUrl;
  @override
  String? get logoUrl;
  @override
  String? get logoUrlWhite;
  @override
  String? get statelogo;
  @override
  bool? get hasLocalisation;
  @override
  bool? get enableWhatsApp;
  @override
  Map<String, String>? get defaultUrl;
  @override
  List<Language>? get languages;
  @override
  List<LocalizationModule>? get localizationModules;
  @override
  @JsonKey(ignore: true)
  _$$_StateInfoCopyWith<_$_StateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageCopyWith<$Res> implements $LanguageCopyWith<$Res> {
  factory _$$_LanguageCopyWith(
          _$_Language value, $Res Function(_$_Language) then) =
      __$$_LanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class __$$_LanguageCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$_Language>
    implements _$$_LanguageCopyWith<$Res> {
  __$$_LanguageCopyWithImpl(
      _$_Language _value, $Res Function(_$_Language) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$_Language(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Language implements _Language {
  const _$_Language({required this.label, required this.value});

  factory _$_Language.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageFromJson(json);

  @override
  final String label;
  @override
  final String value;

  @override
  String toString() {
    return 'Language(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Language &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageCopyWith<_$_Language> get copyWith =>
      __$$_LanguageCopyWithImpl<_$_Language>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  const factory _Language(
      {required final String label, required final String value}) = _$_Language;

  factory _Language.fromJson(Map<String, dynamic> json) = _$_Language.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageCopyWith<_$_Language> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalizationModule _$LocalizationModuleFromJson(Map<String, dynamic> json) {
  return _LocalizationModule.fromJson(json);
}

/// @nodoc
mixin _$LocalizationModule {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationModuleCopyWith<LocalizationModule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationModuleCopyWith<$Res> {
  factory $LocalizationModuleCopyWith(
          LocalizationModule value, $Res Function(LocalizationModule) then) =
      _$LocalizationModuleCopyWithImpl<$Res, LocalizationModule>;
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class _$LocalizationModuleCopyWithImpl<$Res, $Val extends LocalizationModule>
    implements $LocalizationModuleCopyWith<$Res> {
  _$LocalizationModuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalizationModuleCopyWith<$Res>
    implements $LocalizationModuleCopyWith<$Res> {
  factory _$$_LocalizationModuleCopyWith(_$_LocalizationModule value,
          $Res Function(_$_LocalizationModule) then) =
      __$$_LocalizationModuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class __$$_LocalizationModuleCopyWithImpl<$Res>
    extends _$LocalizationModuleCopyWithImpl<$Res, _$_LocalizationModule>
    implements _$$_LocalizationModuleCopyWith<$Res> {
  __$$_LocalizationModuleCopyWithImpl(
      _$_LocalizationModule _value, $Res Function(_$_LocalizationModule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$_LocalizationModule(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LocalizationModule implements _LocalizationModule {
  const _$_LocalizationModule({required this.label, required this.value});

  factory _$_LocalizationModule.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizationModuleFromJson(json);

  @override
  final String label;
  @override
  final String value;

  @override
  String toString() {
    return 'LocalizationModule(label: $label, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizationModule &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalizationModuleCopyWith<_$_LocalizationModule> get copyWith =>
      __$$_LocalizationModuleCopyWithImpl<_$_LocalizationModule>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizationModuleToJson(
      this,
    );
  }
}

abstract class _LocalizationModule implements LocalizationModule {
  const factory _LocalizationModule(
      {required final String label,
      required final String value}) = _$_LocalizationModule;

  factory _LocalizationModule.fromJson(Map<String, dynamic> json) =
      _$_LocalizationModule.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_LocalizationModuleCopyWith<_$_LocalizationModule> get copyWith =>
      throw _privateConstructorUsedError;
}

Tenant _$TenantFromJson(Map<String, dynamic> json) {
  return _Tenant.fromJson(json);
}

/// @nodoc
mixin _$Tenant {
  @JsonKey(name: "tenants")
  List<Tenants>? get tenants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantCopyWith<Tenant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantCopyWith<$Res> {
  factory $TenantCopyWith(Tenant value, $Res Function(Tenant) then) =
      _$TenantCopyWithImpl<$Res, Tenant>;
  @useResult
  $Res call({@JsonKey(name: "tenants") List<Tenants>? tenants});
}

/// @nodoc
class _$TenantCopyWithImpl<$Res, $Val extends Tenant>
    implements $TenantCopyWith<$Res> {
  _$TenantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenants = freezed,
  }) {
    return _then(_value.copyWith(
      tenants: freezed == tenants
          ? _value.tenants
          : tenants // ignore: cast_nullable_to_non_nullable
              as List<Tenants>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TenantCopyWith<$Res> implements $TenantCopyWith<$Res> {
  factory _$$_TenantCopyWith(_$_Tenant value, $Res Function(_$_Tenant) then) =
      __$$_TenantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "tenants") List<Tenants>? tenants});
}

/// @nodoc
class __$$_TenantCopyWithImpl<$Res>
    extends _$TenantCopyWithImpl<$Res, _$_Tenant>
    implements _$$_TenantCopyWith<$Res> {
  __$$_TenantCopyWithImpl(_$_Tenant _value, $Res Function(_$_Tenant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenants = freezed,
  }) {
    return _then(_$_Tenant(
      tenants: freezed == tenants
          ? _value._tenants
          : tenants // ignore: cast_nullable_to_non_nullable
              as List<Tenants>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tenant implements _Tenant {
  _$_Tenant({@JsonKey(name: "tenants") final List<Tenants>? tenants})
      : _tenants = tenants;

  factory _$_Tenant.fromJson(Map<String, dynamic> json) =>
      _$$_TenantFromJson(json);

  final List<Tenants>? _tenants;
  @override
  @JsonKey(name: "tenants")
  List<Tenants>? get tenants {
    final value = _tenants;
    if (value == null) return null;
    if (_tenants is EqualUnmodifiableListView) return _tenants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Tenant(tenants: $tenants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tenant &&
            const DeepCollectionEquality().equals(other._tenants, _tenants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tenants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TenantCopyWith<_$_Tenant> get copyWith =>
      __$$_TenantCopyWithImpl<_$_Tenant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TenantToJson(
      this,
    );
  }
}

abstract class _Tenant implements Tenant {
  factory _Tenant({@JsonKey(name: "tenants") final List<Tenants>? tenants}) =
      _$_Tenant;

  factory _Tenant.fromJson(Map<String, dynamic> json) = _$_Tenant.fromJson;

  @override
  @JsonKey(name: "tenants")
  List<Tenants>? get tenants;
  @override
  @JsonKey(ignore: true)
  _$$_TenantCopyWith<_$_Tenant> get copyWith =>
      throw _privateConstructorUsedError;
}

Tenants _$TenantsFromJson(Map<String, dynamic> json) {
  return _Tenants.fromJson(json);
}

/// @nodoc
mixin _$Tenants {
  @JsonKey(name: "code")
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  City? get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenantsCopyWith<Tenants> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenantsCopyWith<$Res> {
  factory $TenantsCopyWith(Tenants value, $Res Function(Tenants) then) =
      _$TenantsCopyWithImpl<$Res, Tenants>;
  @useResult
  $Res call(
      {@JsonKey(name: "code") String? code,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "city") City? city});

  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class _$TenantsCopyWithImpl<$Res, $Val extends Tenants>
    implements $TenantsCopyWith<$Res> {
  _$TenantsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TenantsCopyWith<$Res> implements $TenantsCopyWith<$Res> {
  factory _$$_TenantsCopyWith(
          _$_Tenants value, $Res Function(_$_Tenants) then) =
      __$$_TenantsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "code") String? code,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "city") City? city});

  @override
  $CityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$_TenantsCopyWithImpl<$Res>
    extends _$TenantsCopyWithImpl<$Res, _$_Tenants>
    implements _$$_TenantsCopyWith<$Res> {
  __$$_TenantsCopyWithImpl(_$_Tenants _value, $Res Function(_$_Tenants) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? city = freezed,
  }) {
    return _then(_$_Tenants(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tenants implements _Tenants {
  _$_Tenants(
      {@JsonKey(name: "code") this.code,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "city") this.city});

  factory _$_Tenants.fromJson(Map<String, dynamic> json) =>
      _$$_TenantsFromJson(json);

  @override
  @JsonKey(name: "code")
  final String? code;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "city")
  final City? city;

  @override
  String toString() {
    return 'Tenants(code: $code, name: $name, type: $type, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tenants &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, type, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TenantsCopyWith<_$_Tenants> get copyWith =>
      __$$_TenantsCopyWithImpl<_$_Tenants>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TenantsToJson(
      this,
    );
  }
}

abstract class _Tenants implements Tenants {
  factory _Tenants(
      {@JsonKey(name: "code") final String? code,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "city") final City? city}) = _$_Tenants;

  factory _Tenants.fromJson(Map<String, dynamic> json) = _$_Tenants.fromJson;

  @override
  @JsonKey(name: "code")
  String? get code;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "city")
  City? get city;
  @override
  @JsonKey(ignore: true)
  _$$_TenantsCopyWith<_$_Tenants> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "localName")
  String get localName => throw _privateConstructorUsedError;
  @JsonKey(name: "code")
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res, City>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "localName") String localName,
      @JsonKey(name: "code") String code});
}

/// @nodoc
class _$CityCopyWithImpl<$Res, $Val extends City>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? localName = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$$_CityCopyWith(_$_City value, $Res Function(_$_City) then) =
      __$$_CityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String name,
      @JsonKey(name: "localName") String localName,
      @JsonKey(name: "code") String code});
}

/// @nodoc
class __$$_CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res, _$_City>
    implements _$$_CityCopyWith<$Res> {
  __$$_CityCopyWithImpl(_$_City _value, $Res Function(_$_City) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? localName = null,
    Object? code = null,
  }) {
    return _then(_$_City(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      localName: null == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_City implements _City {
  _$_City(
      {@JsonKey(name: "name") required this.name,
      @JsonKey(name: "localName") required this.localName,
      @JsonKey(name: "code") required this.code});

  factory _$_City.fromJson(Map<String, dynamic> json) => _$$_CityFromJson(json);

  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "localName")
  final String localName;
  @override
  @JsonKey(name: "code")
  final String code;

  @override
  String toString() {
    return 'City(name: $name, localName: $localName, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_City &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, localName, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityCopyWith<_$_City> get copyWith =>
      __$$_CityCopyWithImpl<_$_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityToJson(
      this,
    );
  }
}

abstract class _City implements City {
  factory _City(
      {@JsonKey(name: "name") required final String name,
      @JsonKey(name: "localName") required final String localName,
      @JsonKey(name: "code") required final String code}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "localName")
  String get localName;
  @override
  @JsonKey(name: "code")
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_CityCopyWith<_$_City> get copyWith => throw _privateConstructorUsedError;
}
