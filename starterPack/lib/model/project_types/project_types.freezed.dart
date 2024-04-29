// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectTypePrimaryWrapper _$ProjectTypePrimaryWrapperFromJson(
    Map<String, dynamic> json) {
  return _ProjectTypePrimaryWrapper.fromJson(json);
}

/// @nodoc
mixin _$ProjectTypePrimaryWrapper {
  @JsonKey(name: "HCM-PROJECT-TYPES")
  ProjectTypesSecondaryModel? get projectTypeWrapper =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypePrimaryWrapperCopyWith<ProjectTypePrimaryWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypePrimaryWrapperCopyWith<$Res> {
  factory $ProjectTypePrimaryWrapperCopyWith(ProjectTypePrimaryWrapper value,
          $Res Function(ProjectTypePrimaryWrapper) then) =
      _$ProjectTypePrimaryWrapperCopyWithImpl<$Res, ProjectTypePrimaryWrapper>;
  @useResult
  $Res call(
      {@JsonKey(name: "HCM-PROJECT-TYPES")
      ProjectTypesSecondaryModel? projectTypeWrapper});

  $ProjectTypesSecondaryModelCopyWith<$Res>? get projectTypeWrapper;
}

/// @nodoc
class _$ProjectTypePrimaryWrapperCopyWithImpl<$Res,
        $Val extends ProjectTypePrimaryWrapper>
    implements $ProjectTypePrimaryWrapperCopyWith<$Res> {
  _$ProjectTypePrimaryWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypeWrapper = freezed,
  }) {
    return _then(_value.copyWith(
      projectTypeWrapper: freezed == projectTypeWrapper
          ? _value.projectTypeWrapper
          : projectTypeWrapper // ignore: cast_nullable_to_non_nullable
              as ProjectTypesSecondaryModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectTypesSecondaryModelCopyWith<$Res>? get projectTypeWrapper {
    if (_value.projectTypeWrapper == null) {
      return null;
    }

    return $ProjectTypesSecondaryModelCopyWith<$Res>(_value.projectTypeWrapper!,
        (value) {
      return _then(_value.copyWith(projectTypeWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectTypePrimaryWrapperImplCopyWith<$Res>
    implements $ProjectTypePrimaryWrapperCopyWith<$Res> {
  factory _$$ProjectTypePrimaryWrapperImplCopyWith(
          _$ProjectTypePrimaryWrapperImpl value,
          $Res Function(_$ProjectTypePrimaryWrapperImpl) then) =
      __$$ProjectTypePrimaryWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "HCM-PROJECT-TYPES")
      ProjectTypesSecondaryModel? projectTypeWrapper});

  @override
  $ProjectTypesSecondaryModelCopyWith<$Res>? get projectTypeWrapper;
}

/// @nodoc
class __$$ProjectTypePrimaryWrapperImplCopyWithImpl<$Res>
    extends _$ProjectTypePrimaryWrapperCopyWithImpl<$Res,
        _$ProjectTypePrimaryWrapperImpl>
    implements _$$ProjectTypePrimaryWrapperImplCopyWith<$Res> {
  __$$ProjectTypePrimaryWrapperImplCopyWithImpl(
      _$ProjectTypePrimaryWrapperImpl _value,
      $Res Function(_$ProjectTypePrimaryWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypeWrapper = freezed,
  }) {
    return _then(_$ProjectTypePrimaryWrapperImpl(
      projectTypeWrapper: freezed == projectTypeWrapper
          ? _value.projectTypeWrapper
          : projectTypeWrapper // ignore: cast_nullable_to_non_nullable
              as ProjectTypesSecondaryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectTypePrimaryWrapperImpl implements _ProjectTypePrimaryWrapper {
  const _$ProjectTypePrimaryWrapperImpl(
      {@JsonKey(name: "HCM-PROJECT-TYPES") this.projectTypeWrapper});

  factory _$ProjectTypePrimaryWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectTypePrimaryWrapperImplFromJson(json);

  @override
  @JsonKey(name: "HCM-PROJECT-TYPES")
  final ProjectTypesSecondaryModel? projectTypeWrapper;

  @override
  String toString() {
    return 'ProjectTypePrimaryWrapper(projectTypeWrapper: $projectTypeWrapper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTypePrimaryWrapperImpl &&
            (identical(other.projectTypeWrapper, projectTypeWrapper) ||
                other.projectTypeWrapper == projectTypeWrapper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, projectTypeWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTypePrimaryWrapperImplCopyWith<_$ProjectTypePrimaryWrapperImpl>
      get copyWith => __$$ProjectTypePrimaryWrapperImplCopyWithImpl<
          _$ProjectTypePrimaryWrapperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTypePrimaryWrapperImplToJson(
      this,
    );
  }
}

abstract class _ProjectTypePrimaryWrapper implements ProjectTypePrimaryWrapper {
  const factory _ProjectTypePrimaryWrapper(
          {@JsonKey(name: "HCM-PROJECT-TYPES")
          final ProjectTypesSecondaryModel? projectTypeWrapper}) =
      _$ProjectTypePrimaryWrapperImpl;

  factory _ProjectTypePrimaryWrapper.fromJson(Map<String, dynamic> json) =
      _$ProjectTypePrimaryWrapperImpl.fromJson;

  @override
  @JsonKey(name: "HCM-PROJECT-TYPES")
  ProjectTypesSecondaryModel? get projectTypeWrapper;
  @override
  @JsonKey(ignore: true)
  _$$ProjectTypePrimaryWrapperImplCopyWith<_$ProjectTypePrimaryWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectTypesSecondaryModel _$ProjectTypesSecondaryModelFromJson(
    Map<String, dynamic> json) {
  return _ProjectTypesSecondaryModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectTypesSecondaryModel {
  @JsonKey(name: 'projectTypes')
  List<ProjectType> get projectTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypesSecondaryModelCopyWith<ProjectTypesSecondaryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypesSecondaryModelCopyWith<$Res> {
  factory $ProjectTypesSecondaryModelCopyWith(ProjectTypesSecondaryModel value,
          $Res Function(ProjectTypesSecondaryModel) then) =
      _$ProjectTypesSecondaryModelCopyWithImpl<$Res,
          ProjectTypesSecondaryModel>;
  @useResult
  $Res call({@JsonKey(name: 'projectTypes') List<ProjectType> projectTypes});
}

/// @nodoc
class _$ProjectTypesSecondaryModelCopyWithImpl<$Res,
        $Val extends ProjectTypesSecondaryModel>
    implements $ProjectTypesSecondaryModelCopyWith<$Res> {
  _$ProjectTypesSecondaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypes = null,
  }) {
    return _then(_value.copyWith(
      projectTypes: null == projectTypes
          ? _value.projectTypes
          : projectTypes // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectTypesSecondaryModelImplCopyWith<$Res>
    implements $ProjectTypesSecondaryModelCopyWith<$Res> {
  factory _$$ProjectTypesSecondaryModelImplCopyWith(
          _$ProjectTypesSecondaryModelImpl value,
          $Res Function(_$ProjectTypesSecondaryModelImpl) then) =
      __$$ProjectTypesSecondaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'projectTypes') List<ProjectType> projectTypes});
}

/// @nodoc
class __$$ProjectTypesSecondaryModelImplCopyWithImpl<$Res>
    extends _$ProjectTypesSecondaryModelCopyWithImpl<$Res,
        _$ProjectTypesSecondaryModelImpl>
    implements _$$ProjectTypesSecondaryModelImplCopyWith<$Res> {
  __$$ProjectTypesSecondaryModelImplCopyWithImpl(
      _$ProjectTypesSecondaryModelImpl _value,
      $Res Function(_$ProjectTypesSecondaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectTypes = null,
  }) {
    return _then(_$ProjectTypesSecondaryModelImpl(
      projectTypes: null == projectTypes
          ? _value._projectTypes
          : projectTypes // ignore: cast_nullable_to_non_nullable
              as List<ProjectType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectTypesSecondaryModelImpl implements _ProjectTypesSecondaryModel {
  const _$ProjectTypesSecondaryModelImpl(
      {@JsonKey(name: 'projectTypes')
      final List<ProjectType> projectTypes = const []})
      : _projectTypes = projectTypes;

  factory _$ProjectTypesSecondaryModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProjectTypesSecondaryModelImplFromJson(json);

  final List<ProjectType> _projectTypes;
  @override
  @JsonKey(name: 'projectTypes')
  List<ProjectType> get projectTypes {
    if (_projectTypes is EqualUnmodifiableListView) return _projectTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectTypes);
  }

  @override
  String toString() {
    return 'ProjectTypesSecondaryModel(projectTypes: $projectTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTypesSecondaryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._projectTypes, _projectTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTypesSecondaryModelImplCopyWith<_$ProjectTypesSecondaryModelImpl>
      get copyWith => __$$ProjectTypesSecondaryModelImplCopyWithImpl<
          _$ProjectTypesSecondaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTypesSecondaryModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectTypesSecondaryModel
    implements ProjectTypesSecondaryModel {
  const factory _ProjectTypesSecondaryModel(
      {@JsonKey(name: 'projectTypes')
      final List<ProjectType> projectTypes}) = _$ProjectTypesSecondaryModelImpl;

  factory _ProjectTypesSecondaryModel.fromJson(Map<String, dynamic> json) =
      _$ProjectTypesSecondaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'projectTypes')
  List<ProjectType> get projectTypes;
  @override
  @JsonKey(ignore: true)
  _$$ProjectTypesSecondaryModelImplCopyWith<_$ProjectTypesSecondaryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectType _$ProjectTypeFromJson(Map<String, dynamic> json) {
  return _ProjectType.fromJson(json);
}

/// @nodoc
mixin _$ProjectType {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;
  String get beneficiaryType => throw _privateConstructorUsedError;
  String? get observationStrategy => throw _privateConstructorUsedError;
  List<Cycle>? get cycles => throw _privateConstructorUsedError;
  List<ProductVariantsModel>? get resources =>
      throw _privateConstructorUsedError;
  int? get validMinAge => throw _privateConstructorUsedError;
  int? get validMaxAge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTypeCopyWith<ProjectType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTypeCopyWith<$Res> {
  factory $ProjectTypeCopyWith(
          ProjectType value, $Res Function(ProjectType) then) =
      _$ProjectTypeCopyWithImpl<$Res, ProjectType>;
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      String group,
      String beneficiaryType,
      String? observationStrategy,
      List<Cycle>? cycles,
      List<ProductVariantsModel>? resources,
      int? validMinAge,
      int? validMaxAge});
}

/// @nodoc
class _$ProjectTypeCopyWithImpl<$Res, $Val extends ProjectType>
    implements $ProjectTypeCopyWith<$Res> {
  _$ProjectTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? group = null,
    Object? beneficiaryType = null,
    Object? observationStrategy = freezed,
    Object? cycles = freezed,
    Object? resources = freezed,
    Object? validMinAge = freezed,
    Object? validMaxAge = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryType: null == beneficiaryType
          ? _value.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String,
      observationStrategy: freezed == observationStrategy
          ? _value.observationStrategy
          : observationStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      cycles: freezed == cycles
          ? _value.cycles
          : cycles // ignore: cast_nullable_to_non_nullable
              as List<Cycle>?,
      resources: freezed == resources
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
      validMinAge: freezed == validMinAge
          ? _value.validMinAge
          : validMinAge // ignore: cast_nullable_to_non_nullable
              as int?,
      validMaxAge: freezed == validMaxAge
          ? _value.validMaxAge
          : validMaxAge // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectTypeImplCopyWith<$Res>
    implements $ProjectTypeCopyWith<$Res> {
  factory _$$ProjectTypeImplCopyWith(
          _$ProjectTypeImpl value, $Res Function(_$ProjectTypeImpl) then) =
      __$$ProjectTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String name,
      String group,
      String beneficiaryType,
      String? observationStrategy,
      List<Cycle>? cycles,
      List<ProductVariantsModel>? resources,
      int? validMinAge,
      int? validMaxAge});
}

/// @nodoc
class __$$ProjectTypeImplCopyWithImpl<$Res>
    extends _$ProjectTypeCopyWithImpl<$Res, _$ProjectTypeImpl>
    implements _$$ProjectTypeImplCopyWith<$Res> {
  __$$ProjectTypeImplCopyWithImpl(
      _$ProjectTypeImpl _value, $Res Function(_$ProjectTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? group = null,
    Object? beneficiaryType = null,
    Object? observationStrategy = freezed,
    Object? cycles = freezed,
    Object? resources = freezed,
    Object? validMinAge = freezed,
    Object? validMaxAge = freezed,
  }) {
    return _then(_$ProjectTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      beneficiaryType: null == beneficiaryType
          ? _value.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String,
      observationStrategy: freezed == observationStrategy
          ? _value.observationStrategy
          : observationStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      cycles: freezed == cycles
          ? _value._cycles
          : cycles // ignore: cast_nullable_to_non_nullable
              as List<Cycle>?,
      resources: freezed == resources
          ? _value._resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
      validMinAge: freezed == validMinAge
          ? _value.validMinAge
          : validMinAge // ignore: cast_nullable_to_non_nullable
              as int?,
      validMaxAge: freezed == validMaxAge
          ? _value.validMaxAge
          : validMaxAge // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectTypeImpl implements _ProjectType {
  const _$ProjectTypeImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.group,
      required this.beneficiaryType,
      this.observationStrategy,
      final List<Cycle>? cycles,
      final List<ProductVariantsModel>? resources,
      this.validMinAge,
      this.validMaxAge})
      : _cycles = cycles,
        _resources = resources;

  factory _$ProjectTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectTypeImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String group;
  @override
  final String beneficiaryType;
  @override
  final String? observationStrategy;
  final List<Cycle>? _cycles;
  @override
  List<Cycle>? get cycles {
    final value = _cycles;
    if (value == null) return null;
    if (_cycles is EqualUnmodifiableListView) return _cycles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductVariantsModel>? _resources;
  @override
  List<ProductVariantsModel>? get resources {
    final value = _resources;
    if (value == null) return null;
    if (_resources is EqualUnmodifiableListView) return _resources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? validMinAge;
  @override
  final int? validMaxAge;

  @override
  String toString() {
    return 'ProjectType(id: $id, code: $code, name: $name, group: $group, beneficiaryType: $beneficiaryType, observationStrategy: $observationStrategy, cycles: $cycles, resources: $resources, validMinAge: $validMinAge, validMaxAge: $validMaxAge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.beneficiaryType, beneficiaryType) ||
                other.beneficiaryType == beneficiaryType) &&
            (identical(other.observationStrategy, observationStrategy) ||
                other.observationStrategy == observationStrategy) &&
            const DeepCollectionEquality().equals(other._cycles, _cycles) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources) &&
            (identical(other.validMinAge, validMinAge) ||
                other.validMinAge == validMinAge) &&
            (identical(other.validMaxAge, validMaxAge) ||
                other.validMaxAge == validMaxAge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      name,
      group,
      beneficiaryType,
      observationStrategy,
      const DeepCollectionEquality().hash(_cycles),
      const DeepCollectionEquality().hash(_resources),
      validMinAge,
      validMaxAge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTypeImplCopyWith<_$ProjectTypeImpl> get copyWith =>
      __$$ProjectTypeImplCopyWithImpl<_$ProjectTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTypeImplToJson(
      this,
    );
  }
}

abstract class _ProjectType implements ProjectType {
  const factory _ProjectType(
      {required final String id,
      required final String code,
      required final String name,
      required final String group,
      required final String beneficiaryType,
      final String? observationStrategy,
      final List<Cycle>? cycles,
      final List<ProductVariantsModel>? resources,
      final int? validMinAge,
      final int? validMaxAge}) = _$ProjectTypeImpl;

  factory _ProjectType.fromJson(Map<String, dynamic> json) =
      _$ProjectTypeImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get name;
  @override
  String get group;
  @override
  String get beneficiaryType;
  @override
  String? get observationStrategy;
  @override
  List<Cycle>? get cycles;
  @override
  List<ProductVariantsModel>? get resources;
  @override
  int? get validMinAge;
  @override
  int? get validMaxAge;
  @override
  @JsonKey(ignore: true)
  _$$ProjectTypeImplCopyWith<_$ProjectTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Cycle _$CycleFromJson(Map<String, dynamic> json) {
  return _Cycle.fromJson(json);
}

/// @nodoc
mixin _$Cycle {
  String? get mandatoryWaitSinceLastCycleInDays =>
      throw _privateConstructorUsedError;
  int? get startDate => throw _privateConstructorUsedError;
  int? get endDate => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CycleCopyWith<Cycle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CycleCopyWith<$Res> {
  factory $CycleCopyWith(Cycle value, $Res Function(Cycle) then) =
      _$CycleCopyWithImpl<$Res, Cycle>;
  @useResult
  $Res call(
      {String? mandatoryWaitSinceLastCycleInDays,
      int? startDate,
      int? endDate,
      int id,
      @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries});
}

/// @nodoc
class _$CycleCopyWithImpl<$Res, $Val extends Cycle>
    implements $CycleCopyWith<$Res> {
  _$CycleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastCycleInDays = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? id = null,
    Object? deliveries = freezed,
  }) {
    return _then(_value.copyWith(
      mandatoryWaitSinceLastCycleInDays: freezed ==
              mandatoryWaitSinceLastCycleInDays
          ? _value.mandatoryWaitSinceLastCycleInDays
          : mandatoryWaitSinceLastCycleInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deliveries: freezed == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CycleImplCopyWith<$Res> implements $CycleCopyWith<$Res> {
  factory _$$CycleImplCopyWith(
          _$CycleImpl value, $Res Function(_$CycleImpl) then) =
      __$$CycleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? mandatoryWaitSinceLastCycleInDays,
      int? startDate,
      int? endDate,
      int id,
      @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries});
}

/// @nodoc
class __$$CycleImplCopyWithImpl<$Res>
    extends _$CycleCopyWithImpl<$Res, _$CycleImpl>
    implements _$$CycleImplCopyWith<$Res> {
  __$$CycleImplCopyWithImpl(
      _$CycleImpl _value, $Res Function(_$CycleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mandatoryWaitSinceLastCycleInDays = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? id = null,
    Object? deliveries = freezed,
  }) {
    return _then(_$CycleImpl(
      mandatoryWaitSinceLastCycleInDays: freezed ==
              mandatoryWaitSinceLastCycleInDays
          ? _value.mandatoryWaitSinceLastCycleInDays
          : mandatoryWaitSinceLastCycleInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      deliveries: freezed == deliveries
          ? _value._deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<DeliveryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CycleImpl implements _Cycle {
  const _$CycleImpl(
      {this.mandatoryWaitSinceLastCycleInDays,
      this.startDate,
      this.endDate,
      this.id = 0,
      @JsonKey(name: 'deliveries') final List<DeliveryModel>? deliveries})
      : _deliveries = deliveries;

  factory _$CycleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CycleImplFromJson(json);

  @override
  final String? mandatoryWaitSinceLastCycleInDays;
  @override
  final int? startDate;
  @override
  final int? endDate;
  @override
  @JsonKey()
  final int id;
  final List<DeliveryModel>? _deliveries;
  @override
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries {
    final value = _deliveries;
    if (value == null) return null;
    if (_deliveries is EqualUnmodifiableListView) return _deliveries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Cycle(mandatoryWaitSinceLastCycleInDays: $mandatoryWaitSinceLastCycleInDays, startDate: $startDate, endDate: $endDate, id: $id, deliveries: $deliveries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CycleImpl &&
            (identical(other.mandatoryWaitSinceLastCycleInDays,
                    mandatoryWaitSinceLastCycleInDays) ||
                other.mandatoryWaitSinceLastCycleInDays ==
                    mandatoryWaitSinceLastCycleInDays) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._deliveries, _deliveries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mandatoryWaitSinceLastCycleInDays,
      startDate,
      endDate,
      id,
      const DeepCollectionEquality().hash(_deliveries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CycleImplCopyWith<_$CycleImpl> get copyWith =>
      __$$CycleImplCopyWithImpl<_$CycleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CycleImplToJson(
      this,
    );
  }
}

abstract class _Cycle implements Cycle {
  const factory _Cycle(
          {final String? mandatoryWaitSinceLastCycleInDays,
          final int? startDate,
          final int? endDate,
          final int id,
          @JsonKey(name: 'deliveries') final List<DeliveryModel>? deliveries}) =
      _$CycleImpl;

  factory _Cycle.fromJson(Map<String, dynamic> json) = _$CycleImpl.fromJson;

  @override
  String? get mandatoryWaitSinceLastCycleInDays;
  @override
  int? get startDate;
  @override
  int? get endDate;
  @override
  int get id;
  @override
  @JsonKey(name: 'deliveries')
  List<DeliveryModel>? get deliveries;
  @override
  @JsonKey(ignore: true)
  _$$CycleImplCopyWith<_$CycleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryModel _$DeliveryModelFromJson(Map<String, dynamic> json) {
  return _DeliveryModel.fromJson(json);
}

/// @nodoc
mixin _$DeliveryModel {
  List<DoseCriteriaModel>? get doseCriteria =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  String? get mandatoryWaitSinceLastDeliveryInDays =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deliveryStrategy')
  String? get deliveryStrategy => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryModelCopyWith<DeliveryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryModelCopyWith<$Res> {
  factory $DeliveryModelCopyWith(
          DeliveryModel value, $Res Function(DeliveryModel) then) =
      _$DeliveryModelCopyWithImpl<$Res, DeliveryModel>;
  @useResult
  $Res call(
      {List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
      String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy') String? deliveryStrategy,
      int id});
}

/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res, $Val extends DeliveryModel>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doseCriteria = freezed,
    Object? mandatoryWaitSinceLastDeliveryInDays = freezed,
    Object? deliveryStrategy = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      doseCriteria: freezed == doseCriteria
          ? _value.doseCriteria
          : doseCriteria // ignore: cast_nullable_to_non_nullable
              as List<DoseCriteriaModel>?,
      mandatoryWaitSinceLastDeliveryInDays: freezed ==
              mandatoryWaitSinceLastDeliveryInDays
          ? _value.mandatoryWaitSinceLastDeliveryInDays
          : mandatoryWaitSinceLastDeliveryInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStrategy: freezed == deliveryStrategy
          ? _value.deliveryStrategy
          : deliveryStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryModelImplCopyWith<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  factory _$$DeliveryModelImplCopyWith(
          _$DeliveryModelImpl value, $Res Function(_$DeliveryModelImpl) then) =
      __$$DeliveryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
      String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy') String? deliveryStrategy,
      int id});
}

/// @nodoc
class __$$DeliveryModelImplCopyWithImpl<$Res>
    extends _$DeliveryModelCopyWithImpl<$Res, _$DeliveryModelImpl>
    implements _$$DeliveryModelImplCopyWith<$Res> {
  __$$DeliveryModelImplCopyWithImpl(
      _$DeliveryModelImpl _value, $Res Function(_$DeliveryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doseCriteria = freezed,
    Object? mandatoryWaitSinceLastDeliveryInDays = freezed,
    Object? deliveryStrategy = freezed,
    Object? id = null,
  }) {
    return _then(_$DeliveryModelImpl(
      doseCriteria: freezed == doseCriteria
          ? _value._doseCriteria
          : doseCriteria // ignore: cast_nullable_to_non_nullable
              as List<DoseCriteriaModel>?,
      mandatoryWaitSinceLastDeliveryInDays: freezed ==
              mandatoryWaitSinceLastDeliveryInDays
          ? _value.mandatoryWaitSinceLastDeliveryInDays
          : mandatoryWaitSinceLastDeliveryInDays // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStrategy: freezed == deliveryStrategy
          ? _value.deliveryStrategy
          : deliveryStrategy // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryModelImpl implements _DeliveryModel {
  const _$DeliveryModelImpl(
      {final List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
      this.mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy') this.deliveryStrategy,
      this.id = 0})
      : _doseCriteria = doseCriteria;

  factory _$DeliveryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryModelImplFromJson(json);

  final List<DoseCriteriaModel>? _doseCriteria;
  @override
  List<DoseCriteriaModel>? get doseCriteria {
    final value = _doseCriteria;
    if (value == null) return null;
    if (_doseCriteria is EqualUnmodifiableListView) return _doseCriteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  final String? mandatoryWaitSinceLastDeliveryInDays;
  @override
  @JsonKey(name: 'deliveryStrategy')
  final String? deliveryStrategy;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'DeliveryModel(doseCriteria: $doseCriteria, mandatoryWaitSinceLastDeliveryInDays: $mandatoryWaitSinceLastDeliveryInDays, deliveryStrategy: $deliveryStrategy, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryModelImpl &&
            const DeepCollectionEquality()
                .equals(other._doseCriteria, _doseCriteria) &&
            (identical(other.mandatoryWaitSinceLastDeliveryInDays,
                    mandatoryWaitSinceLastDeliveryInDays) ||
                other.mandatoryWaitSinceLastDeliveryInDays ==
                    mandatoryWaitSinceLastDeliveryInDays) &&
            (identical(other.deliveryStrategy, deliveryStrategy) ||
                other.deliveryStrategy == deliveryStrategy) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_doseCriteria),
      mandatoryWaitSinceLastDeliveryInDays,
      deliveryStrategy,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryModelImplCopyWith<_$DeliveryModelImpl> get copyWith =>
      __$$DeliveryModelImplCopyWithImpl<_$DeliveryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryModelImplToJson(
      this,
    );
  }
}

abstract class _DeliveryModel implements DeliveryModel {
  const factory _DeliveryModel(
      {final List<DoseCriteriaModel>? doseCriteria,
      @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
      final String? mandatoryWaitSinceLastDeliveryInDays,
      @JsonKey(name: 'deliveryStrategy') final String? deliveryStrategy,
      final int id}) = _$DeliveryModelImpl;

  factory _DeliveryModel.fromJson(Map<String, dynamic> json) =
      _$DeliveryModelImpl.fromJson;

  @override
  List<DoseCriteriaModel>? get doseCriteria;
  @override
  @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
  String? get mandatoryWaitSinceLastDeliveryInDays;
  @override
  @JsonKey(name: 'deliveryStrategy')
  String? get deliveryStrategy;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryModelImplCopyWith<_$DeliveryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoseCriteriaModel _$DoseCriteriaModelFromJson(Map<String, dynamic> json) {
  return _DoseCriteriaModel.fromJson(json);
}

/// @nodoc
mixin _$DoseCriteriaModel {
  @JsonKey(name: 'condition')
  String? get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductVariants')
  List<ProductVariantsModel>? get productVariants =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoseCriteriaModelCopyWith<DoseCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoseCriteriaModelCopyWith<$Res> {
  factory $DoseCriteriaModelCopyWith(
          DoseCriteriaModel value, $Res Function(DoseCriteriaModel) then) =
      _$DoseCriteriaModelCopyWithImpl<$Res, DoseCriteriaModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'condition') String? condition,
      @JsonKey(name: 'ProductVariants')
      List<ProductVariantsModel>? productVariants});
}

/// @nodoc
class _$DoseCriteriaModelCopyWithImpl<$Res, $Val extends DoseCriteriaModel>
    implements $DoseCriteriaModelCopyWith<$Res> {
  _$DoseCriteriaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? productVariants = freezed,
  }) {
    return _then(_value.copyWith(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      productVariants: freezed == productVariants
          ? _value.productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoseCriteriaModelImplCopyWith<$Res>
    implements $DoseCriteriaModelCopyWith<$Res> {
  factory _$$DoseCriteriaModelImplCopyWith(_$DoseCriteriaModelImpl value,
          $Res Function(_$DoseCriteriaModelImpl) then) =
      __$$DoseCriteriaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'condition') String? condition,
      @JsonKey(name: 'ProductVariants')
      List<ProductVariantsModel>? productVariants});
}

/// @nodoc
class __$$DoseCriteriaModelImplCopyWithImpl<$Res>
    extends _$DoseCriteriaModelCopyWithImpl<$Res, _$DoseCriteriaModelImpl>
    implements _$$DoseCriteriaModelImplCopyWith<$Res> {
  __$$DoseCriteriaModelImplCopyWithImpl(_$DoseCriteriaModelImpl _value,
      $Res Function(_$DoseCriteriaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? productVariants = freezed,
  }) {
    return _then(_$DoseCriteriaModelImpl(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String?,
      productVariants: freezed == productVariants
          ? _value._productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantsModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DoseCriteriaModelImpl implements _DoseCriteriaModel {
  const _$DoseCriteriaModelImpl(
      {@JsonKey(name: 'condition') this.condition,
      @JsonKey(name: 'ProductVariants')
      final List<ProductVariantsModel>? productVariants})
      : _productVariants = productVariants;

  factory _$DoseCriteriaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoseCriteriaModelImplFromJson(json);

  @override
  @JsonKey(name: 'condition')
  final String? condition;
  final List<ProductVariantsModel>? _productVariants;
  @override
  @JsonKey(name: 'ProductVariants')
  List<ProductVariantsModel>? get productVariants {
    final value = _productVariants;
    if (value == null) return null;
    if (_productVariants is EqualUnmodifiableListView) return _productVariants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DoseCriteriaModel(condition: $condition, productVariants: $productVariants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoseCriteriaModelImpl &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            const DeepCollectionEquality()
                .equals(other._productVariants, _productVariants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, condition,
      const DeepCollectionEquality().hash(_productVariants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoseCriteriaModelImplCopyWith<_$DoseCriteriaModelImpl> get copyWith =>
      __$$DoseCriteriaModelImplCopyWithImpl<_$DoseCriteriaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoseCriteriaModelImplToJson(
      this,
    );
  }
}

abstract class _DoseCriteriaModel implements DoseCriteriaModel {
  const factory _DoseCriteriaModel(
          {@JsonKey(name: 'condition') final String? condition,
          @JsonKey(name: 'ProductVariants')
          final List<ProductVariantsModel>? productVariants}) =
      _$DoseCriteriaModelImpl;

  factory _DoseCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$DoseCriteriaModelImpl.fromJson;

  @override
  @JsonKey(name: 'condition')
  String? get condition;
  @override
  @JsonKey(name: 'ProductVariants')
  List<ProductVariantsModel>? get productVariants;
  @override
  @JsonKey(ignore: true)
  _$$DoseCriteriaModelImplCopyWith<_$DoseCriteriaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductVariantsModel _$ProductVariantsModelFromJson(Map<String, dynamic> json) {
  return _ProductVariantsModel.fromJson(json);
}

/// @nodoc
mixin _$ProductVariantsModel {
  String? get productVariantId => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductVariantsModelCopyWith<ProductVariantsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantsModelCopyWith<$Res> {
  factory $ProductVariantsModelCopyWith(ProductVariantsModel value,
          $Res Function(ProductVariantsModel) then) =
      _$ProductVariantsModelCopyWithImpl<$Res, ProductVariantsModel>;
  @useResult
  $Res call({String? productVariantId, int? quantity});
}

/// @nodoc
class _$ProductVariantsModelCopyWithImpl<$Res,
        $Val extends ProductVariantsModel>
    implements $ProductVariantsModelCopyWith<$Res> {
  _$ProductVariantsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariantId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productVariantId: freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantsModelImplCopyWith<$Res>
    implements $ProductVariantsModelCopyWith<$Res> {
  factory _$$ProductVariantsModelImplCopyWith(_$ProductVariantsModelImpl value,
          $Res Function(_$ProductVariantsModelImpl) then) =
      __$$ProductVariantsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? productVariantId, int? quantity});
}

/// @nodoc
class __$$ProductVariantsModelImplCopyWithImpl<$Res>
    extends _$ProductVariantsModelCopyWithImpl<$Res, _$ProductVariantsModelImpl>
    implements _$$ProductVariantsModelImplCopyWith<$Res> {
  __$$ProductVariantsModelImplCopyWithImpl(_$ProductVariantsModelImpl _value,
      $Res Function(_$ProductVariantsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariantId = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$ProductVariantsModelImpl(
      productVariantId: freezed == productVariantId
          ? _value.productVariantId
          : productVariantId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantsModelImpl implements _ProductVariantsModel {
  const _$ProductVariantsModelImpl({this.productVariantId, this.quantity});

  factory _$ProductVariantsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantsModelImplFromJson(json);

  @override
  final String? productVariantId;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'ProductVariantsModel(productVariantId: $productVariantId, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantsModelImpl &&
            (identical(other.productVariantId, productVariantId) ||
                other.productVariantId == productVariantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productVariantId, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantsModelImplCopyWith<_$ProductVariantsModelImpl>
      get copyWith =>
          __$$ProductVariantsModelImplCopyWithImpl<_$ProductVariantsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantsModelImplToJson(
      this,
    );
  }
}

abstract class _ProductVariantsModel implements ProductVariantsModel {
  const factory _ProductVariantsModel(
      {final String? productVariantId,
      final int? quantity}) = _$ProductVariantsModelImpl;

  factory _ProductVariantsModel.fromJson(Map<String, dynamic> json) =
      _$ProductVariantsModelImpl.fromJson;

  @override
  String? get productVariantId;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$ProductVariantsModelImplCopyWith<_$ProductVariantsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
