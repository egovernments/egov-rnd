// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_actions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoleActionsWrapperModel _$RoleActionsWrapperModelFromJson(
    Map<String, dynamic> json) {
  return _RoleActionsWrapperModel.fromJson(json);
}

/// @nodoc
mixin _$RoleActionsWrapperModel {
  @JsonKey(name: 'actions')
  List<RoleActionsModel> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleActionsWrapperModelCopyWith<RoleActionsWrapperModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleActionsWrapperModelCopyWith<$Res> {
  factory $RoleActionsWrapperModelCopyWith(RoleActionsWrapperModel value,
          $Res Function(RoleActionsWrapperModel) then) =
      _$RoleActionsWrapperModelCopyWithImpl<$Res, RoleActionsWrapperModel>;
  @useResult
  $Res call({@JsonKey(name: 'actions') List<RoleActionsModel> actions});
}

/// @nodoc
class _$RoleActionsWrapperModelCopyWithImpl<$Res,
        $Val extends RoleActionsWrapperModel>
    implements $RoleActionsWrapperModelCopyWith<$Res> {
  _$RoleActionsWrapperModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<RoleActionsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleActionsWrapperModelImplCopyWith<$Res>
    implements $RoleActionsWrapperModelCopyWith<$Res> {
  factory _$$RoleActionsWrapperModelImplCopyWith(
          _$RoleActionsWrapperModelImpl value,
          $Res Function(_$RoleActionsWrapperModelImpl) then) =
      __$$RoleActionsWrapperModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'actions') List<RoleActionsModel> actions});
}

/// @nodoc
class __$$RoleActionsWrapperModelImplCopyWithImpl<$Res>
    extends _$RoleActionsWrapperModelCopyWithImpl<$Res,
        _$RoleActionsWrapperModelImpl>
    implements _$$RoleActionsWrapperModelImplCopyWith<$Res> {
  __$$RoleActionsWrapperModelImplCopyWithImpl(
      _$RoleActionsWrapperModelImpl _value,
      $Res Function(_$RoleActionsWrapperModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actions = null,
  }) {
    return _then(_$RoleActionsWrapperModelImpl(
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<RoleActionsModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$RoleActionsWrapperModelImpl implements _RoleActionsWrapperModel {
  const _$RoleActionsWrapperModelImpl(
      {@JsonKey(name: 'actions')
      final List<RoleActionsModel> actions = const []})
      : _actions = actions;

  factory _$RoleActionsWrapperModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleActionsWrapperModelImplFromJson(json);

  final List<RoleActionsModel> _actions;
  @override
  @JsonKey(name: 'actions')
  List<RoleActionsModel> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'RoleActionsWrapperModel(actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleActionsWrapperModelImpl &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleActionsWrapperModelImplCopyWith<_$RoleActionsWrapperModelImpl>
      get copyWith => __$$RoleActionsWrapperModelImplCopyWithImpl<
          _$RoleActionsWrapperModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleActionsWrapperModelImplToJson(
      this,
    );
  }
}

abstract class _RoleActionsWrapperModel implements RoleActionsWrapperModel {
  const factory _RoleActionsWrapperModel(
          {@JsonKey(name: 'actions') final List<RoleActionsModel> actions}) =
      _$RoleActionsWrapperModelImpl;

  factory _RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) =
      _$RoleActionsWrapperModelImpl.fromJson;

  @override
  @JsonKey(name: 'actions')
  List<RoleActionsModel> get actions;
  @override
  @JsonKey(ignore: true)
  _$$RoleActionsWrapperModelImplCopyWith<_$RoleActionsWrapperModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RoleActionsModel _$RoleActionsModelFromJson(Map<String, dynamic> json) {
  return _RoleActionsModel.fromJson(json);
}

/// @nodoc
mixin _$RoleActionsModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName')
  String? get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNumber')
  num? get orderNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'queryParams')
  String? get queryParams => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentModule')
  String? get parentModule => throw _privateConstructorUsedError;
  @JsonKey(name: 'enabled')
  bool get enabled => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceCode')
  String? get serviceCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenantId')
  String get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDate')
  String? get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastModifiedDate')
  String? get lastModifiedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastModifiedBy')
  String? get lastModifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'navigationURL')
  String? get navigationURL => throw _privateConstructorUsedError;
  @JsonKey(name: 'leftIcon')
  String? get leftIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'rightIcon')
  String? get rightIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleActionsModelCopyWith<RoleActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleActionsModelCopyWith<$Res> {
  factory $RoleActionsModelCopyWith(
          RoleActionsModel value, $Res Function(RoleActionsModel) then) =
      _$RoleActionsModelCopyWithImpl<$Res, RoleActionsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'displayName') String? displayName,
      @JsonKey(name: 'orderNumber') num? orderNumber,
      @JsonKey(name: 'queryParams') String? queryParams,
      @JsonKey(name: 'parentModule') String? parentModule,
      @JsonKey(name: 'enabled') bool enabled,
      @JsonKey(name: 'serviceCode') String? serviceCode,
      @JsonKey(name: 'tenantId') String tenantId,
      @JsonKey(name: 'createdDate') String? createdDate,
      @JsonKey(name: 'createdBy') String? createdBy,
      @JsonKey(name: 'lastModifiedDate') String? lastModifiedDate,
      @JsonKey(name: 'lastModifiedBy') String? lastModifiedBy,
      @JsonKey(name: 'path') String? path,
      @JsonKey(name: 'navigationURL') String? navigationURL,
      @JsonKey(name: 'leftIcon') String? leftIcon,
      @JsonKey(name: 'rightIcon') String? rightIcon});
}

