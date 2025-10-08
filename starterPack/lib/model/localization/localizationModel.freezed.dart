// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localizationModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalizationModel _$LocalizationModelFromJson(Map<String, dynamic> json) {
  return _LocalizationModel.fromJson(json);
}

/// @nodoc
mixin _$LocalizationModel {
  List<LocalizationMessageModel> get messages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationModelCopyWith<LocalizationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationModelCopyWith<$Res> {
  factory $LocalizationModelCopyWith(
          LocalizationModel value, $Res Function(LocalizationModel) then) =
      _$LocalizationModelCopyWithImpl<$Res, LocalizationModel>;
  @useResult
  $Res call({List<LocalizationMessageModel> messages});
}

/// @nodoc
class _$LocalizationModelCopyWithImpl<$Res, $Val extends LocalizationModel>
    implements $LocalizationModelCopyWith<$Res> {
  _$LocalizationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<LocalizationMessageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationModelImplCopyWith<$Res>
    implements $LocalizationModelCopyWith<$Res> {
  factory _$$LocalizationModelImplCopyWith(_$LocalizationModelImpl value,
          $Res Function(_$LocalizationModelImpl) then) =
      __$$LocalizationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LocalizationMessageModel> messages});
}

/// @nodoc
class __$$LocalizationModelImplCopyWithImpl<$Res>
    extends _$LocalizationModelCopyWithImpl<$Res, _$LocalizationModelImpl>
    implements _$$LocalizationModelImplCopyWith<$Res> {
  __$$LocalizationModelImplCopyWithImpl(_$LocalizationModelImpl _value,
      $Res Function(_$LocalizationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$LocalizationModelImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<LocalizationMessageModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocalizationModelImpl implements _LocalizationModel {
  const _$LocalizationModelImpl(
      {final List<LocalizationMessageModel> messages = const []})
      : _messages = messages;

  factory _$LocalizationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizationModelImplFromJson(json);

  final List<LocalizationMessageModel> _messages;
  @override
  @JsonKey()
  List<LocalizationMessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'LocalizationModel(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationModelImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationModelImplCopyWith<_$LocalizationModelImpl> get copyWith =>
      __$$LocalizationModelImplCopyWithImpl<_$LocalizationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizationModelImplToJson(
      this,
    );
  }
}

abstract class _LocalizationModel implements LocalizationModel {
  const factory _LocalizationModel(
          {final List<LocalizationMessageModel> messages}) =
      _$LocalizationModelImpl;

  factory _LocalizationModel.fromJson(Map<String, dynamic> json) =
      _$LocalizationModelImpl.fromJson;

  @override
  List<LocalizationMessageModel> get messages;
  @override
  @JsonKey(ignore: true)
  _$$LocalizationModelImplCopyWith<_$LocalizationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalizationMessageModel _$LocalizationMessageModelFromJson(
    Map<String, dynamic> json) {
  return _LocalizationMessageModel.fromJson(json);
}

/// @nodoc
mixin _$LocalizationMessageModel {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get module => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizationMessageModelCopyWith<LocalizationMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationMessageModelCopyWith<$Res> {
  factory $LocalizationMessageModelCopyWith(LocalizationMessageModel value,
          $Res Function(LocalizationMessageModel) then) =
      _$LocalizationMessageModelCopyWithImpl<$Res, LocalizationMessageModel>;
  @useResult
  $Res call({String code, String message, String module, String locale});
}

/// @nodoc
class _$LocalizationMessageModelCopyWithImpl<$Res,
        $Val extends LocalizationMessageModel>
    implements $LocalizationMessageModelCopyWith<$Res> {
  _$LocalizationMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? module = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationMessageModelImplCopyWith<$Res>
    implements $LocalizationMessageModelCopyWith<$Res> {
  factory _$$LocalizationMessageModelImplCopyWith(
          _$LocalizationMessageModelImpl value,
          $Res Function(_$LocalizationMessageModelImpl) then) =
      __$$LocalizationMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String module, String locale});
}

/// @nodoc
class __$$LocalizationMessageModelImplCopyWithImpl<$Res>
    extends _$LocalizationMessageModelCopyWithImpl<$Res,
        _$LocalizationMessageModelImpl>
    implements _$$LocalizationMessageModelImplCopyWith<$Res> {
  __$$LocalizationMessageModelImplCopyWithImpl(
      _$LocalizationMessageModelImpl _value,
      $Res Function(_$LocalizationMessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? module = null,
    Object? locale = null,
  }) {
    return _then(_$LocalizationMessageModelImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      module: null == module
          ? _value.module
          : module // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$LocalizationMessageModelImpl implements _LocalizationMessageModel {
  const _$LocalizationMessageModelImpl(
      {required this.code,
      required this.message,
      required this.module,
      required this.locale});

  factory _$LocalizationMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizationMessageModelImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final String module;
  @override
  final String locale;

  @override
  String toString() {
    return 'LocalizationMessageModel(code: $code, message: $message, module: $module, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationMessageModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.module, module) || other.module == module) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, module, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationMessageModelImplCopyWith<_$LocalizationMessageModelImpl>
      get copyWith => __$$LocalizationMessageModelImplCopyWithImpl<
          _$LocalizationMessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizationMessageModelImplToJson(
      this,
    );
  }
}

abstract class _LocalizationMessageModel implements LocalizationMessageModel {
  const factory _LocalizationMessageModel(
      {required final String code,
      required final String message,
      required final String module,
      required final String locale}) = _$LocalizationMessageModelImpl;

  factory _LocalizationMessageModel.fromJson(Map<String, dynamic> json) =
      _$LocalizationMessageModelImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String get module;
  @override
  String get locale;
  @override
  @JsonKey(ignore: true)
  _$$LocalizationMessageModelImplCopyWith<_$LocalizationMessageModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
