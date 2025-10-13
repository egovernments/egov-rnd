// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serviceRegistryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceRegistryModel _$ServiceRegistryModelFromJson(Map<String, dynamic> json) {
  return _ServiceRegistryModel.fromJson(json);
}

/// @nodoc
mixin _$ServiceRegistryModel {
  @JsonKey(name: 'HCM-SERVICE-REGISTRY')
  ServiceRegistryWrapper? get serviceRegistryWrapper =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRegistryModelCopyWith<ServiceRegistryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRegistryModelCopyWith<$Res> {
  factory $ServiceRegistryModelCopyWith(ServiceRegistryModel value,
          $Res Function(ServiceRegistryModel) then) =
      _$ServiceRegistryModelCopyWithImpl<$Res, ServiceRegistryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
      ServiceRegistryWrapper? serviceRegistryWrapper});

  $ServiceRegistryWrapperCopyWith<$Res>? get serviceRegistryWrapper;
}

/// @nodoc
class _$ServiceRegistryModelCopyWithImpl<$Res,
        $Val extends ServiceRegistryModel>
    implements $ServiceRegistryModelCopyWith<$Res> {
  _$ServiceRegistryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistryWrapper = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRegistryWrapper: freezed == serviceRegistryWrapper
          ? _value.serviceRegistryWrapper
          : serviceRegistryWrapper // ignore: cast_nullable_to_non_nullable
              as ServiceRegistryWrapper?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRegistryWrapperCopyWith<$Res>? get serviceRegistryWrapper {
    if (_value.serviceRegistryWrapper == null) {
      return null;
    }

    return $ServiceRegistryWrapperCopyWith<$Res>(_value.serviceRegistryWrapper!,
        (value) {
      return _then(_value.copyWith(serviceRegistryWrapper: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceRegistryModelImplCopyWith<$Res>
    implements $ServiceRegistryModelCopyWith<$Res> {
  factory _$$ServiceRegistryModelImplCopyWith(_$ServiceRegistryModelImpl value,
          $Res Function(_$ServiceRegistryModelImpl) then) =
      __$$ServiceRegistryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
      ServiceRegistryWrapper? serviceRegistryWrapper});

  @override
  $ServiceRegistryWrapperCopyWith<$Res>? get serviceRegistryWrapper;
}

/// @nodoc
class __$$ServiceRegistryModelImplCopyWithImpl<$Res>
    extends _$ServiceRegistryModelCopyWithImpl<$Res, _$ServiceRegistryModelImpl>
    implements _$$ServiceRegistryModelImplCopyWith<$Res> {
  __$$ServiceRegistryModelImplCopyWithImpl(_$ServiceRegistryModelImpl _value,
      $Res Function(_$ServiceRegistryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistryWrapper = freezed,
  }) {
    return _then(_$ServiceRegistryModelImpl(
      serviceRegistryWrapper: freezed == serviceRegistryWrapper
          ? _value.serviceRegistryWrapper
          : serviceRegistryWrapper // ignore: cast_nullable_to_non_nullable
              as ServiceRegistryWrapper?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRegistryModelImpl implements _ServiceRegistryModel {
  const _$ServiceRegistryModelImpl(
      {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
      required this.serviceRegistryWrapper});

  factory _$ServiceRegistryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRegistryModelImplFromJson(json);

  @override
  @JsonKey(name: 'HCM-SERVICE-REGISTRY')
  final ServiceRegistryWrapper? serviceRegistryWrapper;

  @override
  String toString() {
    return 'ServiceRegistryModel(serviceRegistryWrapper: $serviceRegistryWrapper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRegistryModelImpl &&
            (identical(other.serviceRegistryWrapper, serviceRegistryWrapper) ||
                other.serviceRegistryWrapper == serviceRegistryWrapper));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, serviceRegistryWrapper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRegistryModelImplCopyWith<_$ServiceRegistryModelImpl>
      get copyWith =>
          __$$ServiceRegistryModelImplCopyWithImpl<_$ServiceRegistryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRegistryModelImplToJson(
      this,
    );
  }
}

abstract class _ServiceRegistryModel implements ServiceRegistryModel {
  const factory _ServiceRegistryModel(
          {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
          required final ServiceRegistryWrapper? serviceRegistryWrapper}) =
      _$ServiceRegistryModelImpl;

  factory _ServiceRegistryModel.fromJson(Map<String, dynamic> json) =
      _$ServiceRegistryModelImpl.fromJson;

  @override
  @JsonKey(name: 'HCM-SERVICE-REGISTRY')
  ServiceRegistryWrapper? get serviceRegistryWrapper;
  @override
  @JsonKey(ignore: true)
  _$$ServiceRegistryModelImplCopyWith<_$ServiceRegistryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceRegistryWrapper _$ServiceRegistryWrapperFromJson(
    Map<String, dynamic> json) {
  return _ServiceRegistryWrapper.fromJson(json);
}

/// @nodoc
mixin _$ServiceRegistryWrapper {
  List<ServiceRegistry>? get serviceRegistry =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRegistryWrapperCopyWith<ServiceRegistryWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRegistryWrapperCopyWith<$Res> {
  factory $ServiceRegistryWrapperCopyWith(ServiceRegistryWrapper value,
          $Res Function(ServiceRegistryWrapper) then) =
      _$ServiceRegistryWrapperCopyWithImpl<$Res, ServiceRegistryWrapper>;
  @useResult
  $Res call({List<ServiceRegistry>? serviceRegistry});
}

/// @nodoc
class _$ServiceRegistryWrapperCopyWithImpl<$Res,
        $Val extends ServiceRegistryWrapper>
    implements $ServiceRegistryWrapperCopyWith<$Res> {
  _$ServiceRegistryWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistry = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRegistry: freezed == serviceRegistry
          ? _value.serviceRegistry
          : serviceRegistry // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistry>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceRegistryWrapperImplCopyWith<$Res>
    implements $ServiceRegistryWrapperCopyWith<$Res> {
  factory _$$ServiceRegistryWrapperImplCopyWith(
          _$ServiceRegistryWrapperImpl value,
          $Res Function(_$ServiceRegistryWrapperImpl) then) =
      __$$ServiceRegistryWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ServiceRegistry>? serviceRegistry});
}

/// @nodoc
class __$$ServiceRegistryWrapperImplCopyWithImpl<$Res>
    extends _$ServiceRegistryWrapperCopyWithImpl<$Res,
        _$ServiceRegistryWrapperImpl>
    implements _$$ServiceRegistryWrapperImplCopyWith<$Res> {
  __$$ServiceRegistryWrapperImplCopyWithImpl(
      _$ServiceRegistryWrapperImpl _value,
      $Res Function(_$ServiceRegistryWrapperImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRegistry = freezed,
  }) {
    return _then(_$ServiceRegistryWrapperImpl(
      serviceRegistry: freezed == serviceRegistry
          ? _value._serviceRegistry
          : serviceRegistry // ignore: cast_nullable_to_non_nullable
              as List<ServiceRegistry>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRegistryWrapperImpl implements _ServiceRegistryWrapper {
  const _$ServiceRegistryWrapperImpl(
      {required final List<ServiceRegistry>? serviceRegistry})
      : _serviceRegistry = serviceRegistry;

  factory _$ServiceRegistryWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRegistryWrapperImplFromJson(json);

  final List<ServiceRegistry>? _serviceRegistry;
  @override
  List<ServiceRegistry>? get serviceRegistry {
    final value = _serviceRegistry;
    if (value == null) return null;
    if (_serviceRegistry is EqualUnmodifiableListView) return _serviceRegistry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceRegistryWrapper(serviceRegistry: $serviceRegistry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRegistryWrapperImpl &&
            const DeepCollectionEquality()
                .equals(other._serviceRegistry, _serviceRegistry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_serviceRegistry));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRegistryWrapperImplCopyWith<_$ServiceRegistryWrapperImpl>
      get copyWith => __$$ServiceRegistryWrapperImplCopyWithImpl<
          _$ServiceRegistryWrapperImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRegistryWrapperImplToJson(
      this,
    );
  }
}

abstract class _ServiceRegistryWrapper implements ServiceRegistryWrapper {
  const factory _ServiceRegistryWrapper(
          {required final List<ServiceRegistry>? serviceRegistry}) =
      _$ServiceRegistryWrapperImpl;

  factory _ServiceRegistryWrapper.fromJson(Map<String, dynamic> json) =
      _$ServiceRegistryWrapperImpl.fromJson;

  @override
  List<ServiceRegistry>? get serviceRegistry;
  @override
  @JsonKey(ignore: true)
  _$$ServiceRegistryWrapperImplCopyWith<_$ServiceRegistryWrapperImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ServiceRegistry _$ServiceRegistryFromJson(Map<String, dynamic> json) {
  return _ServiceRegistry.fromJson(json);
}

/// @nodoc
mixin _$ServiceRegistry {
  String? get service => throw _privateConstructorUsedError;
  List<Action>? get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRegistryCopyWith<ServiceRegistry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRegistryCopyWith<$Res> {
  factory $ServiceRegistryCopyWith(
          ServiceRegistry value, $Res Function(ServiceRegistry) then) =
      _$ServiceRegistryCopyWithImpl<$Res, ServiceRegistry>;
  @useResult
  $Res call({String? service, List<Action>? actions});
}

/// @nodoc
class _$ServiceRegistryCopyWithImpl<$Res, $Val extends ServiceRegistry>
    implements $ServiceRegistryCopyWith<$Res> {
  _$ServiceRegistryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? actions = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: freezed == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceRegistryImplCopyWith<$Res>
    implements $ServiceRegistryCopyWith<$Res> {
  factory _$$ServiceRegistryImplCopyWith(_$ServiceRegistryImpl value,
          $Res Function(_$ServiceRegistryImpl) then) =
      __$$ServiceRegistryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? service, List<Action>? actions});
}

/// @nodoc
class __$$ServiceRegistryImplCopyWithImpl<$Res>
    extends _$ServiceRegistryCopyWithImpl<$Res, _$ServiceRegistryImpl>
    implements _$$ServiceRegistryImplCopyWith<$Res> {
  __$$ServiceRegistryImplCopyWithImpl(
      _$ServiceRegistryImpl _value, $Res Function(_$ServiceRegistryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? actions = freezed,
  }) {
    return _then(_$ServiceRegistryImpl(
      freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRegistryImpl implements _ServiceRegistry {
  const _$ServiceRegistryImpl(this.service, final List<Action>? actions)
      : _actions = actions;

  factory _$ServiceRegistryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRegistryImplFromJson(json);

  @override
  final String? service;
  final List<Action>? _actions;
  @override
  List<Action>? get actions {
    final value = _actions;
    if (value == null) return null;
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ServiceRegistry(service: $service, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRegistryImpl &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, service, const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRegistryImplCopyWith<_$ServiceRegistryImpl> get copyWith =>
      __$$ServiceRegistryImplCopyWithImpl<_$ServiceRegistryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRegistryImplToJson(
      this,
    );
  }
}

abstract class _ServiceRegistry implements ServiceRegistry {
  const factory _ServiceRegistry(
          final String? service, final List<Action>? actions) =
      _$ServiceRegistryImpl;

  factory _ServiceRegistry.fromJson(Map<String, dynamic> json) =
      _$ServiceRegistryImpl.fromJson;

  @override
  String? get service;
  @override
  List<Action>? get actions;
  @override
  @JsonKey(ignore: true)
  _$$ServiceRegistryImplCopyWith<_$ServiceRegistryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Action _$ActionFromJson(Map<String, dynamic> json) {
  return _Action.fromJson(json);
}

/// @nodoc
mixin _$Action {
  String get action => throw _privateConstructorUsedError;
  String get entityName => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionCopyWith<Action> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionCopyWith<$Res> {
  factory $ActionCopyWith(Action value, $Res Function(Action) then) =
      _$ActionCopyWithImpl<$Res, Action>;
  @useResult
  $Res call({String action, String entityName, String path});
}

/// @nodoc
class _$ActionCopyWithImpl<$Res, $Val extends Action>
    implements $ActionCopyWith<$Res> {
  _$ActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? entityName = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      entityName: null == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActionImplCopyWith<$Res> implements $ActionCopyWith<$Res> {
  factory _$$ActionImplCopyWith(
          _$ActionImpl value, $Res Function(_$ActionImpl) then) =
      __$$ActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action, String entityName, String path});
}

/// @nodoc
class __$$ActionImplCopyWithImpl<$Res>
    extends _$ActionCopyWithImpl<$Res, _$ActionImpl>
    implements _$$ActionImplCopyWith<$Res> {
  __$$ActionImplCopyWithImpl(
      _$ActionImpl _value, $Res Function(_$ActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? entityName = null,
    Object? path = null,
  }) {
    return _then(_$ActionImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      entityName: null == entityName
          ? _value.entityName
          : entityName // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionImpl implements _Action {
  const _$ActionImpl(
      {required this.action, required this.entityName, required this.path});

  factory _$ActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionImplFromJson(json);

  @override
  final String action;
  @override
  final String entityName;
  @override
  final String path;

  @override
  String toString() {
    return 'Action(action: $action, entityName: $entityName, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.entityName, entityName) ||
                other.entityName == entityName) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action, entityName, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionImplCopyWith<_$ActionImpl> get copyWith =>
      __$$ActionImplCopyWithImpl<_$ActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionImplToJson(
      this,
    );
  }
}

abstract class _Action implements Action {
  const factory _Action(
      {required final String action,
      required final String entityName,
      required final String path}) = _$ActionImpl;

  factory _Action.fromJson(Map<String, dynamic> json) = _$ActionImpl.fromJson;

  @override
  String get action;
  @override
  String get entityName;
  @override
  String get path;
  @override
  @JsonKey(ignore: true)
  _$$ActionImplCopyWith<_$ActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
