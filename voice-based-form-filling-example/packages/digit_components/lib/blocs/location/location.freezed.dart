// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retry) load,
    required TResult Function(int retry) listen,
    required TResult Function(int retry) requestService,
    required TResult Function(int retry) requestPermission,
    required TResult Function(LocationData locationData) setLatLng,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retry)? load,
    TResult? Function(int retry)? listen,
    TResult? Function(int retry)? requestService,
    TResult? Function(int retry)? requestPermission,
    TResult? Function(LocationData locationData)? setLatLng,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retry)? load,
    TResult Function(int retry)? listen,
    TResult Function(int retry)? requestService,
    TResult Function(int retry)? requestPermission,
    TResult Function(LocationData locationData)? setLatLng,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocationEvent value) load,
    required TResult Function(ListenLocationEvent value) listen,
    required TResult Function(RequestLocationServiceEvent value) requestService,
    required TResult Function(RequestLocationPermissionEvent value)
        requestPermission,
    required TResult Function(LocationSetLatLngEvent value) setLatLng,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocationEvent value)? load,
    TResult? Function(ListenLocationEvent value)? listen,
    TResult? Function(RequestLocationServiceEvent value)? requestService,
    TResult? Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult? Function(LocationSetLatLngEvent value)? setLatLng,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocationEvent value)? load,
    TResult Function(ListenLocationEvent value)? listen,
    TResult Function(RequestLocationServiceEvent value)? requestService,
    TResult Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult Function(LocationSetLatLngEvent value)? setLatLng,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res, LocationEvent>;
}

