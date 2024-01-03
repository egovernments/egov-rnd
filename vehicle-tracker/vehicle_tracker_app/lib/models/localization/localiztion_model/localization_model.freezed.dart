// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_LocalizationModelCopyWith<$Res>
    implements $LocalizationModelCopyWith<$Res> {
  factory _$$_LocalizationModelCopyWith(_$_LocalizationModel value,
          $Res Function(_$_LocalizationModel) then) =
      __$$_LocalizationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LocalizationMessageModel> messages});
}

/// @nodoc
class __$$_LocalizationModelCopyWithImpl<$Res>
    extends _$LocalizationModelCopyWithImpl<$Res, _$_LocalizationModel>
    implements _$$_LocalizationModelCopyWith<$Res> {
  __$$_LocalizationModelCopyWithImpl(
      _$_LocalizationModel _value, $Res Function(_$_LocalizationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_LocalizationModel(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<LocalizationMessageModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_LocalizationModel implements _LocalizationModel {
  const _$_LocalizationModel(
      {final List<LocalizationMessageModel> messages = const []})
      : _messages = messages;

  factory _$_LocalizationModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizationModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizationModel &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalizationModelCopyWith<_$_LocalizationModel> get copyWith =>
      __$$_LocalizationModelCopyWithImpl<_$_LocalizationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizationModelToJson(
      this,
    );
  }
}

abstract class _LocalizationModel implements LocalizationModel {
  const factory _LocalizationModel(
      {final List<LocalizationMessageModel> messages}) = _$_LocalizationModel;

  factory _LocalizationModel.fromJson(Map<String, dynamic> json) =
      _$_LocalizationModel.fromJson;

  @override
  List<LocalizationMessageModel> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_LocalizationModelCopyWith<_$_LocalizationModel> get copyWith =>
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
abstract class _$$_LocalizationMessageModelCopyWith<$Res>
    implements $LocalizationMessageModelCopyWith<$Res> {
  factory _$$_LocalizationMessageModelCopyWith(
          _$_LocalizationMessageModel value,
          $Res Function(_$_LocalizationMessageModel) then) =
      __$$_LocalizationMessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String module, String locale});
}

/// @nodoc
class __$$_LocalizationMessageModelCopyWithImpl<$Res>
    extends _$LocalizationMessageModelCopyWithImpl<$Res,
        _$_LocalizationMessageModel>
    implements _$$_LocalizationMessageModelCopyWith<$Res> {
  __$$_LocalizationMessageModelCopyWithImpl(_$_LocalizationMessageModel _value,
      $Res Function(_$_LocalizationMessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? module = null,
    Object? locale = null,
  }) {
    return _then(_$_LocalizationMessageModel(
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
class _$_LocalizationMessageModel implements _LocalizationMessageModel {
  const _$_LocalizationMessageModel(
      {required this.code,
      required this.message,
      required this.module,
      required this.locale});

  factory _$_LocalizationMessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocalizationMessageModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizationMessageModel &&
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
  _$$_LocalizationMessageModelCopyWith<_$_LocalizationMessageModel>
      get copyWith => __$$_LocalizationMessageModelCopyWithImpl<
          _$_LocalizationMessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocalizationMessageModelToJson(
      this,
    );
  }
}

abstract class _LocalizationMessageModel implements LocalizationMessageModel {
  const factory _LocalizationMessageModel(
      {required final String code,
      required final String message,
      required final String module,
      required final String locale}) = _$_LocalizationMessageModel;

  factory _LocalizationMessageModel.fromJson(Map<String, dynamic> json) =
      _$_LocalizationMessageModel.fromJson;

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
  _$$_LocalizationMessageModelCopyWith<_$_LocalizationMessageModel>
      get copyWith => throw _privateConstructorUsedError;
}
