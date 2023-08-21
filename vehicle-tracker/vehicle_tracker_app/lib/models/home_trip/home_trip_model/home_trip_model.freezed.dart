// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_trip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeTripModel _$HomeTripModelFromJson(Map<String, dynamic> json) {
  return _HomeTripModel.fromJson(json);
}

/// @nodoc
mixin _$HomeTripModel {
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get routeId => throw _privateConstructorUsedError;
  set routeId(String value) => throw _privateConstructorUsedError;
  String get serviceCode => throw _privateConstructorUsedError;
  set serviceCode(String value) => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  set status(String value) => throw _privateConstructorUsedError;
  String? get plannedStartTime => throw _privateConstructorUsedError;
  set plannedStartTime(String? value) => throw _privateConstructorUsedError;
  String? get plannedEndTime => throw _privateConstructorUsedError;
  set plannedEndTime(String? value) => throw _privateConstructorUsedError;
  Operator get operator => throw _privateConstructorUsedError;
  set operator(Operator value) => throw _privateConstructorUsedError;
  String? get actualStartTime => throw _privateConstructorUsedError;
  set actualStartTime(String? value) => throw _privateConstructorUsedError;
  String? get actualEndTime => throw _privateConstructorUsedError;
  set actualEndTime(String? value) => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  set userId(String value) => throw _privateConstructorUsedError;
  String? get locationAlerts => throw _privateConstructorUsedError;
  set locationAlerts(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeTripModelCopyWith<HomeTripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTripModelCopyWith<$Res> {
  factory $HomeTripModelCopyWith(
          HomeTripModel value, $Res Function(HomeTripModel) then) =
      _$HomeTripModelCopyWithImpl<$Res, HomeTripModel>;
  @useResult
  $Res call(
      {String id,
      String routeId,
      String serviceCode,
      String status,
      String? plannedStartTime,
      String? plannedEndTime,
      Operator operator,
      String? actualStartTime,
      String? actualEndTime,
      String userId,
      String? locationAlerts});

  $OperatorCopyWith<$Res> get operator;
}

/// @nodoc
class _$HomeTripModelCopyWithImpl<$Res, $Val extends HomeTripModel>
    implements $HomeTripModelCopyWith<$Res> {
  _$HomeTripModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? serviceCode = null,
    Object? status = null,
    Object? plannedStartTime = freezed,
    Object? plannedEndTime = freezed,
    Object? operator = null,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? userId = null,
    Object? locationAlerts = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCode: null == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      plannedStartTime: freezed == plannedStartTime
          ? _value.plannedStartTime
          : plannedStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      plannedEndTime: freezed == plannedEndTime
          ? _value.plannedEndTime
          : plannedEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as Operator,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      locationAlerts: freezed == locationAlerts
          ? _value.locationAlerts
          : locationAlerts // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OperatorCopyWith<$Res> get operator {
    return $OperatorCopyWith<$Res>(_value.operator, (value) {
      return _then(_value.copyWith(operator: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeTripModelCopyWith<$Res>
    implements $HomeTripModelCopyWith<$Res> {
  factory _$$_HomeTripModelCopyWith(
          _$_HomeTripModel value, $Res Function(_$_HomeTripModel) then) =
      __$$_HomeTripModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String routeId,
      String serviceCode,
      String status,
      String? plannedStartTime,
      String? plannedEndTime,
      Operator operator,
      String? actualStartTime,
      String? actualEndTime,
      String userId,
      String? locationAlerts});

  @override
  $OperatorCopyWith<$Res> get operator;
}

/// @nodoc
class __$$_HomeTripModelCopyWithImpl<$Res>
    extends _$HomeTripModelCopyWithImpl<$Res, _$_HomeTripModel>
    implements _$$_HomeTripModelCopyWith<$Res> {
  __$$_HomeTripModelCopyWithImpl(
      _$_HomeTripModel _value, $Res Function(_$_HomeTripModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? routeId = null,
    Object? serviceCode = null,
    Object? status = null,
    Object? plannedStartTime = freezed,
    Object? plannedEndTime = freezed,
    Object? operator = null,
    Object? actualStartTime = freezed,
    Object? actualEndTime = freezed,
    Object? userId = null,
    Object? locationAlerts = freezed,
  }) {
    return _then(_$_HomeTripModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCode: null == serviceCode
          ? _value.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      plannedStartTime: freezed == plannedStartTime
          ? _value.plannedStartTime
          : plannedStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      plannedEndTime: freezed == plannedEndTime
          ? _value.plannedEndTime
          : plannedEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as Operator,
      actualStartTime: freezed == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as String?,
      actualEndTime: freezed == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      locationAlerts: freezed == locationAlerts
          ? _value.locationAlerts
          : locationAlerts // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_HomeTripModel implements _HomeTripModel {
  _$_HomeTripModel(
      {required this.id,
      required this.routeId,
      required this.serviceCode,
      required this.status,
      this.plannedStartTime,
      this.plannedEndTime,
      required this.operator,
      this.actualStartTime,
      this.actualEndTime,
      required this.userId,
      this.locationAlerts});

  factory _$_HomeTripModel.fromJson(Map<String, dynamic> json) =>
      _$$_HomeTripModelFromJson(json);

  @override
  String id;
  @override
  String routeId;
  @override
  String serviceCode;
  @override
  String status;
  @override
  String? plannedStartTime;
  @override
  String? plannedEndTime;
  @override
  Operator operator;
  @override
  String? actualStartTime;
  @override
  String? actualEndTime;
  @override
  String userId;
  @override
  String? locationAlerts;

  @override
  String toString() {
    return 'HomeTripModel(id: $id, routeId: $routeId, serviceCode: $serviceCode, status: $status, plannedStartTime: $plannedStartTime, plannedEndTime: $plannedEndTime, operator: $operator, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, userId: $userId, locationAlerts: $locationAlerts)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeTripModelCopyWith<_$_HomeTripModel> get copyWith =>
      __$$_HomeTripModelCopyWithImpl<_$_HomeTripModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeTripModelToJson(
      this,
    );
  }
}

abstract class _HomeTripModel implements HomeTripModel {
  factory _HomeTripModel(
      {required String id,
      required String routeId,
      required String serviceCode,
      required String status,
      String? plannedStartTime,
      String? plannedEndTime,
      required Operator operator,
      String? actualStartTime,
      String? actualEndTime,
      required String userId,
      String? locationAlerts}) = _$_HomeTripModel;

  factory _HomeTripModel.fromJson(Map<String, dynamic> json) =
      _$_HomeTripModel.fromJson;

  @override
  String get id;
  set id(String value);
  @override
  String get routeId;
  set routeId(String value);
  @override
  String get serviceCode;
  set serviceCode(String value);
  @override
  String get status;
  set status(String value);
  @override
  String? get plannedStartTime;
  set plannedStartTime(String? value);
  @override
  String? get plannedEndTime;
  set plannedEndTime(String? value);
  @override
  Operator get operator;
  set operator(Operator value);
  @override
  String? get actualStartTime;
  set actualStartTime(String? value);
  @override
  String? get actualEndTime;
  set actualEndTime(String? value);
  @override
  String get userId;
  set userId(String value);
  @override
  String? get locationAlerts;
  set locationAlerts(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_HomeTripModelCopyWith<_$_HomeTripModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Operator _$OperatorFromJson(Map<String, dynamic> json) {
  return _Operator.fromJson(json);
}

/// @nodoc
mixin _$Operator {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  String get vehicleNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperatorCopyWith<Operator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatorCopyWith<$Res> {
  factory $OperatorCopyWith(Operator value, $Res Function(Operator) then) =
      _$OperatorCopyWithImpl<$Res, Operator>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String contactNumber,
      String vehicleNumber});
}

/// @nodoc
class _$OperatorCopyWithImpl<$Res, $Val extends Operator>
    implements $OperatorCopyWith<$Res> {
  _$OperatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? contactNumber = null,
    Object? vehicleNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OperatorCopyWith<$Res> implements $OperatorCopyWith<$Res> {
  factory _$$_OperatorCopyWith(
          _$_Operator value, $Res Function(_$_Operator) then) =
      __$$_OperatorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String contactNumber,
      String vehicleNumber});
}

/// @nodoc
class __$$_OperatorCopyWithImpl<$Res>
    extends _$OperatorCopyWithImpl<$Res, _$_Operator>
    implements _$$_OperatorCopyWith<$Res> {
  __$$_OperatorCopyWithImpl(
      _$_Operator _value, $Res Function(_$_Operator) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? contactNumber = null,
    Object? vehicleNumber = null,
  }) {
    return _then(_$_Operator(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$_Operator implements _Operator {
  const _$_Operator(
      {required this.id,
      required this.name,
      required this.email,
      required this.contactNumber,
      required this.vehicleNumber});

  factory _$_Operator.fromJson(Map<String, dynamic> json) =>
      _$$_OperatorFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String contactNumber;
  @override
  final String vehicleNumber;

  @override
  String toString() {
    return 'Operator(id: $id, name: $name, email: $email, contactNumber: $contactNumber, vehicleNumber: $vehicleNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Operator &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, contactNumber, vehicleNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OperatorCopyWith<_$_Operator> get copyWith =>
      __$$_OperatorCopyWithImpl<_$_Operator>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OperatorToJson(
      this,
    );
  }
}

abstract class _Operator implements Operator {
  const factory _Operator(
      {required final String id,
      required final String name,
      required final String email,
      required final String contactNumber,
      required final String vehicleNumber}) = _$_Operator;

  factory _Operator.fromJson(Map<String, dynamic> json) = _$_Operator.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get contactNumber;
  @override
  String get vehicleNumber;
  @override
  @JsonKey(ignore: true)
  _$$_OperatorCopyWith<_$_Operator> get copyWith =>
      throw _privateConstructorUsedError;
}