/// @nodoc
class _$LocationEventCopyWithImpl<$Res, $Val extends LocationEvent>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadLocationEventImplCopyWith<$Res> {
  factory _$$LoadLocationEventImplCopyWith(_$LoadLocationEventImpl value,
          $Res Function(_$LoadLocationEventImpl) then) =
      __$$LoadLocationEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$LoadLocationEventImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$LoadLocationEventImpl>
    implements _$$LoadLocationEventImplCopyWith<$Res> {
  __$$LoadLocationEventImplCopyWithImpl(_$LoadLocationEventImpl _value,
      $Res Function(_$LoadLocationEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$LoadLocationEventImpl(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadLocationEventImpl implements LoadLocationEvent {
  const _$LoadLocationEventImpl({this.retry = 5});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.load(retry: $retry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLocationEventImpl &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadLocationEventImplCopyWith<_$LoadLocationEventImpl> get copyWith =>
      __$$LoadLocationEventImplCopyWithImpl<_$LoadLocationEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retry) load,
    required TResult Function(int retry) listen,
    required TResult Function(int retry) requestService,
    required TResult Function(int retry) requestPermission,
    required TResult Function(LocationData locationData) setLatLng,
  }) {
    return load(retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retry)? load,
    TResult? Function(int retry)? listen,
    TResult? Function(int retry)? requestService,
    TResult? Function(int retry)? requestPermission,
    TResult? Function(LocationData locationData)? setLatLng,
  }) {
    return load?.call(retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retry)? load,
    TResult Function(int retry)? listen,
    TResult Function(int retry)? requestService,
    TResult Function(int retry)? requestPermission,
    TResult Function(LocationData locationData)? setLatLng,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocationEvent value) load,
    required TResult Function(ListenLocationEvent value) listen,
    required TResult Function(RequestLocationServiceEvent value) requestService,
    required TResult Function(RequestLocationPermissionEvent value)
        requestPermission,
    required TResult Function(LocationSetLatLngEvent value) setLatLng,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocationEvent value)? load,
    TResult? Function(ListenLocationEvent value)? listen,
    TResult? Function(RequestLocationServiceEvent value)? requestService,
    TResult? Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult? Function(LocationSetLatLngEvent value)? setLatLng,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocationEvent value)? load,
    TResult Function(ListenLocationEvent value)? listen,
    TResult Function(RequestLocationServiceEvent value)? requestService,
    TResult Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult Function(LocationSetLatLngEvent value)? setLatLng,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadLocationEvent implements LocationEvent {
  const factory LoadLocationEvent({final int retry}) = _$LoadLocationEventImpl;

  int get retry;
  @JsonKey(ignore: true)
  _$$LoadLocationEventImplCopyWith<_$LoadLocationEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListenLocationEventImplCopyWith<$Res> {
  factory _$$ListenLocationEventImplCopyWith(_$ListenLocationEventImpl value,
          $Res Function(_$ListenLocationEventImpl) then) =
      __$$ListenLocationEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$ListenLocationEventImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$ListenLocationEventImpl>
    implements _$$ListenLocationEventImplCopyWith<$Res> {
  __$$ListenLocationEventImplCopyWithImpl(_$ListenLocationEventImpl _value,
      $Res Function(_$ListenLocationEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$ListenLocationEventImpl(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListenLocationEventImpl implements ListenLocationEvent {
  const _$ListenLocationEventImpl({this.retry = 5});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.listen(retry: $retry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenLocationEventImpl &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListenLocationEventImplCopyWith<_$ListenLocationEventImpl> get copyWith =>
      __$$ListenLocationEventImplCopyWithImpl<_$ListenLocationEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retry) load,
    required TResult Function(int retry) listen,
    required TResult Function(int retry) requestService,
    required TResult Function(int retry) requestPermission,
    required TResult Function(LocationData locationData) setLatLng,
  }) {
    return listen(retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retry)? load,
    TResult? Function(int retry)? listen,
    TResult? Function(int retry)? requestService,
    TResult? Function(int retry)? requestPermission,
    TResult? Function(LocationData locationData)? setLatLng,
  }) {
    return listen?.call(retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retry)? load,
    TResult Function(int retry)? listen,
    TResult Function(int retry)? requestService,
    TResult Function(int retry)? requestPermission,
    TResult Function(LocationData locationData)? setLatLng,
    required TResult orElse(),
  }) {
    if (listen != null) {
      return listen(retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocationEvent value) load,
    required TResult Function(ListenLocationEvent value) listen,
    required TResult Function(RequestLocationServiceEvent value) requestService,
    required TResult Function(RequestLocationPermissionEvent value)
        requestPermission,
    required TResult Function(LocationSetLatLngEvent value) setLatLng,
  }) {
    return listen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocationEvent value)? load,
    TResult? Function(ListenLocationEvent value)? listen,
    TResult? Function(RequestLocationServiceEvent value)? requestService,
    TResult? Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult? Function(LocationSetLatLngEvent value)? setLatLng,
  }) {
    return listen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocationEvent value)? load,
    TResult Function(ListenLocationEvent value)? listen,
    TResult Function(RequestLocationServiceEvent value)? requestService,
    TResult Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult Function(LocationSetLatLngEvent value)? setLatLng,
    required TResult orElse(),
  }) {
    if (listen != null) {
      return listen(this);
    }
    return orElse();
  }
}

abstract class ListenLocationEvent implements LocationEvent {
  const factory ListenLocationEvent({final int retry}) =
      _$ListenLocationEventImpl;

