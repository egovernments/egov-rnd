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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$DigitRowCardModelImplCopyWith<$Res>
    implements $DigitRowCardModelCopyWith<$Res> {
  factory _$$DigitRowCardModelImplCopyWith(_$DigitRowCardModelImpl value,
          $Res Function(_$DigitRowCardModelImpl) then) =
      __$$DigitRowCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, bool isSelected});
}

/// @nodoc
class __$$DigitRowCardModelImplCopyWithImpl<$Res>
    extends _$DigitRowCardModelCopyWithImpl<$Res, _$DigitRowCardModelImpl>
    implements _$$DigitRowCardModelImplCopyWith<$Res> {
  __$$DigitRowCardModelImplCopyWithImpl(_$DigitRowCardModelImpl _value,
      $Res Function(_$DigitRowCardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? isSelected = null,
  }) {
    return _then(_$DigitRowCardModelImpl(
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
class _$DigitRowCardModelImpl implements _DigitRowCardModel {
  const _$DigitRowCardModelImpl(
      {required this.label, required this.value, this.isSelected = false});

  factory _$DigitRowCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitRowCardModelImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitRowCardModelImpl &&
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
  _$$DigitRowCardModelImplCopyWith<_$DigitRowCardModelImpl> get copyWith =>
      __$$DigitRowCardModelImplCopyWithImpl<_$DigitRowCardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitRowCardModelImplToJson(
      this,
    );
  }
}

abstract class _DigitRowCardModel implements DigitRowCardModel {
  const factory _DigitRowCardModel(
      {required final String label,
      required final String value,
      final bool isSelected}) = _$DigitRowCardModelImpl;

  factory _DigitRowCardModel.fromJson(Map<String, dynamic> json) =
      _$DigitRowCardModelImpl.fromJson;

  @override
  String get label;
  @override
  String get value;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$DigitRowCardModelImplCopyWith<_$DigitRowCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
