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

MdmsModel _$MdmsModelFromJson(Map<String, dynamic> json) {
  return _MdmsModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsModel {
  String get tenantId => throw _privateConstructorUsedError;
  String get moduleName => throw _privateConstructorUsedError;
  List<StateInfoModel> get StateInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsModelCopyWith<MdmsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsModelCopyWith<$Res> {
  factory $MdmsModelCopyWith(MdmsModel value, $Res Function(MdmsModel) then) =
      _$MdmsModelCopyWithImpl<$Res, MdmsModel>;
  @useResult
  $Res call(
      {String tenantId, String moduleName, List<StateInfoModel> StateInfo});
}

/// @nodoc
class _$MdmsModelCopyWithImpl<$Res, $Val extends MdmsModel>
    implements $MdmsModelCopyWith<$Res> {
  _$MdmsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? StateInfo = null,
  }) {
    return _then(_value.copyWith(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      StateInfo: null == StateInfo
          ? _value.StateInfo
          : StateInfo // ignore: cast_nullable_to_non_nullable
              as List<StateInfoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MdmsModelCopyWith<$Res> implements $MdmsModelCopyWith<$Res> {
  factory _$$_MdmsModelCopyWith(
          _$_MdmsModel value, $Res Function(_$_MdmsModel) then) =
      __$$_MdmsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tenantId, String moduleName, List<StateInfoModel> StateInfo});
}

/// @nodoc
class __$$_MdmsModelCopyWithImpl<$Res>
    extends _$MdmsModelCopyWithImpl<$Res, _$_MdmsModel>
    implements _$$_MdmsModelCopyWith<$Res> {
  __$$_MdmsModelCopyWithImpl(
      _$_MdmsModel _value, $Res Function(_$_MdmsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = null,
    Object? moduleName = null,
    Object? StateInfo = null,
  }) {
    return _then(_$_MdmsModel(
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      moduleName: null == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String,
      StateInfo: null == StateInfo
          ? _value._StateInfo
          : StateInfo // ignore: cast_nullable_to_non_nullable
              as List<StateInfoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MdmsModel implements _MdmsModel {
  const _$_MdmsModel(
      {required this.tenantId,
      required this.moduleName,
      required final List<StateInfoModel> StateInfo})
      : _StateInfo = StateInfo;

  factory _$_MdmsModel.fromJson(Map<String, dynamic> json) =>
      _$$_MdmsModelFromJson(json);

  @override
  final String tenantId;
  @override
  final String moduleName;
  final List<StateInfoModel> _StateInfo;
  @override
  List<StateInfoModel> get StateInfo {
    if (_StateInfo is EqualUnmodifiableListView) return _StateInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_StateInfo);
  }

  @override
  String toString() {
    return 'MdmsModel(tenantId: $tenantId, moduleName: $moduleName, StateInfo: $StateInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MdmsModel &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            const DeepCollectionEquality()
                .equals(other._StateInfo, _StateInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tenantId, moduleName,
      const DeepCollectionEquality().hash(_StateInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MdmsModelCopyWith<_$_MdmsModel> get copyWith =>
      __$$_MdmsModelCopyWithImpl<_$_MdmsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MdmsModelToJson(
      this,
    );
  }
}

abstract class _MdmsModel implements MdmsModel {
  const factory _MdmsModel(
      {required final String tenantId,
      required final String moduleName,
      required final List<StateInfoModel> StateInfo}) = _$_MdmsModel;

  factory _MdmsModel.fromJson(Map<String, dynamic> json) =
      _$_MdmsModel.fromJson;

  @override
  String get tenantId;
  @override
  String get moduleName;
  @override
  List<StateInfoModel> get StateInfo;
  @override
  @JsonKey(ignore: true)
  _$$_MdmsModelCopyWith<_$_MdmsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

StateInfoModel _$StateInfoModelFromJson(Map<String, dynamic> json) {
  return _StateInfo.fromJson(json);
}

/// @nodoc
mixin _$StateInfoModel {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get qrCodeURL => throw _privateConstructorUsedError;
  String get bannerUrl => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  String get logoUrlWhite => throw _privateConstructorUsedError;
  String get statelogo => throw _privateConstructorUsedError;
  bool get hasLocalisation => throw _privateConstructorUsedError;
  bool get enableWhatsApp => throw _privateConstructorUsedError;
  Map<String, String> get defaultUrl => throw _privateConstructorUsedError;
  List<Language> get languages => throw _privateConstructorUsedError;
  List<LocalizationModule> get localizationModules =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateInfoModelCopyWith<StateInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateInfoModelCopyWith<$Res> {
  factory $StateInfoModelCopyWith(
          StateInfoModel value, $Res Function(StateInfoModel) then) =
      _$StateInfoModelCopyWithImpl<$Res, StateInfoModel>;
  @useResult
  $Res call(
      {String name,
      String code,
      String qrCodeURL,
      String bannerUrl,
      String logoUrl,
      String logoUrlWhite,
      String statelogo,
      bool hasLocalisation,
      bool enableWhatsApp,
      Map<String, String> defaultUrl,
      List<Language> languages,
      List<LocalizationModule> localizationModules});
}

/// @nodoc
class _$StateInfoModelCopyWithImpl<$Res, $Val extends StateInfoModel>
    implements $StateInfoModelCopyWith<$Res> {
  _$StateInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? qrCodeURL = null,
    Object? bannerUrl = null,
    Object? logoUrl = null,
    Object? logoUrlWhite = null,
    Object? statelogo = null,
    Object? hasLocalisation = null,
    Object? enableWhatsApp = null,
    Object? defaultUrl = null,
    Object? languages = null,
    Object? localizationModules = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeURL: null == qrCodeURL
          ? _value.qrCodeURL
          : qrCodeURL // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrlWhite: null == logoUrlWhite
          ? _value.logoUrlWhite
          : logoUrlWhite // ignore: cast_nullable_to_non_nullable
              as String,
      statelogo: null == statelogo
          ? _value.statelogo
          : statelogo // ignore: cast_nullable_to_non_nullable
              as String,
      hasLocalisation: null == hasLocalisation
          ? _value.hasLocalisation
          : hasLocalisation // ignore: cast_nullable_to_non_nullable
              as bool,
      enableWhatsApp: null == enableWhatsApp
          ? _value.enableWhatsApp
          : enableWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultUrl: null == defaultUrl
          ? _value.defaultUrl
          : defaultUrl // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      localizationModules: null == localizationModules
          ? _value.localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<LocalizationModule>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateInfoCopyWith<$Res>
    implements $StateInfoModelCopyWith<$Res> {
  factory _$$_StateInfoCopyWith(
          _$_StateInfo value, $Res Function(_$_StateInfo) then) =
      __$$_StateInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String code,
      String qrCodeURL,
      String bannerUrl,
      String logoUrl,
      String logoUrlWhite,
      String statelogo,
      bool hasLocalisation,
      bool enableWhatsApp,
      Map<String, String> defaultUrl,
      List<Language> languages,
      List<LocalizationModule> localizationModules});
}

/// @nodoc
class __$$_StateInfoCopyWithImpl<$Res>
    extends _$StateInfoModelCopyWithImpl<$Res, _$_StateInfo>
    implements _$$_StateInfoCopyWith<$Res> {
  __$$_StateInfoCopyWithImpl(
      _$_StateInfo _value, $Res Function(_$_StateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? qrCodeURL = null,
    Object? bannerUrl = null,
    Object? logoUrl = null,
    Object? logoUrlWhite = null,
    Object? statelogo = null,
    Object? hasLocalisation = null,
    Object? enableWhatsApp = null,
    Object? defaultUrl = null,
    Object? languages = null,
    Object? localizationModules = null,
  }) {
    return _then(_$_StateInfo(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      qrCodeURL: null == qrCodeURL
          ? _value.qrCodeURL
          : qrCodeURL // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrlWhite: null == logoUrlWhite
          ? _value.logoUrlWhite
          : logoUrlWhite // ignore: cast_nullable_to_non_nullable
              as String,
      statelogo: null == statelogo
          ? _value.statelogo
          : statelogo // ignore: cast_nullable_to_non_nullable
              as String,
      hasLocalisation: null == hasLocalisation
          ? _value.hasLocalisation
          : hasLocalisation // ignore: cast_nullable_to_non_nullable
              as bool,
      enableWhatsApp: null == enableWhatsApp
          ? _value.enableWhatsApp
          : enableWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultUrl: null == defaultUrl
          ? _value._defaultUrl
          : defaultUrl // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      localizationModules: null == localizationModules
          ? _value._localizationModules
          : localizationModules // ignore: cast_nullable_to_non_nullable
              as List<LocalizationModule>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateInfo implements _StateInfo {
  const _$_StateInfo(
      {required this.name,
      required this.code,
      required this.qrCodeURL,
      required this.bannerUrl,
      required this.logoUrl,
      required this.logoUrlWhite,
      required this.statelogo,
      required this.hasLocalisation,
      required this.enableWhatsApp,
      required final Map<String, String> defaultUrl,
      required final List<Language> languages,
      required final List<LocalizationModule> localizationModules})
      : _defaultUrl = defaultUrl,
        _languages = languages,
        _localizationModules = localizationModules;

  factory _$_StateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_StateInfoFromJson(json);

  @override
  final String name;
  @override
  final String code;
  @override
  final String qrCodeURL;
  @override
  final String bannerUrl;
  @override
  final String logoUrl;
  @override
  final String logoUrlWhite;
  @override
  final String statelogo;
  @override
  final bool hasLocalisation;
  @override
  final bool enableWhatsApp;
  final Map<String, String> _defaultUrl;
  @override
  Map<String, String> get defaultUrl {
    if (_defaultUrl is EqualUnmodifiableMapView) return _defaultUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_defaultUrl);
  }

  final List<Language> _languages;
  @override
  List<Language> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  final List<LocalizationModule> _localizationModules;
  @override
  List<LocalizationModule> get localizationModules {
    if (_localizationModules is EqualUnmodifiableListView)
      return _localizationModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localizationModules);
  }

  @override
  String toString() {
    return 'StateInfoModel(name: $name, code: $code, qrCodeURL: $qrCodeURL, bannerUrl: $bannerUrl, logoUrl: $logoUrl, logoUrlWhite: $logoUrlWhite, statelogo: $statelogo, hasLocalisation: $hasLocalisation, enableWhatsApp: $enableWhatsApp, defaultUrl: $defaultUrl, languages: $languages, localizationModules: $localizationModules)';
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

abstract class _StateInfo implements StateInfoModel {
  const factory _StateInfo(
          {required final String name,
          required final String code,
          required final String qrCodeURL,
          required final String bannerUrl,
          required final String logoUrl,
          required final String logoUrlWhite,
          required final String statelogo,
          required final bool hasLocalisation,
          required final bool enableWhatsApp,
          required final Map<String, String> defaultUrl,
          required final List<Language> languages,
          required final List<LocalizationModule> localizationModules}) =
      _$_StateInfo;

  factory _StateInfo.fromJson(Map<String, dynamic> json) =
      _$_StateInfo.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get qrCodeURL;
  @override
  String get bannerUrl;
  @override
  String get logoUrl;
  @override
  String get logoUrlWhite;
  @override
  String get statelogo;
  @override
  bool get hasLocalisation;
  @override
  bool get enableWhatsApp;
  @override
  Map<String, String> get defaultUrl;
  @override
  List<Language> get languages;
  @override
  List<LocalizationModule> get localizationModules;
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
