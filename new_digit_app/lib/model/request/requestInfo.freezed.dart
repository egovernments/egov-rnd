// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requestInfo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestInfoModel _$RequestInfoModelFromJson(Map<String, dynamic> json) {
  return _RequestInfoModel.fromJson(json);
}

/// @nodoc
mixin _$RequestInfoModel {
  String? get apiId => throw _privateConstructorUsedError;
  String? get ver => throw _privateConstructorUsedError;
  num? get ts => throw _privateConstructorUsedError;
  String? get action => throw _privateConstructorUsedError;
  String? get did => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get msgId => throw _privateConstructorUsedError;
  String? get authToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestInfoModelCopyWith<RequestInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestInfoModelCopyWith<$Res> {
  factory $RequestInfoModelCopyWith(
          RequestInfoModel value, $Res Function(RequestInfoModel) then) =
      _$RequestInfoModelCopyWithImpl<$Res, RequestInfoModel>;
  @useResult
  $Res call(
      {String? apiId,
      String? ver,
      num? ts,
      String? action,
      String? did,
      String? key,
      String? msgId,
      String? authToken});
}

/// @nodoc
class _$RequestInfoModelCopyWithImpl<$Res, $Val extends RequestInfoModel>
    implements $RequestInfoModelCopyWith<$Res> {
  _$RequestInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiId = freezed,
    Object? ver = freezed,
    Object? ts = freezed,
    Object? action = freezed,
    Object? did = freezed,
    Object? key = freezed,
    Object? msgId = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_value.copyWith(
      apiId: freezed == apiId
          ? _value.apiId
          : apiId // ignore: cast_nullable_to_non_nullable
              as String?,
      ver: freezed == ver
          ? _value.ver
          : ver // ignore: cast_nullable_to_non_nullable
              as String?,
      ts: freezed == ts
          ? _value.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as num?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      did: freezed == did
          ? _value.did
          : did // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      msgId: freezed == msgId
          ? _value.msgId
          : msgId // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestInfoModelImplCopyWith<$Res>
    implements $RequestInfoModelCopyWith<$Res> {
  factory _$$RequestInfoModelImplCopyWith(_$RequestInfoModelImpl value,
          $Res Function(_$RequestInfoModelImpl) then) =
      __$$RequestInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? apiId,
      String? ver,
      num? ts,
      String? action,
      String? did,
      String? key,
      String? msgId,
      String? authToken});
}

/// @nodoc
class __$$RequestInfoModelImplCopyWithImpl<$Res>
    extends _$RequestInfoModelCopyWithImpl<$Res, _$RequestInfoModelImpl>
    implements _$$RequestInfoModelImplCopyWith<$Res> {
  __$$RequestInfoModelImplCopyWithImpl(_$RequestInfoModelImpl _value,
      $Res Function(_$RequestInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiId = freezed,
    Object? ver = freezed,
    Object? ts = freezed,
    Object? action = freezed,
    Object? did = freezed,
    Object? key = freezed,
    Object? msgId = freezed,
    Object? authToken = freezed,
  }) {
    return _then(_$RequestInfoModelImpl(
      apiId: freezed == apiId
          ? _value.apiId
          : apiId // ignore: cast_nullable_to_non_nullable
              as String?,
      ver: freezed == ver
          ? _value.ver
          : ver // ignore: cast_nullable_to_non_nullable
              as String?,
      ts: freezed == ts
          ? _value.ts
          : ts // ignore: cast_nullable_to_non_nullable
              as num?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      did: freezed == did
          ? _value.did
          : did // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      msgId: freezed == msgId
          ? _value.msgId
          : msgId // ignore: cast_nullable_to_non_nullable
              as String?,
      authToken: freezed == authToken
          ? _value.authToken
          : authToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$RequestInfoModelImpl implements _RequestInfoModel {
  const _$RequestInfoModelImpl(
      {this.apiId,
      this.ver,
      this.ts,
      this.action,
      this.did,
      this.key,
      this.msgId,
      this.authToken});

  factory _$RequestInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestInfoModelImplFromJson(json);

  @override
  final String? apiId;
  @override
  final String? ver;
  @override
  final num? ts;
  @override
  final String? action;
  @override
  final String? did;
  @override
  final String? key;
  @override
  final String? msgId;
  @override
  final String? authToken;

  @override
  String toString() {
    return 'RequestInfoModel(apiId: $apiId, ver: $ver, ts: $ts, action: $action, did: $did, key: $key, msgId: $msgId, authToken: $authToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestInfoModelImpl &&
            (identical(other.apiId, apiId) || other.apiId == apiId) &&
            (identical(other.ver, ver) || other.ver == ver) &&
            (identical(other.ts, ts) || other.ts == ts) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.did, did) || other.did == did) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.msgId, msgId) || other.msgId == msgId) &&
            (identical(other.authToken, authToken) ||
                other.authToken == authToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, apiId, ver, ts, action, did, key, msgId, authToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestInfoModelImplCopyWith<_$RequestInfoModelImpl> get copyWith =>
      __$$RequestInfoModelImplCopyWithImpl<_$RequestInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestInfoModelImplToJson(
      this,
    );
  }
}

abstract class _RequestInfoModel implements RequestInfoModel {
  const factory _RequestInfoModel(
      {final String? apiId,
      final String? ver,
      final num? ts,
      final String? action,
      final String? did,
      final String? key,
      final String? msgId,
      final String? authToken}) = _$RequestInfoModelImpl;

  factory _RequestInfoModel.fromJson(Map<String, dynamic> json) =
      _$RequestInfoModelImpl.fromJson;

  @override
  String? get apiId;
  @override
  String? get ver;
  @override
  num? get ts;
  @override
  String? get action;
  @override
  String? get did;
  @override
  String? get key;
  @override
  String? get msgId;
  @override
  String? get authToken;
  @override
  @JsonKey(ignore: true)
  _$$RequestInfoModelImplCopyWith<_$RequestInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
