// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facilitiesComposite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FacilityCompositeEvent {
  String get projectId => throw _privateConstructorUsedError;
  Map<DataModelType, Map<ApiOperation, String>>? get actionMap =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        loadForProjectId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityCompositeLoadForProjectEvent value)
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityCompositeLoadForProjectEvent value)?
        loadForProjectId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityCompositeLoadForProjectEvent value)?
        loadForProjectId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FacilityCompositeEventCopyWith<FacilityCompositeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityCompositeEventCopyWith<$Res> {
  factory $FacilityCompositeEventCopyWith(FacilityCompositeEvent value,
          $Res Function(FacilityCompositeEvent) then) =
      _$FacilityCompositeEventCopyWithImpl<$Res, FacilityCompositeEvent>;
  @useResult
  $Res call(
      {String projectId,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap});
}

/// @nodoc
class _$FacilityCompositeEventCopyWithImpl<$Res,
        $Val extends FacilityCompositeEvent>
    implements $FacilityCompositeEventCopyWith<$Res> {
  _$FacilityCompositeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? actionMap = freezed,
  }) {
    return _then(_value.copyWith(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      actionMap: freezed == actionMap
          ? _value.actionMap
          : actionMap // ignore: cast_nullable_to_non_nullable
              as Map<DataModelType, Map<ApiOperation, String>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityCompositeLoadForProjectEventImplCopyWith<$Res>
    implements $FacilityCompositeEventCopyWith<$Res> {
  factory _$$FacilityCompositeLoadForProjectEventImplCopyWith(
          _$FacilityCompositeLoadForProjectEventImpl value,
          $Res Function(_$FacilityCompositeLoadForProjectEventImpl) then) =
      __$$FacilityCompositeLoadForProjectEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectId,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap});
}

/// @nodoc
class __$$FacilityCompositeLoadForProjectEventImplCopyWithImpl<$Res>
    extends _$FacilityCompositeEventCopyWithImpl<$Res,
        _$FacilityCompositeLoadForProjectEventImpl>
    implements _$$FacilityCompositeLoadForProjectEventImplCopyWith<$Res> {
  __$$FacilityCompositeLoadForProjectEventImplCopyWithImpl(
      _$FacilityCompositeLoadForProjectEventImpl _value,
      $Res Function(_$FacilityCompositeLoadForProjectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? actionMap = freezed,
  }) {
    return _then(_$FacilityCompositeLoadForProjectEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      actionMap: freezed == actionMap
          ? _value._actionMap
          : actionMap // ignore: cast_nullable_to_non_nullable
              as Map<DataModelType, Map<ApiOperation, String>>?,
    ));
  }
}

/// @nodoc

class _$FacilityCompositeLoadForProjectEventImpl
    implements FacilityCompositeLoadForProjectEvent {
  const _$FacilityCompositeLoadForProjectEventImpl(
      {required this.projectId,
      required final Map<DataModelType, Map<ApiOperation, String>>? actionMap})
      : _actionMap = actionMap;

  @override
  final String projectId;
  final Map<DataModelType, Map<ApiOperation, String>>? _actionMap;
  @override
  Map<DataModelType, Map<ApiOperation, String>>? get actionMap {
    final value = _actionMap;
    if (value == null) return null;
    if (_actionMap is EqualUnmodifiableMapView) return _actionMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'FacilityCompositeEvent.loadForProjectId(projectId: $projectId, actionMap: $actionMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityCompositeLoadForProjectEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality()
                .equals(other._actionMap, _actionMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, projectId, const DeepCollectionEquality().hash(_actionMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityCompositeLoadForProjectEventImplCopyWith<
          _$FacilityCompositeLoadForProjectEventImpl>
      get copyWith => __$$FacilityCompositeLoadForProjectEventImplCopyWithImpl<
          _$FacilityCompositeLoadForProjectEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)
        loadForProjectId,
  }) {
    return loadForProjectId(projectId, actionMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        loadForProjectId,
  }) {
    return loadForProjectId?.call(projectId, actionMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        loadForProjectId,
    required TResult orElse(),
  }) {
    if (loadForProjectId != null) {
      return loadForProjectId(projectId, actionMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityCompositeLoadForProjectEvent value)
        loadForProjectId,
  }) {
    return loadForProjectId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityCompositeLoadForProjectEvent value)?
        loadForProjectId,
  }) {
    return loadForProjectId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityCompositeLoadForProjectEvent value)?
        loadForProjectId,
    required TResult orElse(),
  }) {
    if (loadForProjectId != null) {
      return loadForProjectId(this);
    }
    return orElse();
  }
}

