// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) {
  return _LoginDataModel.fromJson(json);
}

/// @nodoc
mixin _$LoginDataModel {
  String get access_token => throw _privateConstructorUsedError;
  UserRequestModel get UserRequest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDataModelCopyWith<LoginDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataModelCopyWith<$Res> {
  factory $LoginDataModelCopyWith(
          LoginDataModel value, $Res Function(LoginDataModel) then) =
      _$LoginDataModelCopyWithImpl<$Res, LoginDataModel>;
  @useResult
  $Res call({String access_token, UserRequestModel UserRequest});

  $UserRequestModelCopyWith<$Res> get UserRequest;
}

/// @nodoc
class _$LoginDataModelCopyWithImpl<$Res, $Val extends LoginDataModel>
    implements $LoginDataModelCopyWith<$Res> {
  _$LoginDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? UserRequest = null,
  }) {
    return _then(_value.copyWith(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      UserRequest: null == UserRequest
          ? _value.UserRequest
          : UserRequest // ignore: cast_nullable_to_non_nullable
              as UserRequestModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRequestModelCopyWith<$Res> get UserRequest {
    return $UserRequestModelCopyWith<$Res>(_value.UserRequest, (value) {
      return _then(_value.copyWith(UserRequest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginDataModelCopyWith<$Res>
    implements $LoginDataModelCopyWith<$Res> {
  factory _$$_LoginDataModelCopyWith(
          _$_LoginDataModel value, $Res Function(_$_LoginDataModel) then) =
      __$$_LoginDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access_token, UserRequestModel UserRequest});

  @override
  $UserRequestModelCopyWith<$Res> get UserRequest;
}

/// @nodoc
class __$$_LoginDataModelCopyWithImpl<$Res>
    extends _$LoginDataModelCopyWithImpl<$Res, _$_LoginDataModel>
    implements _$$_LoginDataModelCopyWith<$Res> {
  __$$_LoginDataModelCopyWithImpl(
      _$_LoginDataModel _value, $Res Function(_$_LoginDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? UserRequest = null,
  }) {
    return _then(_$_LoginDataModel(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      UserRequest: null == UserRequest
          ? _value.UserRequest
          : UserRequest // ignore: cast_nullable_to_non_nullable
              as UserRequestModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginDataModel implements _LoginDataModel {
  const _$_LoginDataModel(
      {required this.access_token, required this.UserRequest});

  factory _$_LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginDataModelFromJson(json);

  @override
  final String access_token;
  @override
  final UserRequestModel UserRequest;

  @override
  String toString() {
    return 'LoginDataModel(access_token: $access_token, UserRequest: $UserRequest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginDataModel &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.UserRequest, UserRequest) ||
                other.UserRequest == UserRequest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access_token, UserRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginDataModelCopyWith<_$_LoginDataModel> get copyWith =>
      __$$_LoginDataModelCopyWithImpl<_$_LoginDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginDataModelToJson(
      this,
    );
  }
}

abstract class _LoginDataModel implements LoginDataModel {
  const factory _LoginDataModel(
      {required final String access_token,
      required final UserRequestModel UserRequest}) = _$_LoginDataModel;

  factory _LoginDataModel.fromJson(Map<String, dynamic> json) =
      _$_LoginDataModel.fromJson;

  @override
  String get access_token;
  @override
  UserRequestModel get UserRequest;
  @override
  @JsonKey(ignore: true)
  _$$_LoginDataModelCopyWith<_$_LoginDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRequestModel _$UserRequestModelFromJson(Map<String, dynamic> json) {
  return _UserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$UserRequestModel {
  String get uuid => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestModelCopyWith<UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestModelCopyWith<$Res> {
  factory $UserRequestModelCopyWith(
          UserRequestModel value, $Res Function(UserRequestModel) then) =
      _$UserRequestModelCopyWithImpl<$Res, UserRequestModel>;
  @useResult
  $Res call({String uuid, String tenantId, String name, String mobileNumber});
}

/// @nodoc
class _$UserRequestModelCopyWithImpl<$Res, $Val extends UserRequestModel>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? tenantId = null,
    Object? name = null,
    Object? mobileNumber = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRequestModelCopyWith<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  factory _$$_UserRequestModelCopyWith(
          _$_UserRequestModel value, $Res Function(_$_UserRequestModel) then) =
      __$$_UserRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String tenantId, String name, String mobileNumber});
}

/// @nodoc
class __$$_UserRequestModelCopyWithImpl<$Res>
    extends _$UserRequestModelCopyWithImpl<$Res, _$_UserRequestModel>
    implements _$$_UserRequestModelCopyWith<$Res> {
  __$$_UserRequestModelCopyWithImpl(
      _$_UserRequestModel _value, $Res Function(_$_UserRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? tenantId = null,
    Object? name = null,
    Object? mobileNumber = null,
  }) {
    return _then(_$_UserRequestModel(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRequestModel implements _UserRequestModel {
  const _$_UserRequestModel(
      {required this.uuid,
      required this.tenantId,
      required this.name,
      required this.mobileNumber});

  factory _$_UserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserRequestModelFromJson(json);

  @override
  final String uuid;
  @override
  final String tenantId;
  @override
  final String name;
  @override
  final String mobileNumber;

  @override
  String toString() {
    return 'UserRequestModel(uuid: $uuid, tenantId: $tenantId, name: $name, mobileNumber: $mobileNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRequestModel &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, tenantId, name, mobileNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRequestModelCopyWith<_$_UserRequestModel> get copyWith =>
      __$$_UserRequestModelCopyWithImpl<_$_UserRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRequestModelToJson(
      this,
    );
  }
}

abstract class _UserRequestModel implements UserRequestModel {
  const factory _UserRequestModel(
      {required final String uuid,
      required final String tenantId,
      required final String name,
      required final String mobileNumber}) = _$_UserRequestModel;

  factory _UserRequestModel.fromJson(Map<String, dynamic> json) =
      _$_UserRequestModel.fromJson;

  @override
  String get uuid;
  @override
  String get tenantId;
  @override
  String get name;
  @override
  String get mobileNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserRequestModelCopyWith<_$_UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
