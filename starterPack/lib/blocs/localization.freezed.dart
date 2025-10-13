// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocalizationEvent {
  String? get locale => throw _privateConstructorUsedError;
  InterfacesList? get moduleList => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? locale, InterfacesList? moduleList)
        onSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? locale, InterfacesList? moduleList)? onSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? locale, InterfacesList? moduleList)? onSelect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleSelectedEvent value) onSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleSelectedEvent value)? onSelect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleSelectedEvent value)? onSelect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationEventCopyWith<LocalizationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationEventCopyWith<$Res> {
  factory $LocalizationEventCopyWith(
          LocalizationEvent value, $Res Function(LocalizationEvent) then) =
      _$LocalizationEventCopyWithImpl<$Res, LocalizationEvent>;
  @useResult
  $Res call({String? locale, InterfacesList? moduleList});

  $InterfacesListCopyWith<$Res>? get moduleList;
}

/// @nodoc
class _$LocalizationEventCopyWithImpl<$Res, $Val extends LocalizationEvent>
    implements $LocalizationEventCopyWith<$Res> {
  _$LocalizationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? moduleList = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleList: freezed == moduleList
          ? _value.moduleList
          : moduleList // ignore: cast_nullable_to_non_nullable
              as InterfacesList?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InterfacesListCopyWith<$Res>? get moduleList {
    if (_value.moduleList == null) {
      return null;
    }

    return $InterfacesListCopyWith<$Res>(_value.moduleList!, (value) {
      return _then(_value.copyWith(moduleList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocaleSelectedEventImplCopyWith<$Res>
    implements $LocalizationEventCopyWith<$Res> {
  factory _$$LocaleSelectedEventImplCopyWith(_$LocaleSelectedEventImpl value,
          $Res Function(_$LocaleSelectedEventImpl) then) =
      __$$LocaleSelectedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? locale, InterfacesList? moduleList});

  @override
  $InterfacesListCopyWith<$Res>? get moduleList;
}

/// @nodoc
class __$$LocaleSelectedEventImplCopyWithImpl<$Res>
    extends _$LocalizationEventCopyWithImpl<$Res, _$LocaleSelectedEventImpl>
    implements _$$LocaleSelectedEventImplCopyWith<$Res> {
  __$$LocaleSelectedEventImplCopyWithImpl(_$LocaleSelectedEventImpl _value,
      $Res Function(_$LocaleSelectedEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? moduleList = freezed,
  }) {
    return _then(_$LocaleSelectedEventImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      moduleList: freezed == moduleList
          ? _value.moduleList
          : moduleList // ignore: cast_nullable_to_non_nullable
              as InterfacesList?,
    ));
  }
}

/// @nodoc

class _$LocaleSelectedEventImpl implements _LocaleSelectedEvent {
  const _$LocaleSelectedEventImpl({this.locale, this.moduleList});

  @override
  final String? locale;
  @override
  final InterfacesList? moduleList;

  @override
  String toString() {
    return 'LocalizationEvent.onSelect(locale: $locale, moduleList: $moduleList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleSelectedEventImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.moduleList, moduleList) ||
                other.moduleList == moduleList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale, moduleList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleSelectedEventImplCopyWith<_$LocaleSelectedEventImpl> get copyWith =>
      __$$LocaleSelectedEventImplCopyWithImpl<_$LocaleSelectedEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? locale, InterfacesList? moduleList)
        onSelect,
  }) {
    return onSelect(locale, moduleList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? locale, InterfacesList? moduleList)? onSelect,
  }) {
    return onSelect?.call(locale, moduleList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? locale, InterfacesList? moduleList)? onSelect,
    required TResult orElse(),
  }) {
    if (onSelect != null) {
      return onSelect(locale, moduleList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleSelectedEvent value) onSelect,
  }) {
    return onSelect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleSelectedEvent value)? onSelect,
  }) {
    return onSelect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleSelectedEvent value)? onSelect,
    required TResult orElse(),
  }) {
    if (onSelect != null) {
      return onSelect(this);
    }
    return orElse();
  }
}

abstract class _LocaleSelectedEvent implements LocalizationEvent {
  const factory _LocaleSelectedEvent(
      {final String? locale,
      final InterfacesList? moduleList}) = _$LocaleSelectedEventImpl;

