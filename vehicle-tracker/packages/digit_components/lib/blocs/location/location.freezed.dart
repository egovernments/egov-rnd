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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$LoadLocationEventCopyWith<$Res> {
  factory _$$LoadLocationEventCopyWith(
          _$LoadLocationEvent value, $Res Function(_$LoadLocationEvent) then) =
      __$$LoadLocationEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$LoadLocationEventCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$LoadLocationEvent>
    implements _$$LoadLocationEventCopyWith<$Res> {
  __$$LoadLocationEventCopyWithImpl(
      _$LoadLocationEvent _value, $Res Function(_$LoadLocationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$LoadLocationEvent(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadLocationEvent implements LoadLocationEvent {
  const _$LoadLocationEvent({this.retry = 5});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.load(retry: $retry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadLocationEvent &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadLocationEventCopyWith<_$LoadLocationEvent> get copyWith =>
      __$$LoadLocationEventCopyWithImpl<_$LoadLocationEvent>(this, _$identity);

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
  const factory LoadLocationEvent({final int retry}) = _$LoadLocationEvent;

  int get retry;
  @JsonKey(ignore: true)
  _$$LoadLocationEventCopyWith<_$LoadLocationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListenLocationEventCopyWith<$Res> {
  factory _$$ListenLocationEventCopyWith(_$ListenLocationEvent value,
          $Res Function(_$ListenLocationEvent) then) =
      __$$ListenLocationEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$ListenLocationEventCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$ListenLocationEvent>
    implements _$$ListenLocationEventCopyWith<$Res> {
  __$$ListenLocationEventCopyWithImpl(
      _$ListenLocationEvent _value, $Res Function(_$ListenLocationEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$ListenLocationEvent(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListenLocationEvent implements ListenLocationEvent {
  const _$ListenLocationEvent({this.retry = 5});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.listen(retry: $retry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenLocationEvent &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListenLocationEventCopyWith<_$ListenLocationEvent> get copyWith =>
      __$$ListenLocationEventCopyWithImpl<_$ListenLocationEvent>(
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
  const factory ListenLocationEvent({final int retry}) = _$ListenLocationEvent;

  int get retry;
  @JsonKey(ignore: true)
  _$$ListenLocationEventCopyWith<_$ListenLocationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestLocationServiceEventCopyWith<$Res> {
  factory _$$RequestLocationServiceEventCopyWith(
          _$RequestLocationServiceEvent value,
          $Res Function(_$RequestLocationServiceEvent) then) =
      __$$RequestLocationServiceEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$RequestLocationServiceEventCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$RequestLocationServiceEvent>
    implements _$$RequestLocationServiceEventCopyWith<$Res> {
  __$$RequestLocationServiceEventCopyWithImpl(
      _$RequestLocationServiceEvent _value,
      $Res Function(_$RequestLocationServiceEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$RequestLocationServiceEvent(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestLocationServiceEvent implements RequestLocationServiceEvent {
  const _$RequestLocationServiceEvent({this.retry = 5});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.requestService(retry: $retry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLocationServiceEvent &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestLocationServiceEventCopyWith<_$RequestLocationServiceEvent>
      get copyWith => __$$RequestLocationServiceEventCopyWithImpl<
          _$RequestLocationServiceEvent>(this, _$identity);

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
      _$RequestLocationServiceEvent;

  int get retry;
  @JsonKey(ignore: true)
  _$$RequestLocationServiceEventCopyWith<_$RequestLocationServiceEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestLocationPermissionEventCopyWith<$Res> {
  factory _$$RequestLocationPermissionEventCopyWith(
          _$RequestLocationPermissionEvent value,
          $Res Function(_$RequestLocationPermissionEvent) then) =
      __$$RequestLocationPermissionEventCopyWithImpl<$Res>;
  @useResult
  $Res call({int retry});
}

/// @nodoc
class __$$RequestLocationPermissionEventCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$RequestLocationPermissionEvent>
    implements _$$RequestLocationPermissionEventCopyWith<$Res> {
  __$$RequestLocationPermissionEventCopyWithImpl(
      _$RequestLocationPermissionEvent _value,
      $Res Function(_$RequestLocationPermissionEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retry = null,
  }) {
    return _then(_$RequestLocationPermissionEvent(
      retry: null == retry
          ? _value.retry
          : retry // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestLocationPermissionEvent
    implements RequestLocationPermissionEvent {
  const _$RequestLocationPermissionEvent({this.retry = 1});

  @override
  @JsonKey()
  final int retry;

  @override
  String toString() {
    return 'LocationEvent.requestPermission(retry: $retry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestLocationPermissionEvent &&
            (identical(other.retry, retry) || other.retry == retry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestLocationPermissionEventCopyWith<_$RequestLocationPermissionEvent>
      get copyWith => __$$RequestLocationPermissionEventCopyWithImpl<
          _$RequestLocationPermissionEvent>(this, _$identity);

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
      _$RequestLocationPermissionEvent;

  int get retry;
  @JsonKey(ignore: true)
  _$$RequestLocationPermissionEventCopyWith<_$RequestLocationPermissionEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LocationSetLatLngEventCopyWith<$Res> {
  factory _$$LocationSetLatLngEventCopyWith(_$LocationSetLatLngEvent value,
          $Res Function(_$LocationSetLatLngEvent) then) =
      __$$LocationSetLatLngEventCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationData locationData});
}

/// @nodoc
class __$$LocationSetLatLngEventCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res, _$LocationSetLatLngEvent>
    implements _$$LocationSetLatLngEventCopyWith<$Res> {
  __$$LocationSetLatLngEventCopyWithImpl(_$LocationSetLatLngEvent _value,
      $Res Function(_$LocationSetLatLngEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locationData = null,
  }) {
    return _then(_$LocationSetLatLngEvent(
      locationData: null == locationData
          ? _value.locationData
          : locationData // ignore: cast_nullable_to_non_nullable
              as LocationData,
    ));
  }
}

/// @nodoc

class _$LocationSetLatLngEvent implements LocationSetLatLngEvent {
  const _$LocationSetLatLngEvent({required this.locationData});

  @override
  final LocationData locationData;

  @override
  String toString() {
    return 'LocationEvent.setLatLng(locationData: $locationData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationSetLatLngEvent &&
            (identical(other.locationData, locationData) ||
                other.locationData == locationData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locationData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationSetLatLngEventCopyWith<_$LocationSetLatLngEvent> get copyWith =>
      __$$LocationSetLatLngEventCopyWithImpl<_$LocationSetLatLngEvent>(
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
      {required final LocationData locationData}) = _$LocationSetLatLngEvent;

  LocationData get locationData;
  @JsonKey(ignore: true)
  _$$LocationSetLatLngEventCopyWith<_$LocationSetLatLngEvent> get copyWith =>
      throw _privateConstructorUsedError;
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
abstract class _$$_LocationStateCopyWith<$Res>
    implements $LocationStateCopyWith<$Res> {
  factory _$$_LocationStateCopyWith(
          _$_LocationState value, $Res Function(_$_LocationState) then) =
      __$$_LocationStateCopyWithImpl<$Res>;
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
class __$$_LocationStateCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res, _$_LocationState>
    implements _$$_LocationStateCopyWith<$Res> {
  __$$_LocationStateCopyWithImpl(
      _$_LocationState _value, $Res Function(_$_LocationState) _then)
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
    return _then(_$_LocationState(
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

class _$_LocationState extends _LocationState {
  const _$_LocationState(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationState &&
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
  _$$_LocationStateCopyWith<_$_LocationState> get copyWith =>
      __$$_LocationStateCopyWithImpl<_$_LocationState>(this, _$identity);
}

abstract class _LocationState extends LocationState {
  const factory _LocationState(
      {final double? latitude,
      final double? longitude,
      final double? accuracy,
      final dynamic hasPermissions,
      final bool serviceEnabled,
      final bool loading}) = _$_LocationState;
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
  _$$_LocationStateCopyWith<_$_LocationState> get copyWith =>
      throw _privateConstructorUsedError;
}