/// @nodoc
class _$RoleActionsModelCopyWithImpl<$Res, $Val extends RoleActionsModel>
    implements $RoleActionsModelCopyWith<$Res> {
  _$RoleActionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? url = freezed,
    Object? displayName = freezed,
    Object? orderNumber = freezed,
    Object? queryParams = freezed,
    Object? parentModule = freezed,
    Object? enabled = null,
    Object? serviceCode = freezed,
    Object? tenantId = null,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? lastModifiedDate = freezed,
    Object? lastModifiedBy = freezed,
    Object? path = freezed,
    Object? navigationURL = freezed,
    Object? leftIcon = freezed,
    Object? rightIcon = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as num?,
      queryParams: freezed == queryParams
          ? _value.queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as String?,
      parentModule: freezed == parentModule
          ? _value.parentModule
          : parentModule // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceCode: freezed == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      navigationURL: freezed == navigationURL
          ? _value.navigationURL
          : navigationURL // ignore: cast_nullable_to_non_nullable
              as String?,
      leftIcon: freezed == leftIcon
          ? _value.leftIcon
          : leftIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      rightIcon: freezed == rightIcon
          ? _value.rightIcon
          : rightIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoleActionsModelImplCopyWith<$Res>
    implements $RoleActionsModelCopyWith<$Res> {
  factory _$$RoleActionsModelImplCopyWith(_$RoleActionsModelImpl value,
          $Res Function(_$RoleActionsModelImpl) then) =
      __$$RoleActionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'displayName') String? displayName,
      @JsonKey(name: 'orderNumber') num? orderNumber,
      @JsonKey(name: 'queryParams') String? queryParams,
      @JsonKey(name: 'parentModule') String? parentModule,
      @JsonKey(name: 'enabled') bool enabled,
      @JsonKey(name: 'serviceCode') String? serviceCode,
      @JsonKey(name: 'tenantId') String tenantId,
      @JsonKey(name: 'createdDate') String? createdDate,
      @JsonKey(name: 'createdBy') String? createdBy,
      @JsonKey(name: 'lastModifiedDate') String? lastModifiedDate,
      @JsonKey(name: 'lastModifiedBy') String? lastModifiedBy,
      @JsonKey(name: 'path') String? path,
      @JsonKey(name: 'navigationURL') String? navigationURL,
      @JsonKey(name: 'leftIcon') String? leftIcon,
      @JsonKey(name: 'rightIcon') String? rightIcon});
}