  int get retry;
  @JsonKey(ignore: true)
  _$$ListenLocationEventImplCopyWith<_$ListenLocationEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestLocationServiceEventImplCopyWith<$Res> {
  factory _$$RequestLocationServiceEventImplCopyWith(
          _$RequestLocationServiceEventImpl value,
          $Res Function(_$RequestLocationServiceEventImpl) then) =
      __$$RequestLocationServiceEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$RequestLocationServiceEventImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$RequestLocationServiceEventImpl>
    implements _$$RequestLocationServiceEventImplCopyWith<$Res> {
  __$$RequestLocationServiceEventImplCopyWithImpl(
      _$RequestLocationServiceEventImpl _value,
      $Res Function(_$RequestLocationServiceEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$RequestLocationServiceEventImpl(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestLocationServiceEventImpl implements RequestLocationServiceEvent {
  const _$RequestLocationServiceEventImpl({this.retry = 5});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.requestService(retry: $retry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLocationServiceEventImpl &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestLocationServiceEventImplCopyWith<_$RequestLocationServiceEventImpl>
      get copyWith => __$$RequestLocationServiceEventImplCopyWithImpl<
          _$RequestLocationServiceEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retry) load,
    required TResult Function(int retry) listen,
    required TResult Function(int retry) requestService,
    required TResult Function(int retry) requestPermission,
    required TResult Function(LocationData locationData) setLatLng,
  }) {
    return requestService(retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retry)? load,
    TResult? Function(int retry)? listen,
    TResult? Function(int retry)? requestService,
    TResult? Function(int retry)? requestPermission,
    TResult? Function(LocationData locationData)? setLatLng,
  }) {
    return requestService?.call(retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retry)? load,
    TResult Function(int retry)? listen,
    TResult Function(int retry)? requestService,
    TResult Function(int retry)? requestPermission,
    TResult Function(LocationData locationData)? setLatLng,
    required TResult orElse(),
  }) {
    if (requestService != null) {
      return requestService(retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocationEvent value) load,
    required TResult Function(ListenLocationEvent value) listen,
    required TResult Function(RequestLocationServiceEvent value) requestService,
    required TResult Function(RequestLocationPermissionEvent value)
        requestPermission,
    required TResult Function(LocationSetLatLngEvent value) setLatLng,
  }) {
    return requestService(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocationEvent value)? load,
    TResult? Function(ListenLocationEvent value)? listen,
    TResult? Function(RequestLocationServiceEvent value)? requestService,
    TResult? Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult? Function(LocationSetLatLngEvent value)? setLatLng,
  }) {
    return requestService?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocationEvent value)? load,
    TResult Function(ListenLocationEvent value)? listen,
    TResult Function(RequestLocationServiceEvent value)? requestService,
    TResult Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult Function(LocationSetLatLngEvent value)? setLatLng,
    required TResult orElse(),
  }) {
    if (requestService != null) {
      return requestService(this);
    }
    return orElse();
  }
}

abstract class RequestLocationServiceEvent implements LocationEvent {
  const factory RequestLocationServiceEvent({final int retry}) =
      _$RequestLocationServiceEventImpl;

  int get retry;
  @JsonKey(ignore: true)
  _$$RequestLocationServiceEventImplCopyWith<_$RequestLocationServiceEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestLocationPermissionEventImplCopyWith<$Res> {
  factory _$$RequestLocationPermissionEventImplCopyWith(
          _$RequestLocationPermissionEventImpl value,
          $Res Function(_$RequestLocationPermissionEventImpl) then) =
      __$$RequestLocationPermissionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$RequestLocationPermissionEventImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res,
        _$RequestLocationPermissionEventImpl>
    implements _$$RequestLocationPermissionEventImplCopyWith<$Res> {
  __$$RequestLocationPermissionEventImplCopyWithImpl(
      _$RequestLocationPermissionEventImpl _value,
      $Res Function(_$RequestLocationPermissionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$RequestLocationPermissionEventImpl(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestLocationPermissionEventImpl
    implements RequestLocationPermissionEvent {
  const _$RequestLocationPermissionEventImpl({this.retry = 1});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.requestPermission(retry: $retry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLocationPermissionEventImpl &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestLocationPermissionEventImplCopyWith<
          _$RequestLocationPermissionEventImpl>
      get copyWith => __$$RequestLocationPermissionEventImplCopyWithImpl<
          _$RequestLocationPermissionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retry) load,
    required TResult Function(int retry) listen,
    required TResult Function(int retry) requestService,
    required TResult Function(int retry) requestPermission,
    required TResult Function(LocationData locationData) setLatLng,
  }) {
    return requestPermission(retry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retry)? load,
    TResult? Function(int retry)? listen,
    TResult? Function(int retry)? requestService,
    TResult? Function(int retry)? requestPermission,
    TResult? Function(LocationData locationData)? setLatLng,
  }) {
    return requestPermission?.call(retry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retry)? load,
    TResult Function(int retry)? listen,
    TResult Function(int retry)? requestService,
    TResult Function(int retry)? requestPermission,
    TResult Function(LocationData locationData)? setLatLng,
    required TResult orElse(),
  }) {
    if (requestPermission != null) {
      return requestPermission(retry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocationEvent value) load,
    required TResult Function(ListenLocationEvent value) listen,
    required TResult Function(RequestLocationServiceEvent value) requestService,
    required TResult Function(RequestLocationPermissionEvent value)
        requestPermission,
    required TResult Function(LocationSetLatLngEvent value) setLatLng,
  }) {
    return requestPermission(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocationEvent value)? load,
    TResult? Function(ListenLocationEvent value)? listen,
    TResult? Function(RequestLocationServiceEvent value)? requestService,
    TResult? Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult? Function(LocationSetLatLngEvent value)? setLatLng,
  }) {
    return requestPermission?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocationEvent value)? load,
    TResult Function(ListenLocationEvent value)? listen,
    TResult Function(RequestLocationServiceEvent value)? requestService,
    TResult Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult Function(LocationSetLatLngEvent value)? setLatLng,
    required TResult orElse(),
  }) {
    if (requestPermission != null) {
      return requestPermission(this);
    }
    return orElse();
  }
}