  @override
  String? get locale;
  @override
  InterfacesList? get moduleList;
  @override
  @JsonKey(ignore: true)
  _$$LocaleSelectedEventImplCopyWith<_$LocaleSelectedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalizationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? locale) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? locale)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? locale)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleNotSelectedState value) initial,
    required TResult Function(_LocaleSelectedState value) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleNotSelectedState value)? initial,
    TResult? Function(_LocaleSelectedState value)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleNotSelectedState value)? initial,
    TResult Function(_LocaleSelectedState value)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationStateCopyWith<$Res> {
  factory $LocalizationStateCopyWith(
          LocalizationState value, $Res Function(LocalizationState) then) =
      _$LocalizationStateCopyWithImpl<$Res, LocalizationState>;
}

/// @nodoc
class _$LocalizationStateCopyWithImpl<$Res, $Val extends LocalizationState>
    implements $LocalizationStateCopyWith<$Res> {
  _$LocalizationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LocaleNotSelectedStateImplCopyWith<$Res> {
  factory _$$LocaleNotSelectedStateImplCopyWith(
          _$LocaleNotSelectedStateImpl value,
          $Res Function(_$LocaleNotSelectedStateImpl) then) =
      __$$LocaleNotSelectedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LocaleNotSelectedStateImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocaleNotSelectedStateImpl>
    implements _$$LocaleNotSelectedStateImplCopyWith<$Res> {
  __$$LocaleNotSelectedStateImplCopyWithImpl(
      _$LocaleNotSelectedStateImpl _value,
      $Res Function(_$LocaleNotSelectedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LocaleNotSelectedStateImpl implements _LocaleNotSelectedState {
  const _$LocaleNotSelectedStateImpl();

  @override
  String toString() {
    return 'LocalizationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleNotSelectedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? locale) selected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? locale)? selected,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? locale)? selected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleNotSelectedState value) initial,
    required TResult Function(_LocaleSelectedState value) selected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleNotSelectedState value)? initial,
    TResult? Function(_LocaleSelectedState value)? selected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleNotSelectedState value)? initial,
    TResult Function(_LocaleSelectedState value)? selected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _LocaleNotSelectedState implements LocalizationState {
  const factory _LocaleNotSelectedState() = _$LocaleNotSelectedStateImpl;
}

/// @nodoc
abstract class _$$LocaleSelectedStateImplCopyWith<$Res> {
  factory _$$LocaleSelectedStateImplCopyWith(_$LocaleSelectedStateImpl value,
          $Res Function(_$LocaleSelectedStateImpl) then) =
      __$$LocaleSelectedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? locale});
}

/// @nodoc
class __$$LocaleSelectedStateImplCopyWithImpl<$Res>
    extends _$LocalizationStateCopyWithImpl<$Res, _$LocaleSelectedStateImpl>
    implements _$$LocaleSelectedStateImplCopyWith<$Res> {
  __$$LocaleSelectedStateImplCopyWithImpl(_$LocaleSelectedStateImpl _value,
      $Res Function(_$LocaleSelectedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
  }) {
    return _then(_$LocaleSelectedStateImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LocaleSelectedStateImpl implements _LocaleSelectedState {
  const _$LocaleSelectedStateImpl({required this.locale});

  @override
  final String? locale;

  @override
  String toString() {
    return 'LocalizationState.selected(locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocaleSelectedStateImpl &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocaleSelectedStateImplCopyWith<_$LocaleSelectedStateImpl> get copyWith =>
      __$$LocaleSelectedStateImplCopyWithImpl<_$LocaleSelectedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? locale) selected,
  }) {
    return selected(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? locale)? selected,
  }) {
    return selected?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? locale)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LocaleNotSelectedState value) initial,
    required TResult Function(_LocaleSelectedState value) selected,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LocaleNotSelectedState value)? initial,
    TResult? Function(_LocaleSelectedState value)? selected,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LocaleNotSelectedState value)? initial,
    TResult Function(_LocaleSelectedState value)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _LocaleSelectedState implements LocalizationState {
  const factory _LocaleSelectedState({required final String? locale}) =
      _$LocaleSelectedStateImpl;

  String? get locale;
  @JsonKey(ignore: true)
  _$$LocaleSelectedStateImplCopyWith<_$LocaleSelectedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