/// @nodoc
class __$$RoleActionsModelImplCopyWithImpl<$Res>
    extends _$RoleActionsModelCopyWithImpl<$Res, _$RoleActionsModelImpl>
    implements _$$RoleActionsModelImplCopyWith<$Res> {
  __$$RoleActionsModelImplCopyWithImpl(_$RoleActionsModelImpl _value,
      $Res Function(_$RoleActionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? url = freezed,
    Object? displayName = freezed,
    Object? orderNumber = freezed,
    Object? queryParams = freezed,
    Object? parentModule = freezed,
    Object? enabled = null,
    Object? serviceCode = freezed,
    Object? tenantId = null,
    Object? createdDate = freezed,
    Object? createdBy = freezed,
    Object? lastModifiedDate = freezed,
    Object? lastModifiedBy = freezed,
    Object? path = freezed,
    Object? navigationURL = freezed,
    Object? leftIcon = freezed,
    Object? rightIcon = freezed,
  }) {
    return _then(_$RoleActionsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      orderNumber: freezed == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as num?,
      queryParams: freezed == queryParams
          ? _value.queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as String?,
      parentModule: freezed == parentModule
          ? _value.parentModule
          : parentModule // ignore: cast_nullable_to_non_nullable
              as String?,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      serviceCode: freezed == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      navigationURL: freezed == navigationURL
          ? _value.navigationURL
          : navigationURL // ignore: cast_nullable_to_non_nullable
              as String?,
      leftIcon: freezed == leftIcon
          ? _value.leftIcon
          : leftIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      rightIcon: freezed == rightIcon
          ? _value.rightIcon
          : rightIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RoleActionsModelImpl implements _RoleActionsModel {
  const _$RoleActionsModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'displayName') this.displayName,
      @JsonKey(name: 'orderNumber') this.orderNumber,
      @JsonKey(name: 'queryParams') this.queryParams,
      @JsonKey(name: 'parentModule') this.parentModule,
      @JsonKey(name: 'enabled') required this.enabled,
      @JsonKey(name: 'serviceCode') this.serviceCode,
      @JsonKey(name: 'tenantId') required this.tenantId,
      @JsonKey(name: 'createdDate') this.createdDate,
      @JsonKey(name: 'createdBy') this.createdBy,
      @JsonKey(name: 'lastModifiedDate') this.lastModifiedDate,
      @JsonKey(name: 'lastModifiedBy') this.lastModifiedBy,
      @JsonKey(name: 'path') this.path,
      @JsonKey(name: 'navigationURL') this.navigationURL,
      @JsonKey(name: 'leftIcon') this.leftIcon,
      @JsonKey(name: 'rightIcon') this.rightIcon});

  factory _$RoleActionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleActionsModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'displayName')
  final String? displayName;
  @override
  @JsonKey(name: 'orderNumber')
  final num? orderNumber;
  @override
  @JsonKey(name: 'queryParams')
  final String? queryParams;
  @override
  @JsonKey(name: 'parentModule')
  final String? parentModule;
  @override
  @JsonKey(name: 'enabled')
  final bool enabled;
  @override
  @JsonKey(name: 'serviceCode')
  final String? serviceCode;
  @override
  @JsonKey(name: 'tenantId')
  final String tenantId;
  @override
  @JsonKey(name: 'createdDate')
  final String? createdDate;
  @override
  @JsonKey(name: 'createdBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'lastModifiedDate')
  final String? lastModifiedDate;
  @override
  @JsonKey(name: 'lastModifiedBy')
  final String? lastModifiedBy;
  @override
  @JsonKey(name: 'path')
  final String? path;
  @override
  @JsonKey(name: 'navigationURL')
  final String? navigationURL;
  @override
  @JsonKey(name: 'leftIcon')
  final String? leftIcon;
  @override
  @JsonKey(name: 'rightIcon')
  final String? rightIcon;

  @override
  String toString() {
    return 'RoleActionsModel(id: $id, name: $name, url: $url, displayName: $displayName, orderNumber: $orderNumber, queryParams: $queryParams, parentModule: $parentModule, enabled: $enabled, serviceCode: $serviceCode, tenantId: $tenantId, createdDate: $createdDate, createdBy: $createdBy, lastModifiedDate: $lastModifiedDate, lastModifiedBy: $lastModifiedBy, path: $path, navigationURL: $navigationURL, leftIcon: $leftIcon, rightIcon: $rightIcon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleActionsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.queryParams, queryParams) ||
                other.queryParams == queryParams) &&
            (identical(other.parentModule, parentModule) ||
                other.parentModule == parentModule) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.navigationURL, navigationURL) ||
                other.navigationURL == navigationURL) &&
            (identical(other.leftIcon, leftIcon) ||
                other.leftIcon == leftIcon) &&
            (identical(other.rightIcon, rightIcon) ||
                other.rightIcon == rightIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      url,
      displayName,
      orderNumber,
      queryParams,
      parentModule,
      enabled,
      serviceCode,
      tenantId,
      createdDate,
      createdBy,
      lastModifiedDate,
      lastModifiedBy,
      path,
      navigationURL,
      leftIcon,
      rightIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleActionsModelImplCopyWith<_$RoleActionsModelImpl> get copyWith =>
      __$$RoleActionsModelImplCopyWithImpl<_$RoleActionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleActionsModelImplToJson(
      this,
    );
  }
}