abstract class RequestLocationPermissionEvent implements LocationEvent {
  const factory RequestLocationPermissionEvent({final int retry}) =
      _$RequestLocationPermissionEventImpl;

  int get retry;
  @JsonKey(ignore: true)
  _$$RequestLocationPermissionEventImplCopyWith<
          _$RequestLocationPermissionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationSetLatLngEventImplCopyWith<$Res> {
  factory _$$LocationSetLatLngEventImplCopyWith(
          _$LocationSetLatLngEventImpl value,
          $Res Function(_$LocationSetLatLngEventImpl) then) =
      __$$LocationSetLatLngEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationData locationData});
}

/// @nodoc
class __$$LocationSetLatLngEventImplCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$LocationSetLatLngEventImpl>
    implements _$$LocationSetLatLngEventImplCopyWith<$Res> {
  __$$LocationSetLatLngEventImplCopyWithImpl(
      _$LocationSetLatLngEventImpl _value,
      $Res Function(_$LocationSetLatLngEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationData = null,
  }) {
    return _then(_$LocationSetLatLngEventImpl(
      locationData: null == locationData
          ? _value.locationData
          : locationData // ignore: cast_nullable_to_non_nullable
              as LocationData,
    ));
  }
}

/// @nodoc

class _$LocationSetLatLngEventImpl implements LocationSetLatLngEvent {
  const _$LocationSetLatLngEventImpl({required this.locationData});

  @override
  final LocationData locationData;

  @override
  String toString() {
    return 'LocationEvent.setLatLng(locationData: $locationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationSetLatLngEventImpl &&
            (identical(other.locationData, locationData) ||
                other.locationData == locationData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationSetLatLngEventImplCopyWith<_$LocationSetLatLngEventImpl>
      get copyWith => __$$LocationSetLatLngEventImplCopyWithImpl<
          _$LocationSetLatLngEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int retry) load,
    required TResult Function(int retry) listen,
    required TResult Function(int retry) requestService,
    required TResult Function(int retry) requestPermission,
    required TResult Function(LocationData locationData) setLatLng,
  }) {
    return setLatLng(locationData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int retry)? load,
    TResult? Function(int retry)? listen,
    TResult? Function(int retry)? requestService,
    TResult? Function(int retry)? requestPermission,
    TResult? Function(LocationData locationData)? setLatLng,
  }) {
    return setLatLng?.call(locationData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int retry)? load,
    TResult Function(int retry)? listen,
    TResult Function(int retry)? requestService,
    TResult Function(int retry)? requestPermission,
    TResult Function(LocationData locationData)? setLatLng,
    required TResult orElse(),
  }) {
    if (setLatLng != null) {
      return setLatLng(locationData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadLocationEvent value) load,
    required TResult Function(ListenLocationEvent value) listen,
    required TResult Function(RequestLocationServiceEvent value) requestService,
    required TResult Function(RequestLocationPermissionEvent value)
        requestPermission,
    required TResult Function(LocationSetLatLngEvent value) setLatLng,
  }) {
    return setLatLng(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadLocationEvent value)? load,
    TResult? Function(ListenLocationEvent value)? listen,
    TResult? Function(RequestLocationServiceEvent value)? requestService,
    TResult? Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult? Function(LocationSetLatLngEvent value)? setLatLng,
  }) {
    return setLatLng?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadLocationEvent value)? load,
    TResult Function(ListenLocationEvent value)? listen,
    TResult Function(RequestLocationServiceEvent value)? requestService,
    TResult Function(RequestLocationPermissionEvent value)? requestPermission,
    TResult Function(LocationSetLatLngEvent value)? setLatLng,
    required TResult orElse(),
  }) {
    if (setLatLng != null) {
      return setLatLng(this);
    }
    return orElse();
  }
}

