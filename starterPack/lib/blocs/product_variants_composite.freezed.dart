// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variants_composite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductVariantCompositeEvent {
  ProjectResourceSearchModel get query => throw _privateConstructorUsedError;
  Map<DataModelType, Map<ApiOperation, String>>? get actionMap =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectResourceSearchModel query,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)
        load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectResourceSearchModel query,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectResourceSearchModel query,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantCompositeLoadEvent value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantCompositeLoadEvent value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantCompositeLoadEvent value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductVariantCompositeEventCopyWith<ProductVariantCompositeEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCompositeEventCopyWith<$Res> {
  factory $ProductVariantCompositeEventCopyWith(
          ProductVariantCompositeEvent value,
          $Res Function(ProductVariantCompositeEvent) then) =
      _$ProductVariantCompositeEventCopyWithImpl<$Res,
          ProductVariantCompositeEvent>;
  @useResult
  $Res call(
      {ProjectResourceSearchModel query,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap});
}

/// @nodoc
class _$ProductVariantCompositeEventCopyWithImpl<$Res,
        $Val extends ProductVariantCompositeEvent>
    implements $ProductVariantCompositeEventCopyWith<$Res> {
  _$ProductVariantCompositeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? actionMap = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectResourceSearchModel,
      actionMap: freezed == actionMap
          ? _value.actionMap
          : actionMap // ignore: cast_nullable_to_non_nullable
              as Map<DataModelType, Map<ApiOperation, String>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantCompositeLoadEventImplCopyWith<$Res>
    implements $ProductVariantCompositeEventCopyWith<$Res> {
  factory _$$ProductVariantCompositeLoadEventImplCopyWith(
          _$ProductVariantCompositeLoadEventImpl value,
          $Res Function(_$ProductVariantCompositeLoadEventImpl) then) =
      __$$ProductVariantCompositeLoadEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProjectResourceSearchModel query,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap});
}

/// @nodoc
class __$$ProductVariantCompositeLoadEventImplCopyWithImpl<$Res>
    extends _$ProductVariantCompositeEventCopyWithImpl<$Res,
        _$ProductVariantCompositeLoadEventImpl>
    implements _$$ProductVariantCompositeLoadEventImplCopyWith<$Res> {
  __$$ProductVariantCompositeLoadEventImplCopyWithImpl(
      _$ProductVariantCompositeLoadEventImpl _value,
      $Res Function(_$ProductVariantCompositeLoadEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? actionMap = freezed,
  }) {
    return _then(_$ProductVariantCompositeLoadEventImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as ProjectResourceSearchModel,
      actionMap: freezed == actionMap
          ? _value._actionMap
          : actionMap // ignore: cast_nullable_to_non_nullable
              as Map<DataModelType, Map<ApiOperation, String>>?,
    ));
  }
}

/// @nodoc