abstract class _RoleActionsModel implements RoleActionsModel {
  const factory _RoleActionsModel(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'url') final String? url,
          @JsonKey(name: 'displayName') final String? displayName,
          @JsonKey(name: 'orderNumber') final num? orderNumber,
          @JsonKey(name: 'queryParams') final String? queryParams,
          @JsonKey(name: 'parentModule') final String? parentModule,
          @JsonKey(name: 'enabled') required final bool enabled,
          @JsonKey(name: 'serviceCode') final String? serviceCode,
          @JsonKey(name: 'tenantId') required final String tenantId,
          @JsonKey(name: 'createdDate') final String? createdDate,
          @JsonKey(name: 'createdBy') final String? createdBy,
          @JsonKey(name: 'lastModifiedDate') final String? lastModifiedDate,
          @JsonKey(name: 'lastModifiedBy') final String? lastModifiedBy,
          @JsonKey(name: 'path') final String? path,
          @JsonKey(name: 'navigationURL') final String? navigationURL,
          @JsonKey(name: 'leftIcon') final String? leftIcon,
          @JsonKey(name: 'rightIcon') final String? rightIcon}) =
      _$RoleActionsModelImpl;

  factory _RoleActionsModel.fromJson(Map<String, dynamic> json) =
      _$RoleActionsModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'displayName')
  String? get displayName;
  @override
  @JsonKey(name: 'orderNumber')
  num? get orderNumber;
  @override
  @JsonKey(name: 'queryParams')
  String? get queryParams;
  @override
  @JsonKey(name: 'parentModule')
  String? get parentModule;
  @override
  @JsonKey(name: 'enabled')
  bool get enabled;
  @override
  @JsonKey(name: 'serviceCode')
  String? get serviceCode;
  @override
  @JsonKey(name: 'tenantId')
  String get tenantId;
  @override
  @JsonKey(name: 'createdDate')
  String? get createdDate;
  @override
  @JsonKey(name: 'createdBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'lastModifiedDate')
  String? get lastModifiedDate;
  @override
  @JsonKey(name: 'lastModifiedBy')
  String? get lastModifiedBy;
  @override
  @JsonKey(name: 'path')
  String? get path;
  @override
  @JsonKey(name: 'navigationURL')
  String? get navigationURL;
  @override
  @JsonKey(name: 'leftIcon')
  String? get leftIcon;
  @override
  @JsonKey(name: 'rightIcon')
  String? get rightIcon;
  @override
  @JsonKey(ignore: true)
  _$$RoleActionsModelImplCopyWith<_$RoleActionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
