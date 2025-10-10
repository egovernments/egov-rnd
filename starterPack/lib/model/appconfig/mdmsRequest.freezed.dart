// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mdmsRequest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MdmsRequestModel _$MdmsRequestModelFromJson(Map<String, dynamic> json) {
  return _MdmsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsRequestModel {
  @JsonKey(name: 'MdmsCriteria')
  MdmsCriteriaModel? get mdmsCriteria => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsRequestModelCopyWith<MdmsRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsRequestModelCopyWith<$Res> {
  factory $MdmsRequestModelCopyWith(
          MdmsRequestModel value, $Res Function(MdmsRequestModel) then) =
      _$MdmsRequestModelCopyWithImpl<$Res, MdmsRequestModel>;
  @useResult
  $Res call({@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel? mdmsCriteria});

  $MdmsCriteriaModelCopyWith<$Res>? get mdmsCriteria;
}

/// @nodoc
class _$MdmsRequestModelCopyWithImpl<$Res, $Val extends MdmsRequestModel>
    implements $MdmsRequestModelCopyWith<$Res> {
  _$MdmsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsCriteria = freezed,
  }) {
    return _then(_value.copyWith(
      mdmsCriteria: freezed == mdmsCriteria
          ? _value.mdmsCriteria
          : mdmsCriteria // ignore: cast_nullable_to_non_nullable
              as MdmsCriteriaModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MdmsCriteriaModelCopyWith<$Res>? get mdmsCriteria {
    if (_value.mdmsCriteria == null) {
      return null;
    }

    return $MdmsCriteriaModelCopyWith<$Res>(_value.mdmsCriteria!, (value) {
      return _then(_value.copyWith(mdmsCriteria: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MdmsRequestModelImplCopyWith<$Res>
    implements $MdmsRequestModelCopyWith<$Res> {
  factory _$$MdmsRequestModelImplCopyWith(_$MdmsRequestModelImpl value,
          $Res Function(_$MdmsRequestModelImpl) then) =
      __$$MdmsRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'MdmsCriteria') MdmsCriteriaModel? mdmsCriteria});

  @override
  $MdmsCriteriaModelCopyWith<$Res>? get mdmsCriteria;
}

/// @nodoc
class __$$MdmsRequestModelImplCopyWithImpl<$Res>
    extends _$MdmsRequestModelCopyWithImpl<$Res, _$MdmsRequestModelImpl>
    implements _$$MdmsRequestModelImplCopyWith<$Res> {
  __$$MdmsRequestModelImplCopyWithImpl(_$MdmsRequestModelImpl _value,
      $Res Function(_$MdmsRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mdmsCriteria = freezed,
  }) {
    return _then(_$MdmsRequestModelImpl(
      mdmsCriteria: freezed == mdmsCriteria
          ? _value.mdmsCriteria
          : mdmsCriteria // ignore: cast_nullable_to_non_nullable
              as MdmsCriteriaModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsRequestModelImpl implements _MdmsRequestModel {
  const _$MdmsRequestModelImpl(
      {@JsonKey(name: 'MdmsCriteria') required this.mdmsCriteria});

  factory _$MdmsRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'MdmsCriteria')
  final MdmsCriteriaModel? mdmsCriteria;

  @override
  String toString() {
    return 'MdmsRequestModel(mdmsCriteria: $mdmsCriteria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsRequestModelImpl &&
            (identical(other.mdmsCriteria, mdmsCriteria) ||
                other.mdmsCriteria == mdmsCriteria));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mdmsCriteria);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsRequestModelImplCopyWith<_$MdmsRequestModelImpl> get copyWith =>
      __$$MdmsRequestModelImplCopyWithImpl<_$MdmsRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsRequestModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsRequestModel implements MdmsRequestModel {
  const factory _MdmsRequestModel(
      {@JsonKey(name: 'MdmsCriteria')
      required final MdmsCriteriaModel? mdmsCriteria}) = _$MdmsRequestModelImpl;

  factory _MdmsRequestModel.fromJson(Map<String, dynamic> json) =
      _$MdmsRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'MdmsCriteria')
  MdmsCriteriaModel? get mdmsCriteria;
  @override
  @JsonKey(ignore: true)
  _$$MdmsRequestModelImplCopyWith<_$MdmsRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MdmsCriteriaModel _$MdmsCriteriaModelFromJson(Map<String, dynamic> json) {
  return _MdmsCriteriaModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsCriteriaModel {
  String? get tenantId => throw _privateConstructorUsedError;
  List<MdmsModuleDetailsModel?> get moduleDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsCriteriaModelCopyWith<MdmsCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsCriteriaModelCopyWith<$Res> {
  factory $MdmsCriteriaModelCopyWith(
          MdmsCriteriaModel value, $Res Function(MdmsCriteriaModel) then) =
      _$MdmsCriteriaModelCopyWithImpl<$Res, MdmsCriteriaModel>;
  @useResult
  $Res call({String? tenantId, List<MdmsModuleDetailsModel?> moduleDetails});
}

/// @nodoc
class _$MdmsCriteriaModelCopyWithImpl<$Res, $Val extends MdmsCriteriaModel>
    implements $MdmsCriteriaModelCopyWith<$Res> {
  _$MdmsCriteriaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = freezed,
    Object? moduleDetails = null,
  }) {
    return _then(_value.copyWith(
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleDetails: null == moduleDetails
          ? _value.moduleDetails
          : moduleDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsModuleDetailsModel?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MdmsCriteriaModelImplCopyWith<$Res>
    implements $MdmsCriteriaModelCopyWith<$Res> {
  factory _$$MdmsCriteriaModelImplCopyWith(_$MdmsCriteriaModelImpl value,
          $Res Function(_$MdmsCriteriaModelImpl) then) =
      __$$MdmsCriteriaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tenantId, List<MdmsModuleDetailsModel?> moduleDetails});
}

/// @nodoc
class __$$MdmsCriteriaModelImplCopyWithImpl<$Res>
    extends _$MdmsCriteriaModelCopyWithImpl<$Res, _$MdmsCriteriaModelImpl>
    implements _$$MdmsCriteriaModelImplCopyWith<$Res> {
  __$$MdmsCriteriaModelImplCopyWithImpl(_$MdmsCriteriaModelImpl _value,
      $Res Function(_$MdmsCriteriaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenantId = freezed,
    Object? moduleDetails = null,
  }) {
    return _then(_$MdmsCriteriaModelImpl(
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleDetails: null == moduleDetails
          ? _value._moduleDetails
          : moduleDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsModuleDetailsModel?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsCriteriaModelImpl implements _MdmsCriteriaModel {
  const _$MdmsCriteriaModelImpl(
      {required this.tenantId,
      required final List<MdmsModuleDetailsModel?> moduleDetails})
      : _moduleDetails = moduleDetails;

  factory _$MdmsCriteriaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsCriteriaModelImplFromJson(json);

  @override
  final String? tenantId;
  final List<MdmsModuleDetailsModel?> _moduleDetails;
  @override
  List<MdmsModuleDetailsModel?> get moduleDetails {
    if (_moduleDetails is EqualUnmodifiableListView) return _moduleDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleDetails);
  }

  @override
  String toString() {
    return 'MdmsCriteriaModel(tenantId: $tenantId, moduleDetails: $moduleDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsCriteriaModelImpl &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            const DeepCollectionEquality()
                .equals(other._moduleDetails, _moduleDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tenantId,
      const DeepCollectionEquality().hash(_moduleDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsCriteriaModelImplCopyWith<_$MdmsCriteriaModelImpl> get copyWith =>
      __$$MdmsCriteriaModelImplCopyWithImpl<_$MdmsCriteriaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsCriteriaModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsCriteriaModel implements MdmsCriteriaModel {
  const factory _MdmsCriteriaModel(
          {required final String? tenantId,
          required final List<MdmsModuleDetailsModel?> moduleDetails}) =
      _$MdmsCriteriaModelImpl;

  factory _MdmsCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$MdmsCriteriaModelImpl.fromJson;

  @override
  String? get tenantId;
  @override
  List<MdmsModuleDetailsModel?> get moduleDetails;
  @override
  @JsonKey(ignore: true)
  _$$MdmsCriteriaModelImplCopyWith<_$MdmsCriteriaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MdmsModuleDetailsModel _$MdmsModuleDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _MdmsModuleDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsModuleDetailsModel {
  String? get moduleName => throw _privateConstructorUsedError;
  List<MdmsMasterDetailsModel>? get masterDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsModuleDetailsModelCopyWith<MdmsModuleDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsModuleDetailsModelCopyWith<$Res> {
  factory $MdmsModuleDetailsModelCopyWith(MdmsModuleDetailsModel value,
          $Res Function(MdmsModuleDetailsModel) then) =
      _$MdmsModuleDetailsModelCopyWithImpl<$Res, MdmsModuleDetailsModel>;
  @useResult
  $Res call({String? moduleName, List<MdmsMasterDetailsModel>? masterDetails});
}

/// @nodoc
class _$MdmsModuleDetailsModelCopyWithImpl<$Res,
        $Val extends MdmsModuleDetailsModel>
    implements $MdmsModuleDetailsModelCopyWith<$Res> {
  _$MdmsModuleDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = freezed,
    Object? masterDetails = freezed,
  }) {
    return _then(_value.copyWith(
      moduleName: freezed == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String?,
      masterDetails: freezed == masterDetails
          ? _value.masterDetails
          : masterDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsMasterDetailsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MdmsModuleDetailsModelImplCopyWith<$Res>
    implements $MdmsModuleDetailsModelCopyWith<$Res> {
  factory _$$MdmsModuleDetailsModelImplCopyWith(
          _$MdmsModuleDetailsModelImpl value,
          $Res Function(_$MdmsModuleDetailsModelImpl) then) =
      __$$MdmsModuleDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? moduleName, List<MdmsMasterDetailsModel>? masterDetails});
}

/// @nodoc
class __$$MdmsModuleDetailsModelImplCopyWithImpl<$Res>
    extends _$MdmsModuleDetailsModelCopyWithImpl<$Res,
        _$MdmsModuleDetailsModelImpl>
    implements _$$MdmsModuleDetailsModelImplCopyWith<$Res> {
  __$$MdmsModuleDetailsModelImplCopyWithImpl(
      _$MdmsModuleDetailsModelImpl _value,
      $Res Function(_$MdmsModuleDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moduleName = freezed,
    Object? masterDetails = freezed,
  }) {
    return _then(_$MdmsModuleDetailsModelImpl(
      moduleName: freezed == moduleName
          ? _value.moduleName
          : moduleName // ignore: cast_nullable_to_non_nullable
              as String?,
      masterDetails: freezed == masterDetails
          ? _value._masterDetails
          : masterDetails // ignore: cast_nullable_to_non_nullable
              as List<MdmsMasterDetailsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsModuleDetailsModelImpl implements _MdmsModuleDetailsModel {
  const _$MdmsModuleDetailsModelImpl(
      {required this.moduleName,
      required final List<MdmsMasterDetailsModel>? masterDetails})
      : _masterDetails = masterDetails;

  factory _$MdmsModuleDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsModuleDetailsModelImplFromJson(json);

  @override
  final String? moduleName;
  final List<MdmsMasterDetailsModel>? _masterDetails;
  @override
  List<MdmsMasterDetailsModel>? get masterDetails {
    final value = _masterDetails;
    if (value == null) return null;
    if (_masterDetails is EqualUnmodifiableListView) return _masterDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MdmsModuleDetailsModel(moduleName: $moduleName, masterDetails: $masterDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsModuleDetailsModelImpl &&
            (identical(other.moduleName, moduleName) ||
                other.moduleName == moduleName) &&
            const DeepCollectionEquality()
                .equals(other._masterDetails, _masterDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, moduleName,
      const DeepCollectionEquality().hash(_masterDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsModuleDetailsModelImplCopyWith<_$MdmsModuleDetailsModelImpl>
      get copyWith => __$$MdmsModuleDetailsModelImplCopyWithImpl<
          _$MdmsModuleDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsModuleDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsModuleDetailsModel implements MdmsModuleDetailsModel {
  const factory _MdmsModuleDetailsModel(
          {required final String? moduleName,
          required final List<MdmsMasterDetailsModel>? masterDetails}) =
      _$MdmsModuleDetailsModelImpl;

  factory _MdmsModuleDetailsModel.fromJson(Map<String, dynamic> json) =
      _$MdmsModuleDetailsModelImpl.fromJson;

  @override
  String? get moduleName;
  @override
  List<MdmsMasterDetailsModel>? get masterDetails;
  @override
  @JsonKey(ignore: true)
  _$$MdmsModuleDetailsModelImplCopyWith<_$MdmsModuleDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MdmsMasterDetailsModel _$MdmsMasterDetailsModelFromJson(
    Map<String, dynamic> json) {
  return _MdmsMasterDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$MdmsMasterDetailsModel {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MdmsMasterDetailsModelCopyWith<MdmsMasterDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MdmsMasterDetailsModelCopyWith<$Res> {
  factory $MdmsMasterDetailsModelCopyWith(MdmsMasterDetailsModel value,
          $Res Function(MdmsMasterDetailsModel) then) =
      _$MdmsMasterDetailsModelCopyWithImpl<$Res, MdmsMasterDetailsModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$MdmsMasterDetailsModelCopyWithImpl<$Res,
        $Val extends MdmsMasterDetailsModel>
    implements $MdmsMasterDetailsModelCopyWith<$Res> {
  _$MdmsMasterDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MdmsMasterDetailsModelImplCopyWith<$Res>
    implements $MdmsMasterDetailsModelCopyWith<$Res> {
  factory _$$MdmsMasterDetailsModelImplCopyWith(
          _$MdmsMasterDetailsModelImpl value,
          $Res Function(_$MdmsMasterDetailsModelImpl) then) =
      __$$MdmsMasterDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$MdmsMasterDetailsModelImplCopyWithImpl<$Res>
    extends _$MdmsMasterDetailsModelCopyWithImpl<$Res,
        _$MdmsMasterDetailsModelImpl>
    implements _$$MdmsMasterDetailsModelImplCopyWith<$Res> {
  __$$MdmsMasterDetailsModelImplCopyWithImpl(
      _$MdmsMasterDetailsModelImpl _value,
      $Res Function(_$MdmsMasterDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$MdmsMasterDetailsModelImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MdmsMasterDetailsModelImpl implements _MdmsMasterDetailsModel {
  const _$MdmsMasterDetailsModelImpl(this.name);

  factory _$MdmsMasterDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MdmsMasterDetailsModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'MdmsMasterDetailsModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MdmsMasterDetailsModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MdmsMasterDetailsModelImplCopyWith<_$MdmsMasterDetailsModelImpl>
      get copyWith => __$$MdmsMasterDetailsModelImplCopyWithImpl<
          _$MdmsMasterDetailsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MdmsMasterDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _MdmsMasterDetailsModel implements MdmsMasterDetailsModel {
  const factory _MdmsMasterDetailsModel(final String name) =
      _$MdmsMasterDetailsModelImpl;

  factory _MdmsMasterDetailsModel.fromJson(Map<String, dynamic> json) =
      _$MdmsMasterDetailsModelImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$MdmsMasterDetailsModelImplCopyWith<_$MdmsMasterDetailsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