class _$ProductVariantCompositeLoadEventImpl
    implements ProductVariantCompositeLoadEvent {
  const _$ProductVariantCompositeLoadEventImpl(
      {required this.query,
      required final Map<DataModelType, Map<ApiOperation, String>>? actionMap})
      : _actionMap = actionMap;

  @override
  final ProjectResourceSearchModel query;
  final Map<DataModelType, Map<ApiOperation, String>>? _actionMap;
  @override
  Map<DataModelType, Map<ApiOperation, String>>? get actionMap {
    final value = _actionMap;
    if (value == null) return null;
    if (_actionMap is EqualUnmodifiableMapView) return _actionMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ProductVariantCompositeEvent.load(query: $query, actionMap: $actionMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantCompositeLoadEventImpl &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._actionMap, _actionMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, query, const DeepCollectionEquality().hash(_actionMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantCompositeLoadEventImplCopyWith<
          _$ProductVariantCompositeLoadEventImpl>
      get copyWith => __$$ProductVariantCompositeLoadEventImplCopyWithImpl<
          _$ProductVariantCompositeLoadEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProjectResourceSearchModel query,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)
        load,
  }) {
    return load(query, actionMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProjectResourceSearchModel query,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        load,
  }) {
    return load?.call(query, actionMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProjectResourceSearchModel query,
            Map<DataModelType, Map<ApiOperation, String>>? actionMap)?
        load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(query, actionMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantCompositeLoadEvent value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantCompositeLoadEvent value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantCompositeLoadEvent value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class ProductVariantCompositeLoadEvent
    implements ProductVariantCompositeEvent {
  const factory ProductVariantCompositeLoadEvent(
      {required final ProjectResourceSearchModel query,
      required final Map<DataModelType, Map<ApiOperation, String>>?
          actionMap}) = _$ProductVariantCompositeLoadEventImpl;

  @override
  ProjectResourceSearchModel get query;
  @override
  Map<DataModelType, Map<ApiOperation, String>>? get actionMap;
  @override
  @JsonKey(ignore: true)
  _$$ProductVariantCompositeLoadEventImplCopyWith<
          _$ProductVariantCompositeLoadEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductVariantCompositeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantCompositeLoadingState value)
        loading,
    required TResult Function(ProductVariantCompositeEmptyState value) empty,
    required TResult Function(ProductVariantCompositeFetchedState value)
        fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantCompositeLoadingState value)? loading,
    TResult? Function(ProductVariantCompositeEmptyState value)? empty,
    TResult? Function(ProductVariantCompositeFetchedState value)? fetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantCompositeLoadingState value)? loading,
    TResult Function(ProductVariantCompositeEmptyState value)? empty,
    TResult Function(ProductVariantCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCompositeStateCopyWith<$Res> {
  factory $ProductVariantCompositeStateCopyWith(
          ProductVariantCompositeState value,
          $Res Function(ProductVariantCompositeState) then) =
      _$ProductVariantCompositeStateCopyWithImpl<$Res,
          ProductVariantCompositeState>;
}

/// @nodoc
class _$ProductVariantCompositeStateCopyWithImpl<$Res,
        $Val extends ProductVariantCompositeState>
    implements $ProductVariantCompositeStateCopyWith<$Res> {
  _$ProductVariantCompositeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductVariantCompositeLoadingStateImplCopyWith<$Res> {
  factory _$$ProductVariantCompositeLoadingStateImplCopyWith(
          _$ProductVariantCompositeLoadingStateImpl value,
          $Res Function(_$ProductVariantCompositeLoadingStateImpl) then) =
      __$$ProductVariantCompositeLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductVariantCompositeLoadingStateImplCopyWithImpl<$Res>
    extends _$ProductVariantCompositeStateCopyWithImpl<$Res,
        _$ProductVariantCompositeLoadingStateImpl>
    implements _$$ProductVariantCompositeLoadingStateImplCopyWith<$Res> {
  __$$ProductVariantCompositeLoadingStateImplCopyWithImpl(
      _$ProductVariantCompositeLoadingStateImpl _value,
      $Res Function(_$ProductVariantCompositeLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductVariantCompositeLoadingStateImpl
    implements ProductVariantCompositeLoadingState {
  const _$ProductVariantCompositeLoadingStateImpl();

  @override
  String toString() {
    return 'ProductVariantCompositeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantCompositeLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantCompositeLoadingState value)
        loading,
    required TResult Function(ProductVariantCompositeEmptyState value) empty,
    required TResult Function(ProductVariantCompositeFetchedState value)
        fetched,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantCompositeLoadingState value)? loading,
    TResult? Function(ProductVariantCompositeEmptyState value)? empty,
    TResult? Function(ProductVariantCompositeFetchedState value)? fetched,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantCompositeLoadingState value)? loading,
    TResult Function(ProductVariantCompositeEmptyState value)? empty,
    TResult Function(ProductVariantCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductVariantCompositeLoadingState
    implements ProductVariantCompositeState {
  const factory ProductVariantCompositeLoadingState() =
      _$ProductVariantCompositeLoadingStateImpl;
}

/// @nodoc
abstract class _$$ProductVariantCompositeEmptyStateImplCopyWith<$Res> {
  factory _$$ProductVariantCompositeEmptyStateImplCopyWith(
          _$ProductVariantCompositeEmptyStateImpl value,
          $Res Function(_$ProductVariantCompositeEmptyStateImpl) then) =
      __$$ProductVariantCompositeEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductVariantCompositeEmptyStateImplCopyWithImpl<$Res>
    extends _$ProductVariantCompositeStateCopyWithImpl<$Res,
        _$ProductVariantCompositeEmptyStateImpl>
    implements _$$ProductVariantCompositeEmptyStateImplCopyWith<$Res> {
  __$$ProductVariantCompositeEmptyStateImplCopyWithImpl(
      _$ProductVariantCompositeEmptyStateImpl _value,
      $Res Function(_$ProductVariantCompositeEmptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductVariantCompositeEmptyStateImpl
    implements ProductVariantCompositeEmptyState {
  const _$ProductVariantCompositeEmptyStateImpl();

  @override
  String toString() {
    return 'ProductVariantCompositeState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantCompositeEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantCompositeLoadingState value)
        loading,
    required TResult Function(ProductVariantCompositeEmptyState value) empty,
    required TResult Function(ProductVariantCompositeFetchedState value)
        fetched,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantCompositeLoadingState value)? loading,
    TResult? Function(ProductVariantCompositeEmptyState value)? empty,
    TResult? Function(ProductVariantCompositeFetchedState value)? fetched,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantCompositeLoadingState value)? loading,
    TResult Function(ProductVariantCompositeEmptyState value)? empty,
    TResult Function(ProductVariantCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class ProductVariantCompositeEmptyState
    implements ProductVariantCompositeState {
  const factory ProductVariantCompositeEmptyState() =
      _$ProductVariantCompositeEmptyStateImpl;
}

/// @nodoc
abstract class _$$ProductVariantCompositeFetchedStateImplCopyWith<$Res> {
  factory _$$ProductVariantCompositeFetchedStateImplCopyWith(
          _$ProductVariantCompositeFetchedStateImpl value,
          $Res Function(_$ProductVariantCompositeFetchedStateImpl) then) =
      __$$ProductVariantCompositeFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductVariantModel> productVariants});
}

/// @nodoc
class __$$ProductVariantCompositeFetchedStateImplCopyWithImpl<$Res>
    extends _$ProductVariantCompositeStateCopyWithImpl<$Res,
        _$ProductVariantCompositeFetchedStateImpl>
    implements _$$ProductVariantCompositeFetchedStateImplCopyWith<$Res> {
  __$$ProductVariantCompositeFetchedStateImplCopyWithImpl(
      _$ProductVariantCompositeFetchedStateImpl _value,
      $Res Function(_$ProductVariantCompositeFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVariants = null,
  }) {
    return _then(_$ProductVariantCompositeFetchedStateImpl(
      productVariants: null == productVariants
          ? _value._productVariants
          : productVariants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariantModel>,
    ));
  }
}

/// @nodoc

class _$ProductVariantCompositeFetchedStateImpl
    implements ProductVariantCompositeFetchedState {
  const _$ProductVariantCompositeFetchedStateImpl(
      {required final List<ProductVariantModel> productVariants})
      : _productVariants = productVariants;

  final List<ProductVariantModel> _productVariants;
  @override
  List<ProductVariantModel> get productVariants {
    if (_productVariants is EqualUnmodifiableListView) return _productVariants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productVariants);
  }

  @override
  String toString() {
    return 'ProductVariantCompositeState.fetched(productVariants: $productVariants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantCompositeFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._productVariants, _productVariants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productVariants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantCompositeFetchedStateImplCopyWith<
          _$ProductVariantCompositeFetchedStateImpl>
      get copyWith => __$$ProductVariantCompositeFetchedStateImplCopyWithImpl<
          _$ProductVariantCompositeFetchedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(List<ProductVariantModel> productVariants)
        fetched,
  }) {
    return fetched(productVariants);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(List<ProductVariantModel> productVariants)? fetched,
  }) {
    return fetched?.call(productVariants);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(List<ProductVariantModel> productVariants)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(productVariants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductVariantCompositeLoadingState value)
        loading,
    required TResult Function(ProductVariantCompositeEmptyState value) empty,
    required TResult Function(ProductVariantCompositeFetchedState value)
        fetched,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductVariantCompositeLoadingState value)? loading,
    TResult? Function(ProductVariantCompositeEmptyState value)? empty,
    TResult? Function(ProductVariantCompositeFetchedState value)? fetched,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductVariantCompositeLoadingState value)? loading,
    TResult Function(ProductVariantCompositeEmptyState value)? empty,
    TResult Function(ProductVariantCompositeFetchedState value)? fetched,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class ProductVariantCompositeFetchedState
    implements ProductVariantCompositeState {
  const factory ProductVariantCompositeFetchedState(
          {required final List<ProductVariantModel> productVariants}) =
      _$ProductVariantCompositeFetchedStateImpl;

  List<ProductVariantModel> get productVariants;
  @JsonKey(ignore: true)
  _$$ProductVariantCompositeFetchedStateImplCopyWith<
          _$ProductVariantCompositeFetchedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