abstract class FacilityCompositeLoadForProjectEvent
    implements FacilityCompositeEvent {
  const factory FacilityCompositeLoadForProjectEvent(
      {required final String projectId,
      required final Map<DataModelType, Map<ApiOperation, String>>?
          actionMap}) = _$FacilityCompositeLoadForProjectEventImpl;

  @override
  String get projectId;
  @override
  Map<DataModelType, Map<ApiOperation, String>>? get actionMap;
  @override
  @JsonKey(ignore: true)
  _$$FacilityCompositeLoadForProjectEventImplCopyWith<
          _$FacilityCompositeLoadForProjectEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FacilityCompositeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityCompositeEmptyState value) empty,
    required TResult Function(FacilityCompositeLoadingState value) loading,
    required TResult Function(FacilityCompositeFetchedState value) fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityCompositeEmptyState value)? empty,
    TResult? Function(FacilityCompositeLoadingState value)? loading,
    TResult? Function(FacilityCompositeFetchedState value)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityCompositeEmptyState value)? empty,
    TResult Function(FacilityCompositeLoadingState value)? loading,
    TResult Function(FacilityCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityCompositeStateCopyWith<$Res> {
  factory $FacilityCompositeStateCopyWith(FacilityCompositeState value,
          $Res Function(FacilityCompositeState) then) =
      _$FacilityCompositeStateCopyWithImpl<$Res, FacilityCompositeState>;
}

/// @nodoc
class _$FacilityCompositeStateCopyWithImpl<$Res,
        $Val extends FacilityCompositeState>
    implements $FacilityCompositeStateCopyWith<$Res> {
  _$FacilityCompositeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FacilityCompositeEmptyStateImplCopyWith<$Res> {
  factory _$$FacilityCompositeEmptyStateImplCopyWith(
          _$FacilityCompositeEmptyStateImpl value,
          $Res Function(_$FacilityCompositeEmptyStateImpl) then) =
      __$$FacilityCompositeEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityCompositeEmptyStateImplCopyWithImpl<$Res>
    extends _$FacilityCompositeStateCopyWithImpl<$Res,
        _$FacilityCompositeEmptyStateImpl>
    implements _$$FacilityCompositeEmptyStateImplCopyWith<$Res> {
  __$$FacilityCompositeEmptyStateImplCopyWithImpl(
      _$FacilityCompositeEmptyStateImpl _value,
      $Res Function(_$FacilityCompositeEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityCompositeEmptyStateImpl implements FacilityCompositeEmptyState {
  const _$FacilityCompositeEmptyStateImpl();

  @override
  String toString() {
    return 'FacilityCompositeState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityCompositeEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityCompositeEmptyState value) empty,
    required TResult Function(FacilityCompositeLoadingState value) loading,
    required TResult Function(FacilityCompositeFetchedState value) fetched,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityCompositeEmptyState value)? empty,
    TResult? Function(FacilityCompositeLoadingState value)? loading,
    TResult? Function(FacilityCompositeFetchedState value)? fetched,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityCompositeEmptyState value)? empty,
    TResult Function(FacilityCompositeLoadingState value)? loading,
    TResult Function(FacilityCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class FacilityCompositeEmptyState implements FacilityCompositeState {
  const factory FacilityCompositeEmptyState() =
      _$FacilityCompositeEmptyStateImpl;
}

/// @nodoc
abstract class _$$FacilityCompositeLoadingStateImplCopyWith<$Res> {
  factory _$$FacilityCompositeLoadingStateImplCopyWith(
          _$FacilityCompositeLoadingStateImpl value,
          $Res Function(_$FacilityCompositeLoadingStateImpl) then) =
      __$$FacilityCompositeLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FacilityCompositeLoadingStateImplCopyWithImpl<$Res>
    extends _$FacilityCompositeStateCopyWithImpl<$Res,
        _$FacilityCompositeLoadingStateImpl>
    implements _$$FacilityCompositeLoadingStateImplCopyWith<$Res> {
  __$$FacilityCompositeLoadingStateImplCopyWithImpl(
      _$FacilityCompositeLoadingStateImpl _value,
      $Res Function(_$FacilityCompositeLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FacilityCompositeLoadingStateImpl
    implements FacilityCompositeLoadingState {
  const _$FacilityCompositeLoadingStateImpl();

  @override
  String toString() {
    return 'FacilityCompositeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityCompositeLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityCompositeEmptyState value) empty,
    required TResult Function(FacilityCompositeLoadingState value) loading,
    required TResult Function(FacilityCompositeFetchedState value) fetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityCompositeEmptyState value)? empty,
    TResult? Function(FacilityCompositeLoadingState value)? loading,
    TResult? Function(FacilityCompositeFetchedState value)? fetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityCompositeEmptyState value)? empty,
    TResult Function(FacilityCompositeLoadingState value)? loading,
    TResult Function(FacilityCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FacilityCompositeLoadingState implements FacilityCompositeState {
  const factory FacilityCompositeLoadingState() =
      _$FacilityCompositeLoadingStateImpl;
}

/// @nodoc
abstract class _$$FacilityCompositeFetchedStateImplCopyWith<$Res> {
  factory _$$FacilityCompositeFetchedStateImplCopyWith(
          _$FacilityCompositeFetchedStateImpl value,
          $Res Function(_$FacilityCompositeFetchedStateImpl) then) =
      __$$FacilityCompositeFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FacilityModel> facilities});
}

/// @nodoc
class __$$FacilityCompositeFetchedStateImplCopyWithImpl<$Res>
    extends _$FacilityCompositeStateCopyWithImpl<$Res,
        _$FacilityCompositeFetchedStateImpl>
    implements _$$FacilityCompositeFetchedStateImplCopyWith<$Res> {
  __$$FacilityCompositeFetchedStateImplCopyWithImpl(
      _$FacilityCompositeFetchedStateImpl _value,
      $Res Function(_$FacilityCompositeFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
  }) {
    return _then(_$FacilityCompositeFetchedStateImpl(
      facilities: null == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityModel>,
    ));
  }
}

/// @nodoc

class _$FacilityCompositeFetchedStateImpl
    implements FacilityCompositeFetchedState {
  const _$FacilityCompositeFetchedStateImpl(
      {required final List<FacilityModel> facilities})
      : _facilities = facilities;

  final List<FacilityModel> _facilities;
  @override
  List<FacilityModel> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  @override
  String toString() {
    return 'FacilityCompositeState.fetched(facilities: $facilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityCompositeFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_facilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityCompositeFetchedStateImplCopyWith<
          _$FacilityCompositeFetchedStateImpl>
      get copyWith => __$$FacilityCompositeFetchedStateImplCopyWithImpl<
          _$FacilityCompositeFetchedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<FacilityModel> facilities) fetched,
  }) {
    return fetched(facilities);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<FacilityModel> facilities)? fetched,
  }) {
    return fetched?.call(facilities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<FacilityModel> facilities)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(facilities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacilityCompositeEmptyState value) empty,
    required TResult Function(FacilityCompositeLoadingState value) loading,
    required TResult Function(FacilityCompositeFetchedState value) fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacilityCompositeEmptyState value)? empty,
    TResult? Function(FacilityCompositeLoadingState value)? loading,
    TResult? Function(FacilityCompositeFetchedState value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacilityCompositeEmptyState value)? empty,
    TResult Function(FacilityCompositeLoadingState value)? loading,
    TResult Function(FacilityCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class FacilityCompositeFetchedState implements FacilityCompositeState {
  const factory FacilityCompositeFetchedState(
          {required final List<FacilityModel> facilities}) =
      _$FacilityCompositeFetchedStateImpl;

  List<FacilityModel> get facilities;
  @JsonKey(ignore: true)
  _$$FacilityCompositeFetchedStateImplCopyWith<
          _$FacilityCompositeFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
