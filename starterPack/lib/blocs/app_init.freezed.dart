// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_init.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLaunch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppLaunchEvent value) onLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppLaunchEvent value)? onLaunch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppLaunchEvent value)? onLaunch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitEventCopyWith<$Res> {
  factory $InitEventCopyWith(InitEvent value, $Res Function(InitEvent) then) =
      _$InitEventCopyWithImpl<$Res, InitEvent>;
}

/// @nodoc
class _$InitEventCopyWithImpl<$Res, $Val extends InitEvent>
    implements $InitEventCopyWith<$Res> {
  _$InitEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppLaunchEventImplCopyWith<$Res> {
  factory _$$AppLaunchEventImplCopyWith(_$AppLaunchEventImpl value,
          $Res Function(_$AppLaunchEventImpl) then) =
      __$$AppLaunchEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppLaunchEventImplCopyWithImpl<$Res>
    extends _$InitEventCopyWithImpl<$Res, _$AppLaunchEventImpl>
    implements _$$AppLaunchEventImplCopyWith<$Res> {
  __$$AppLaunchEventImplCopyWithImpl(
      _$AppLaunchEventImpl _value, $Res Function(_$AppLaunchEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppLaunchEventImpl implements _AppLaunchEvent {
  const _$AppLaunchEventImpl();

  @override
  String toString() {
    return 'InitEvent.onLaunch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppLaunchEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLaunch,
  }) {
    return onLaunch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLaunch,
  }) {
    return onLaunch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLaunch,
    required TResult orElse(),
  }) {
    if (onLaunch != null) {
      return onLaunch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppLaunchEvent value) onLaunch,
  }) {
    return onLaunch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppLaunchEvent value)? onLaunch,
  }) {
    return onLaunch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppLaunchEvent value)? onLaunch,
    required TResult orElse(),
  }) {
    if (onLaunch != null) {
      return onLaunch(this);
    }
    return orElse();
  }
}

abstract class _AppLaunchEvent implements InitEvent {
  const factory _AppLaunchEvent() = _$AppLaunchEventImpl;
}

/// @nodoc
mixin _$InitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)?
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)?
        initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(Initialized value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Uninitialized value)? uninitialized,
    TResult? Function(Initialized value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitStateCopyWith<$Res> {
  factory $InitStateCopyWith(InitState value, $Res Function(InitState) then) =
      _$InitStateCopyWithImpl<$Res, InitState>;
}

/// @nodoc
class _$InitStateCopyWithImpl<$Res, $Val extends InitState>
    implements $InitStateCopyWith<$Res> {
  _$InitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UninitializedImplCopyWith<$Res> {
  factory _$$UninitializedImplCopyWith(
          _$UninitializedImpl value, $Res Function(_$UninitializedImpl) then) =
      __$$UninitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UninitializedImplCopyWithImpl<$Res>
    extends _$InitStateCopyWithImpl<$Res, _$UninitializedImpl>
    implements _$$UninitializedImplCopyWith<$Res> {
  __$$UninitializedImplCopyWithImpl(
      _$UninitializedImpl _value, $Res Function(_$UninitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UninitializedImpl extends _Uninitialized {
  const _$UninitializedImpl() : super._();

  @override
  String toString() {
    return 'InitState.uninitialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UninitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)
        initialized,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)?
        initialized,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)?
        initialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(Initialized value) initialized,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Uninitialized value)? uninitialized,
    TResult? Function(Initialized value)? initialized,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class _Uninitialized extends InitState {
  const factory _Uninitialized() = _$UninitializedImpl;
  const _Uninitialized._() : super._();
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MdmsResponseModel appConfig,
      List<ServiceRegistry> serviceRegistryModel});

  $MdmsResponseModelCopyWith<$Res> get appConfig;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$InitStateCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appConfig = null,
    Object? serviceRegistryModel = null,
  }) {
    return _then(_$InitializedImpl(
      appConfig: null == appConfig
          ? _value.appConfig
          : appConfig // ignore: cast_nullable_to_non_nullable
              as MdmsResponseModel,
      serviceRegistryModel: null == serviceRegistryModel
          ? _value._serviceRegistryModel
          : serviceRegistryModel // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistry>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MdmsResponseModelCopyWith<$Res> get appConfig {
    return $MdmsResponseModelCopyWith<$Res>(_value.appConfig, (value) {
      return _then(_value.copyWith(appConfig: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl extends Initialized {
  const _$InitializedImpl(
      {required this.appConfig,
      required final List<ServiceRegistry> serviceRegistryModel})
      : _serviceRegistryModel = serviceRegistryModel,
        super._();

  @override
  final MdmsResponseModel appConfig;
  final List<ServiceRegistry> _serviceRegistryModel;
  @override
  List<ServiceRegistry> get serviceRegistryModel {
    if (_serviceRegistryModel is EqualUnmodifiableListView)
      return _serviceRegistryModel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceRegistryModel);
  }

  @override
  String toString() {
    return 'InitState.initialized(appConfig: $appConfig, serviceRegistryModel: $serviceRegistryModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.appConfig, appConfig) ||
                other.appConfig == appConfig) &&
            const DeepCollectionEquality()
                .equals(other._serviceRegistryModel, _serviceRegistryModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appConfig,
      const DeepCollectionEquality().hash(_serviceRegistryModel));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)
        initialized,
  }) {
    return initialized(appConfig, serviceRegistryModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? uninitialized,
    TResult? Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)?
        initialized,
  }) {
    return initialized?.call(appConfig, serviceRegistryModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function(MdmsResponseModel appConfig,
            List<ServiceRegistry> serviceRegistryModel)?
        initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(appConfig, serviceRegistryModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Uninitialized value) uninitialized,
    required TResult Function(Initialized value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Uninitialized value)? uninitialized,
    TResult? Function(Initialized value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Uninitialized value)? uninitialized,
    TResult Function(Initialized value)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class Initialized extends InitState {
  const factory Initialized(
          {required final MdmsResponseModel appConfig,
          required final List<ServiceRegistry> serviceRegistryModel}) =
      _$InitializedImpl;
  const Initialized._() : super._();

  MdmsResponseModel get appConfig;
  List<ServiceRegistry> get serviceRegistryModel;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