abstract class LocationSetLatLngEvent implements LocationEvent {
  const factory LocationSetLatLngEvent(
          {required final LocationData locationData}) =
      _$LocationSetLatLngEventImpl;

  LocationData get locationData;
  @JsonKey(ignore: true)
  _$$LocationSetLatLngEventImplCopyWith<_$LocationSetLatLngEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocationState {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get accuracy => throw _privateConstructorUsedError;
  dynamic get hasPermissions => throw _privateConstructorUsedError;
  bool get serviceEnabled => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationStateCopyWith<LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res, LocationState>;
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? accuracy,
      dynamic hasPermissions,
      bool serviceEnabled,
      bool loading});
}

/// @nodoc
class _$LocationStateCopyWithImpl<$Res, $Val extends LocationState>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
    Object? hasPermissions = freezed,
    Object? serviceEnabled = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      hasPermissions: freezed == hasPermissions
          ? _value.hasPermissions
          : hasPermissions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      serviceEnabled: null == serviceEnabled
          ? _value.serviceEnabled
          : serviceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationStateImplCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$LocationStateImplCopyWith(
          _$LocationStateImpl value, $Res Function(_$LocationStateImpl) then) =
      __$$LocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      double? accuracy,
      dynamic hasPermissions,
      bool serviceEnabled,
      bool loading});
}

/// @nodoc
class __$$LocationStateImplCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$LocationStateImpl>
    implements _$$LocationStateImplCopyWith<$Res> {
  __$$LocationStateImplCopyWithImpl(
      _$LocationStateImpl _value, $Res Function(_$LocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
    Object? hasPermissions = freezed,
    Object? serviceEnabled = null,
    Object? loading = null,
  }) {
    return _then(_$LocationStateImpl(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as double?,
      hasPermissions:
          freezed == hasPermissions ? _value.hasPermissions! : hasPermissions,
      serviceEnabled: null == serviceEnabled
          ? _value.serviceEnabled
          : serviceEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LocationStateImpl extends _LocationState {
  const _$LocationStateImpl(
      {this.latitude,
      this.longitude,
      this.accuracy,
      this.hasPermissions = false,
      this.serviceEnabled = false,
      this.loading = false})
      : super._();

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? accuracy;
  @override
  @JsonKey()
  final dynamic hasPermissions;
  @override
  @JsonKey()
  final bool serviceEnabled;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'LocationState(latitude: $latitude, longitude: $longitude, accuracy: $accuracy, hasPermissions: $hasPermissions, serviceEnabled: $serviceEnabled, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationStateImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            const DeepCollectionEquality()
                .equals(other.hasPermissions, hasPermissions) &&
            (identical(other.serviceEnabled, serviceEnabled) ||
                other.serviceEnabled == serviceEnabled) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      latitude,
      longitude,
      accuracy,
      const DeepCollectionEquality().hash(hasPermissions),
      serviceEnabled,
      loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      __$$LocationStateImplCopyWithImpl<_$LocationStateImpl>(this, _$identity);
}

abstract class _LocationState extends LocationState {
  const factory _LocationState(
      {final double? latitude,
      final double? longitude,
      final double? accuracy,
      final dynamic hasPermissions,
      final bool serviceEnabled,
      final bool loading}) = _$LocationStateImpl;
  const _LocationState._() : super._();

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  double? get accuracy;
  @override
  dynamic get hasPermissions;
  @override
  bool get serviceEnabled;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$LocationStateImplCopyWith<_$LocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
