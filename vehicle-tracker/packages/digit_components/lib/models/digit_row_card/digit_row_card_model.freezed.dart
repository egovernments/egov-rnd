// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digit_row_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DigitRowCardModel _$DigitRowCardModelFromJson(Map<String, dynamic> json) {
  return _DigitRowCardModel.fromJson(json);
}

/// @nodoc
mixin _$DigitRowCardModel {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DigitRowCardModelCopyWith<DigitRowCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitRowCardModelCopyWith<$Res> {
  factory $DigitRowCardModelCopyWith(
          DigitRowCardModel value, $Res Function(DigitRowCardModel) then) =
      _$DigitRowCardModelCopyWithImpl<$Res, DigitRowCardModel>;
  @useResult
  $Res call({String label, String value, bool isSelected});
}

/// @nodoc
class _$DigitRowCardModelCopyWithImpl<$Res, $Val extends DigitRowCardModel>
    implements $DigitRowCardModelCopyWith<$Res> {
  _$DigitRowCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DigitRowCardModelCopyWith<$Res>
    implements $DigitRowCardModelCopyWith<$Res> {
  factory _$$_DigitRowCardModelCopyWith(_$_DigitRowCardModel value,
          $Res Function(_$_DigitRowCardModel) then) =
      __$$_DigitRowCardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, bool isSelected});
}

/// @nodoc
class __$$_DigitRowCardModelCopyWithImpl<$Res>
    extends _$DigitRowCardModelCopyWithImpl<$Res, _$_DigitRowCardModel>
    implements _$$_DigitRowCardModelCopyWith<$Res> {
  __$$_DigitRowCardModelCopyWithImpl(
      _$_DigitRowCardModel _value, $Res Function(_$_DigitRowCardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_$_DigitRowCardModel(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DigitRowCardModel implements _DigitRowCardModel {
  const _$_DigitRowCardModel(
      {required this.label, required this.value, this.isSelected = false});

  factory _$_DigitRowCardModel.fromJson(Map<String, dynamic> json) =>
      _$$_DigitRowCardModelFromJson(json);

  @override
  final String label;
  @override
  final String value;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'DigitRowCardModel(label: $label, value: $value, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DigitRowCardModel &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DigitRowCardModelCopyWith<_$_DigitRowCardModel> get copyWith =>
      __$$_DigitRowCardModelCopyWithImpl<_$_DigitRowCardModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DigitRowCardModelToJson(
      this,
    );
  }
}

abstract class _DigitRowCardModel implements DigitRowCardModel {
  const factory _DigitRowCardModel(
      {required final String label,
      required final String value,
      final bool isSelected}) = _$_DigitRowCardModel;

  factory _DigitRowCardModel.fromJson(Map<String, dynamic> json) =
      _$_DigitRowCardModel.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_DigitRowCardModelCopyWith<_$_DigitRowCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
