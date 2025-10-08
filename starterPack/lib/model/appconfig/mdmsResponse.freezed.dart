// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mdmsResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MdmsResponseModel _$MdmsResponseModelFromJson(Map<String, dynamic> json) {
  return _MdmsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsResponseModel {
  @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
  AppConfig? get appConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsResponseModelCopyWith<MdmsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsResponseModelCopyWith<$Res> {
  factory $MdmsResponseModelCopyWith(
          MdmsResponseModel value, $Res Function(MdmsResponseModel) then) =
      _$MdmsResponseModelCopyWithImpl<$Res, MdmsResponseModel>;
  @useResult
  $Res call({@JsonKey(name: 'HCM-FIELD-APP-CONFIG') AppConfig? appConfig});

  $AppConfigCopyWith<$Res>? get appConfig;
}

/// @nodoc
class _$MdmsResponseModelCopyWithImpl<$Res, $Val extends MdmsResponseModel>
    implements $MdmsResponseModelCopyWith<$Res> {
  _$MdmsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = freezed,
  }) {
    return _then(_value.copyWith(
      appConfig: freezed == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppConfigCopyWith<$Res>? get appConfig {
    if (_value.appConfig == null) {
      return null;
    }

    return $AppConfigCopyWith<$Res>(_value.appConfig!, (value) {
      return _then(_value.copyWith(appConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MdmsResponseModelImplCopyWith<$Res>
    implements $MdmsResponseModelCopyWith<$Res> {
  factory _$$MdmsResponseModelImplCopyWith(_$MdmsResponseModelImpl value,
          $Res Function(_$MdmsResponseModelImpl) then) =
      __$$MdmsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'HCM-FIELD-APP-CONFIG') AppConfig? appConfig});

  @override
  $AppConfigCopyWith<$Res>? get appConfig;
}

/// @nodoc
class __$$MdmsResponseModelImplCopyWithImpl<$Res>
    extends _$MdmsResponseModelCopyWithImpl<$Res, _$MdmsResponseModelImpl>
    implements _$$MdmsResponseModelImplCopyWith<$Res> {
  __$$MdmsResponseModelImplCopyWithImpl(_$MdmsResponseModelImpl _value,
      $Res Function(_$MdmsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = freezed,
  }) {
    return _then(_$MdmsResponseModelImpl(
      appConfig: freezed == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as AppConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsResponseModelImpl implements _MdmsResponseModel {
  const _$MdmsResponseModelImpl(
      {@JsonKey(name: 'HCM-FIELD-APP-CONFIG') required this.appConfig});

  factory _$MdmsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
  final AppConfig? appConfig;

  @override
  String toString() {
    return 'MdmsResponseModel(appConfig: $appConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsResponseModelImpl &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsResponseModelImplCopyWith<_$MdmsResponseModelImpl> get copyWith =>
      __$$MdmsResponseModelImplCopyWithImpl<_$MdmsResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsResponseModel implements MdmsResponseModel {
  const factory _MdmsResponseModel(
      {@JsonKey(name: 'HCM-FIELD-APP-CONFIG')
      required final AppConfig? appConfig}) = _$MdmsResponseModelImpl;

  factory _MdmsResponseModel.fromJson(Map<String, dynamic> json) =
      _$MdmsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'HCM-FIELD-APP-CONFIG')
  AppConfig? get appConfig;
  @override
  @JsonKey(ignore: true)
  _$$MdmsResponseModelImplCopyWith<_$MdmsResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  @JsonKey(name: 'appConfig')
  List<AppConfigListItems>? get appConfig => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call({@JsonKey(name: 'appConfig') List<AppConfigListItems>? appConfig});
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = freezed,
  }) {
    return _then(_value.copyWith(
      appConfig: freezed == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as List<AppConfigListItems>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'appConfig') List<AppConfigListItems>? appConfig});
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = freezed,
  }) {
    return _then(_$AppConfigImpl(
      appConfig: freezed == appConfig
          ? _value._appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as List<AppConfigListItems>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigImpl implements _AppConfig {
  const _$AppConfigImpl(
      {@JsonKey(name: 'appConfig')
      required final List<AppConfigListItems>? appConfig})
      : _appConfig = appConfig;

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  final List<AppConfigListItems>? _appConfig;
  @override
  @JsonKey(name: 'appConfig')
  List<AppConfigListItems>? get appConfig {
    final value = _appConfig;
    if (value == null) return null;
    if (_appConfig is EqualUnmodifiableListView) return _appConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AppConfig(appConfig: $appConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            const DeepCollectionEquality()
                .equals(other._appConfig, _appConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_appConfig));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig implements AppConfig {
  const factory _AppConfig(
      {@JsonKey(name: 'appConfig')
      required final List<AppConfigListItems>? appConfig}) = _$AppConfigImpl;

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  @JsonKey(name: 'appConfig')
  List<AppConfigListItems>? get appConfig;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppConfigListItems _$AppConfigListItemsFromJson(Map<String, dynamic> json) {
  return _AppConfigListItems.fromJson(json);
}

/// @nodoc
mixin _$AppConfigListItems {
  @JsonKey(name: 'TENANT_ID')
  String? get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LANGUAGES')
  List<Language> get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'BACKEND_INTERFACE')
  InterfacesList? get backendInterface => throw _privateConstructorUsedError;
  @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
  List<GenderOptions> get genderOptions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigListItemsCopyWith<AppConfigListItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigListItemsCopyWith<$Res> {
  factory $AppConfigListItemsCopyWith(
          AppConfigListItems value, $Res Function(AppConfigListItems) then) =
      _$AppConfigListItemsCopyWithImpl<$Res, AppConfigListItems>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TENANT_ID') String? tenantId,
      @JsonKey(name: 'LANGUAGES') List<Language> languages,
      @JsonKey(name: 'BACKEND_INTERFACE') InterfacesList? backendInterface,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
      List<GenderOptions> genderOptions});

  $InterfacesListCopyWith<$Res>? get backendInterface;
}

/// @nodoc
class _$AppConfigListItemsCopyWithImpl<$Res, $Val extends AppConfigListItems>
    implements $AppConfigListItemsCopyWith<$Res> {
  _$AppConfigListItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = freezed,
    Object? languages = null,
    Object? backendInterface = freezed,
    Object? genderOptions = null,
  }) {
    return _then(_value.copyWith(
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      backendInterface: freezed == backendInterface
          ? _value.backendInterface
          : backendInterface // ignore: cast_nullable_to_non_nullable
              as InterfacesList?,
      genderOptions: null == genderOptions
          ? _value.genderOptions
          : genderOptions // ignore: cast_nullable_to_non_nullable
              as List<GenderOptions>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InterfacesListCopyWith<$Res>? get backendInterface {
    if (_value.backendInterface == null) {
      return null;
    }

    return $InterfacesListCopyWith<$Res>(_value.backendInterface!, (value) {
      return _then(_value.copyWith(backendInterface: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppConfigListItemsImplCopyWith<$Res>
    implements $AppConfigListItemsCopyWith<$Res> {
  factory _$$AppConfigListItemsImplCopyWith(_$AppConfigListItemsImpl value,
          $Res Function(_$AppConfigListItemsImpl) then) =
      __$$AppConfigListItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TENANT_ID') String? tenantId,
      @JsonKey(name: 'LANGUAGES') List<Language> languages,
      @JsonKey(name: 'BACKEND_INTERFACE') InterfacesList? backendInterface,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
      List<GenderOptions> genderOptions});

  @override
  $InterfacesListCopyWith<$Res>? get backendInterface;
}

/// @nodoc
class __$$AppConfigListItemsImplCopyWithImpl<$Res>
    extends _$AppConfigListItemsCopyWithImpl<$Res, _$AppConfigListItemsImpl>
    implements _$$AppConfigListItemsImplCopyWith<$Res> {
  __$$AppConfigListItemsImplCopyWithImpl(_$AppConfigListItemsImpl _value,
      $Res Function(_$AppConfigListItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = freezed,
    Object? languages = null,
    Object? backendInterface = freezed,
    Object? genderOptions = null,
  }) {
    return _then(_$AppConfigListItemsImpl(
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      backendInterface: freezed == backendInterface
          ? _value.backendInterface
          : backendInterface // ignore: cast_nullable_to_non_nullable
              as InterfacesList?,
      genderOptions: null == genderOptions
          ? _value._genderOptions
          : genderOptions // ignore: cast_nullable_to_non_nullable
              as List<GenderOptions>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigListItemsImpl implements _AppConfigListItems {
  const _$AppConfigListItemsImpl(
      {@JsonKey(name: 'TENANT_ID') required this.tenantId,
      @JsonKey(name: 'LANGUAGES') required final List<Language> languages,
      @JsonKey(name: 'BACKEND_INTERFACE') required this.backendInterface,
      @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
      required final List<GenderOptions> genderOptions})
      : _languages = languages,
        _genderOptions = genderOptions;

  factory _$AppConfigListItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigListItemsImplFromJson(json);

  @override
  @JsonKey(name: 'TENANT_ID')
  final String? tenantId;
  final List<Language> _languages;
  @override
  @JsonKey(name: 'LANGUAGES')
  List<Language> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey(name: 'BACKEND_INTERFACE')
  final InterfacesList? backendInterface;
  final List<GenderOptions> _genderOptions;
  @override
  @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
  List<GenderOptions> get genderOptions {
    if (_genderOptions is EqualUnmodifiableListView) return _genderOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genderOptions);
  }

  @override
  String toString() {
    return 'AppConfigListItems(tenantId: $tenantId, languages: $languages, backendInterface: $backendInterface, genderOptions: $genderOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigListItemsImpl &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.backendInterface, backendInterface) ||
                other.backendInterface == backendInterface) &&
            const DeepCollectionEquality()
                .equals(other._genderOptions, _genderOptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      tenantId,
      const DeepCollectionEquality().hash(_languages),
      backendInterface,
      const DeepCollectionEquality().hash(_genderOptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigListItemsImplCopyWith<_$AppConfigListItemsImpl> get copyWith =>
      __$$AppConfigListItemsImplCopyWithImpl<_$AppConfigListItemsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigListItemsImplToJson(
      this,
    );
  }
}

abstract class _AppConfigListItems implements AppConfigListItems {
  const factory _AppConfigListItems(
          {@JsonKey(name: 'TENANT_ID') required final String? tenantId,
          @JsonKey(name: 'LANGUAGES') required final List<Language> languages,
          @JsonKey(name: 'BACKEND_INTERFACE')
          required final InterfacesList? backendInterface,
          @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
          required final List<GenderOptions> genderOptions}) =
      _$AppConfigListItemsImpl;

  factory _AppConfigListItems.fromJson(Map<String, dynamic> json) =
      _$AppConfigListItemsImpl.fromJson;

  @override
  @JsonKey(name: 'TENANT_ID')
  String? get tenantId;
  @override
  @JsonKey(name: 'LANGUAGES')
  List<Language> get languages;
  @override
  @JsonKey(name: 'BACKEND_INTERFACE')
  InterfacesList? get backendInterface;
  @override
  @JsonKey(name: 'GENDER_OPTIONS_POPULATOR')
  List<GenderOptions> get genderOptions;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigListItemsImplCopyWith<_$AppConfigListItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenderOptions _$GenderOptionsFromJson(Map<String, dynamic> json) {
  return _GenderOptions.fromJson(json);
}

/// @nodoc
mixin _$GenderOptions {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenderOptionsCopyWith<GenderOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderOptionsCopyWith<$Res> {
  factory $GenderOptionsCopyWith(
          GenderOptions value, $Res Function(GenderOptions) then) =
      _$GenderOptionsCopyWithImpl<$Res, GenderOptions>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$GenderOptionsCopyWithImpl<$Res, $Val extends GenderOptions>
    implements $GenderOptionsCopyWith<$Res> {
  _$GenderOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenderOptionsImplCopyWith<$Res>
    implements $GenderOptionsCopyWith<$Res> {
  factory _$$GenderOptionsImplCopyWith(
          _$GenderOptionsImpl value, $Res Function(_$GenderOptionsImpl) then) =
      __$$GenderOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$GenderOptionsImplCopyWithImpl<$Res>
    extends _$GenderOptionsCopyWithImpl<$Res, _$GenderOptionsImpl>
    implements _$$GenderOptionsImplCopyWith<$Res> {
  __$$GenderOptionsImplCopyWithImpl(
      _$GenderOptionsImpl _value, $Res Function(_$GenderOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$GenderOptionsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
class _$GenderOptionsImpl implements _GenderOptions {
  _$GenderOptionsImpl({required this.name, required this.code});

  factory _$GenderOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenderOptionsImplFromJson(json);

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'GenderOptions(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderOptionsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderOptionsImplCopyWith<_$GenderOptionsImpl> get copyWith =>
      __$$GenderOptionsImplCopyWithImpl<_$GenderOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenderOptionsImplToJson(
      this,
    );
  }
}

abstract class _GenderOptions implements GenderOptions {
  factory _GenderOptions(
      {required final String name,
      required final String code}) = _$GenderOptionsImpl;

  factory _GenderOptions.fromJson(Map<String, dynamic> json) =
      _$GenderOptionsImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$GenderOptionsImplCopyWith<_$GenderOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterfacesList _$InterfacesListFromJson(Map<String, dynamic> json) {
  return _InterfacesList.fromJson(json);
}

/// @nodoc
mixin _$InterfacesList {
  List<Interfaces>? get interfaces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterfacesListCopyWith<InterfacesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterfacesListCopyWith<$Res> {
  factory $InterfacesListCopyWith(
          InterfacesList value, $Res Function(InterfacesList) then) =
      _$InterfacesListCopyWithImpl<$Res, InterfacesList>;
  @useResult
  $Res call({List<Interfaces>? interfaces});
}

/// @nodoc
class _$InterfacesListCopyWithImpl<$Res, $Val extends InterfacesList>
    implements $InterfacesListCopyWith<$Res> {
  _$InterfacesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interfaces = freezed,
  }) {
    return _then(_value.copyWith(
      interfaces: freezed == interfaces
          ? _value.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterfacesListImplCopyWith<$Res>
    implements $InterfacesListCopyWith<$Res> {
  factory _$$InterfacesListImplCopyWith(_$InterfacesListImpl value,
          $Res Function(_$InterfacesListImpl) then) =
      __$$InterfacesListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Interfaces>? interfaces});
}

/// @nodoc
class __$$InterfacesListImplCopyWithImpl<$Res>
    extends _$InterfacesListCopyWithImpl<$Res, _$InterfacesListImpl>
    implements _$$InterfacesListImplCopyWith<$Res> {
  __$$InterfacesListImplCopyWithImpl(
      _$InterfacesListImpl _value, $Res Function(_$InterfacesListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interfaces = freezed,
  }) {
    return _then(_$InterfacesListImpl(
      freezed == interfaces
          ? _value._interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<Interfaces>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterfacesListImpl implements _InterfacesList {
  const _$InterfacesListImpl(final List<Interfaces>? interfaces)
      : _interfaces = interfaces;

  factory _$InterfacesListImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterfacesListImplFromJson(json);

  final List<Interfaces>? _interfaces;
  @override
  List<Interfaces>? get interfaces {
    final value = _interfaces;
    if (value == null) return null;
    if (_interfaces is EqualUnmodifiableListView) return _interfaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InterfacesList(interfaces: $interfaces)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterfacesListImpl &&
            const DeepCollectionEquality()
                .equals(other._interfaces, _interfaces));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_interfaces));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterfacesListImplCopyWith<_$InterfacesListImpl> get copyWith =>
      __$$InterfacesListImplCopyWithImpl<_$InterfacesListImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterfacesListImplToJson(
      this,
    );
  }
}

abstract class _InterfacesList implements InterfacesList {
  const factory _InterfacesList(final List<Interfaces>? interfaces) =
      _$InterfacesListImpl;

  factory _InterfacesList.fromJson(Map<String, dynamic> json) =
      _$InterfacesListImpl.fromJson;

  @override
  List<Interfaces>? get interfaces;
  @override
  @JsonKey(ignore: true)
  _$$InterfacesListImplCopyWith<_$InterfacesListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Interfaces _$InterfacesFromJson(Map<String, dynamic> json) {
  return _Interfaces.fromJson(json);
}

/// @nodoc
mixin _$Interfaces {
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterfacesCopyWith<Interfaces> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterfacesCopyWith<$Res> {
  factory $InterfacesCopyWith(
          Interfaces value, $Res Function(Interfaces) then) =
      _$InterfacesCopyWithImpl<$Res, Interfaces>;
  @useResult
  $Res call({String? type, String? name});
}

/// @nodoc
class _$InterfacesCopyWithImpl<$Res, $Val extends Interfaces>
    implements $InterfacesCopyWith<$Res> {
  _$InterfacesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterfacesImplCopyWith<$Res>
    implements $InterfacesCopyWith<$Res> {
  factory _$$InterfacesImplCopyWith(
          _$InterfacesImpl value, $Res Function(_$InterfacesImpl) then) =
      __$$InterfacesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? name});
}

/// @nodoc
class __$$InterfacesImplCopyWithImpl<$Res>
    extends _$InterfacesCopyWithImpl<$Res, _$InterfacesImpl>
    implements _$$InterfacesImplCopyWith<$Res> {
  __$$InterfacesImplCopyWithImpl(
      _$InterfacesImpl _value, $Res Function(_$InterfacesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? name = freezed,
  }) {
    return _then(_$InterfacesImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InterfacesImpl implements _Interfaces {
  const _$InterfacesImpl({required this.type, required this.name});

  factory _$InterfacesImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterfacesImplFromJson(json);

  @override
  final String? type;
  @override
  final String? name;

  @override
  String toString() {
    return 'Interfaces(type: $type, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterfacesImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterfacesImplCopyWith<_$InterfacesImpl> get copyWith =>
      __$$InterfacesImplCopyWithImpl<_$InterfacesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterfacesImplToJson(
      this,
    );
  }
}

abstract class _Interfaces implements Interfaces {
  const factory _Interfaces(
      {required final String? type,
      required final String? name}) = _$InterfacesImpl;

  factory _Interfaces.fromJson(Map<String, dynamic> json) =
      _$InterfacesImpl.fromJson;

  @override
  String? get type;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$InterfacesImplCopyWith<_$InterfacesImpl> get copyWith =>
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
abstract class _$$LanguageImplCopyWith<$Res>
    implements $LanguageCopyWith<$Res> {
  factory _$$LanguageImplCopyWith(
          _$LanguageImpl value, $Res Function(_$LanguageImpl) then) =
      __$$LanguageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class __$$LanguageImplCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$LanguageImpl>
    implements _$$LanguageImplCopyWith<$Res> {
  __$$LanguageImplCopyWithImpl(
      _$LanguageImpl _value, $Res Function(_$LanguageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$LanguageImpl(
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
class _$LanguageImpl implements _Language {
  const _$LanguageImpl({required this.label, required this.value});

  factory _$LanguageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LanguageImplFromJson(json);

  @override
  final String label;
  @override
  final String value;

  @override
  String toString() {
    return 'Language(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LanguageImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      __$$LanguageImplCopyWithImpl<_$LanguageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LanguageImplToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  const factory _Language(
      {required final String label,
      required final String value}) = _$LanguageImpl;

  factory _Language.fromJson(Map<String, dynamic> json) =
      _$LanguageImpl.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$LanguageImplCopyWith<_$LanguageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
