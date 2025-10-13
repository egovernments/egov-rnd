// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'responsemodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return _ResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseModel {
  String get access_token => throw _privateConstructorUsedError;
  String? get token_type => throw _privateConstructorUsedError;
  String? get refresh_token => throw _privateConstructorUsedError;
  String? get scope => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserRequest')
  UserRequest? get userRequest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseModelCopyWith<ResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseModelCopyWith<$Res> {
  factory $ResponseModelCopyWith(
          ResponseModel value, $Res Function(ResponseModel) then) =
      _$ResponseModelCopyWithImpl<$Res, ResponseModel>;
  @useResult
  $Res call(
      {String access_token,
      String? token_type,
      String? refresh_token,
      String? scope,
      @JsonKey(name: 'UserRequest') UserRequest? userRequest});

  $UserRequestCopyWith<$Res>? get userRequest;
}

/// @nodoc
class _$ResponseModelCopyWithImpl<$Res, $Val extends ResponseModel>
    implements $ResponseModelCopyWith<$Res> {
  _$ResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? token_type = freezed,
    Object? refresh_token = freezed,
    Object? scope = freezed,
    Object? userRequest = freezed,
  }) {
    return _then(_value.copyWith(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      token_type: freezed == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String?,
      refresh_token: freezed == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      userRequest: freezed == userRequest
          ? _value.userRequest
          : userRequest // ignore: cast_nullable_to_non_nullable
              as UserRequest?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRequestCopyWith<$Res>? get userRequest {
    if (_value.userRequest == null) {
      return null;
    }

    return $UserRequestCopyWith<$Res>(_value.userRequest!, (value) {
      return _then(_value.copyWith(userRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseModelImplCopyWith<$Res>
    implements $ResponseModelCopyWith<$Res> {
  factory _$$ResponseModelImplCopyWith(
          _$ResponseModelImpl value, $Res Function(_$ResponseModelImpl) then) =
      __$$ResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String access_token,
      String? token_type,
      String? refresh_token,
      String? scope,
      @JsonKey(name: 'UserRequest') UserRequest? userRequest});

  @override
  $UserRequestCopyWith<$Res>? get userRequest;
}

/// @nodoc
class __$$ResponseModelImplCopyWithImpl<$Res>
    extends _$ResponseModelCopyWithImpl<$Res, _$ResponseModelImpl>
    implements _$$ResponseModelImplCopyWith<$Res> {
  __$$ResponseModelImplCopyWithImpl(
      _$ResponseModelImpl _value, $Res Function(_$ResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? token_type = freezed,
    Object? refresh_token = freezed,
    Object? scope = freezed,
    Object? userRequest = freezed,
  }) {
    return _then(_$ResponseModelImpl(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      token_type: freezed == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String?,
      refresh_token: freezed == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String?,
      scope: freezed == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String?,
      userRequest: freezed == userRequest
          ? _value.userRequest
          : userRequest // ignore: cast_nullable_to_non_nullable
              as UserRequest?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseModelImpl implements _ResponseModel {
  const _$ResponseModelImpl(
      {required this.access_token,
      required this.token_type,
      required this.refresh_token,
      required this.scope,
      @JsonKey(name: 'UserRequest') required this.userRequest});

  factory _$ResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseModelImplFromJson(json);

  @override
  final String access_token;
  @override
  final String? token_type;
  @override
  final String? refresh_token;
  @override
  final String? scope;
  @override
  @JsonKey(name: 'UserRequest')
  final UserRequest? userRequest;

  @override
  String toString() {
    return 'ResponseModel(access_token: $access_token, token_type: $token_type, refresh_token: $refresh_token, scope: $scope, userRequest: $userRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseModelImpl &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.token_type, token_type) ||
                other.token_type == token_type) &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.userRequest, userRequest) ||
                other.userRequest == userRequest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, access_token, token_type, refresh_token, scope, userRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseModelImplCopyWith<_$ResponseModelImpl> get copyWith =>
      __$$ResponseModelImplCopyWithImpl<_$ResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseModel implements ResponseModel {
  const factory _ResponseModel(
      {required final String access_token,
      required final String? token_type,
      required final String? refresh_token,
      required final String? scope,
      @JsonKey(name: 'UserRequest')
      required final UserRequest? userRequest}) = _$ResponseModelImpl;

  factory _ResponseModel.fromJson(Map<String, dynamic> json) =
      _$ResponseModelImpl.fromJson;

  @override
  String get access_token;
  @override
  String? get token_type;
  @override
  String? get refresh_token;
  @override
  String? get scope;
  @override
  @JsonKey(name: 'UserRequest')
  UserRequest? get userRequest;
  @override
  @JsonKey(ignore: true)
  _$$ResponseModelImplCopyWith<_$ResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return _UserRequest.fromJson(json);
}

/// @nodoc
mixin _$UserRequest {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get mobileNumber => throw _privateConstructorUsedError;
  String? get emailId => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get active => throw _privateConstructorUsedError;
  List<Roles> get roles => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestCopyWith<UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestCopyWith<$Res> {
  factory $UserRequestCopyWith(
          UserRequest value, $Res Function(UserRequest) then) =
      _$UserRequestCopyWithImpl<$Res, UserRequest>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String? userName,
      String? name,
      String? mobileNumber,
      String? emailId,
      String? type,
      bool? active,
      List<Roles> roles,
      String tenantId});
}

/// @nodoc
class _$UserRequestCopyWithImpl<$Res, $Val extends UserRequest>
    implements $UserRequestCopyWith<$Res> {
  _$UserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? userName = freezed,
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? type = freezed,
    Object? active = freezed,
    Object? roles = null,
    Object? tenantId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      roles: null == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Roles>,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRequestImplCopyWith<$Res>
    implements $UserRequestCopyWith<$Res> {
  factory _$$UserRequestImplCopyWith(
          _$UserRequestImpl value, $Res Function(_$UserRequestImpl) then) =
      __$$UserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String? userName,
      String? name,
      String? mobileNumber,
      String? emailId,
      String? type,
      bool? active,
      List<Roles> roles,
      String tenantId});
}

/// @nodoc
class __$$UserRequestImplCopyWithImpl<$Res>
    extends _$UserRequestCopyWithImpl<$Res, _$UserRequestImpl>
    implements _$$UserRequestImplCopyWith<$Res> {
  __$$UserRequestImplCopyWithImpl(
      _$UserRequestImpl _value, $Res Function(_$UserRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? userName = freezed,
    Object? name = freezed,
    Object? mobileNumber = freezed,
    Object? emailId = freezed,
    Object? type = freezed,
    Object? active = freezed,
    Object? roles = null,
    Object? tenantId = null,
  }) {
    return _then(_$UserRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      roles: null == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Roles>,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRequestImpl implements _UserRequest {
  const _$UserRequestImpl(
      {required this.id,
      required this.uuid,
      required this.userName,
      required this.name,
      required this.mobileNumber,
      required this.emailId,
      required this.type,
      required this.active,
      required final List<Roles> roles,
      required this.tenantId})
      : _roles = roles;

  factory _$UserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRequestImplFromJson(json);

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String? userName;
  @override
  final String? name;
  @override
  final String? mobileNumber;
  @override
  final String? emailId;
  @override
  final String? type;
  @override
  final bool? active;
  final List<Roles> _roles;
  @override
  List<Roles> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  final String tenantId;

  @override
  String toString() {
    return 'UserRequest(id: $id, uuid: $uuid, userName: $userName, name: $name, mobileNumber: $mobileNumber, emailId: $emailId, type: $type, active: $active, roles: $roles, tenantId: $tenantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      userName,
      name,
      mobileNumber,
      emailId,
      type,
      active,
      const DeepCollectionEquality().hash(_roles),
      tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRequestImplCopyWith<_$UserRequestImpl> get copyWith =>
      __$$UserRequestImplCopyWithImpl<_$UserRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRequestImplToJson(
      this,
    );
  }
}

abstract class _UserRequest implements UserRequest {
  const factory _UserRequest(
      {required final int id,
      required final String uuid,
      required final String? userName,
      required final String? name,
      required final String? mobileNumber,
      required final String? emailId,
      required final String? type,
      required final bool? active,
      required final List<Roles> roles,
      required final String tenantId}) = _$UserRequestImpl;

  factory _UserRequest.fromJson(Map<String, dynamic> json) =
      _$UserRequestImpl.fromJson;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String? get userName;
  @override
  String? get name;
  @override
  String? get mobileNumber;
  @override
  String? get emailId;
  @override
  String? get type;
  @override
  bool? get active;
  @override
  List<Roles> get roles;
  @override
  String get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$UserRequestImplCopyWith<_$UserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Roles _$RolesFromJson(Map<String, dynamic> json) {
  return _Roles.fromJson(json);
}

/// @nodoc
mixin _$Roles {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get tenantId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RolesCopyWith<Roles> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RolesCopyWith<$Res> {
  factory $RolesCopyWith(Roles value, $Res Function(Roles) then) =
      _$RolesCopyWithImpl<$Res, Roles>;
  @useResult
  $Res call({String? name, String? code, String? tenantId});
}

/// @nodoc
class _$RolesCopyWithImpl<$Res, $Val extends Roles>
    implements $RolesCopyWith<$Res> {
  _$RolesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RolesImplCopyWith<$Res> implements $RolesCopyWith<$Res> {
  factory _$$RolesImplCopyWith(
          _$RolesImpl value, $Res Function(_$RolesImpl) then) =
      __$$RolesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? code, String? tenantId});
}

/// @nodoc
class __$$RolesImplCopyWithImpl<$Res>
    extends _$RolesCopyWithImpl<$Res, _$RolesImpl>
    implements _$$RolesImplCopyWith<$Res> {
  __$$RolesImplCopyWithImpl(
      _$RolesImpl _value, $Res Function(_$RolesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? tenantId = freezed,
  }) {
    return _then(_$RolesImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RolesImpl implements _Roles {
  const _$RolesImpl(
      {required this.name, required this.code, required this.tenantId});

  factory _$RolesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RolesImplFromJson(json);

  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? tenantId;

  @override
  String toString() {
    return 'Roles(name: $name, code: $code, tenantId: $tenantId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RolesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code, tenantId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RolesImplCopyWith<_$RolesImpl> get copyWith =>
      __$$RolesImplCopyWithImpl<_$RolesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RolesImplToJson(
      this,
    );
  }
}

abstract class _Roles implements Roles {
  const factory _Roles(
      {required final String? name,
      required final String? code,
      required final String? tenantId}) = _$RolesImpl;

  factory _Roles.fromJson(Map<String, dynamic> json) = _$RolesImpl.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get tenantId;
  @override
  @JsonKey(ignore: true)
  _$$RolesImplCopyWith<_$RolesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
