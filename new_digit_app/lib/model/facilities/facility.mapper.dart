// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'facility.dart';

class FacilitySearchModelMapper extends ClassMapperBase<FacilitySearchModel> {
  FacilitySearchModelMapper._();

  static FacilitySearchModelMapper? _instance;
  static FacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'FacilitySearchModel';

  static List<String>? _$id(FacilitySearchModel v) => v.id;
  static const Field<FacilitySearchModel, List<String>> _f$id =
      Field('id', _$id, opt: true);
  static bool? _$isPermanent(FacilitySearchModel v) => v.isPermanent;
  static const Field<FacilitySearchModel, bool> _f$isPermanent =
      Field('isPermanent', _$isPermanent, opt: true);
  static String? _$usage(FacilitySearchModel v) => v.usage;
  static const Field<FacilitySearchModel, String> _f$usage =
      Field('usage', _$usage, opt: true);
  static int? _$storageCapacity(FacilitySearchModel v) => v.storageCapacity;
  static const Field<FacilitySearchModel, int> _f$storageCapacity =
      Field('storageCapacity', _$storageCapacity, opt: true);
  static String? _$tenantId(FacilitySearchModel v) => v.tenantId;
  static const Field<FacilitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<FacilitySearchModel> fields = const {
    #id: _f$id,
    #isPermanent: _f$isPermanent,
    #usage: _f$usage,
    #storageCapacity: _f$storageCapacity,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static FacilitySearchModel _instantiate(DecodingData data) {
    return FacilitySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        isPermanent: data.dec(_f$isPermanent),
        usage: data.dec(_f$usage),
        storageCapacity: data.dec(_f$storageCapacity),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static FacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FacilitySearchModel>(map);
  }

  static FacilitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<FacilitySearchModel>(json);
  }
}

mixin FacilitySearchModelMappable {
  String toJson() {
    return FacilitySearchModelMapper.ensureInitialized()
        .encodeJson<FacilitySearchModel>(this as FacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return FacilitySearchModelMapper.ensureInitialized()
        .encodeMap<FacilitySearchModel>(this as FacilitySearchModel);
  }

  FacilitySearchModelCopyWith<FacilitySearchModel, FacilitySearchModel,
          FacilitySearchModel>
      get copyWith => _FacilitySearchModelCopyWithImpl(
          this as FacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return FacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as FacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FacilitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as FacilitySearchModel, other));
  }

  @override
  int get hashCode {
    return FacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as FacilitySearchModel);
  }
}

extension FacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FacilitySearchModel, $Out> {
  FacilitySearchModelCopyWith<$R, FacilitySearchModel, $Out>
      get $asFacilitySearchModel =>
          $base.as((v, t, t2) => _FacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class FacilitySearchModelCopyWith<$R, $In extends FacilitySearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id;
  $R call(
      {List<String>? id,
      bool? isPermanent,
      String? usage,
      int? storageCapacity,
      String? tenantId});
  FacilitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FacilitySearchModel, $Out>
    implements FacilitySearchModelCopyWith<$R, FacilitySearchModel, $Out> {
  _FacilitySearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FacilitySearchModel> $mapper =
      FacilitySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get id =>
      $value.id != null
          ? ListCopyWith($value.id!, (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(id: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? isPermanent = $none,
          Object? usage = $none,
          Object? storageCapacity = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (isPermanent != $none) #isPermanent: isPermanent,
        if (usage != $none) #usage: usage,
        if (storageCapacity != $none) #storageCapacity: storageCapacity,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  FacilitySearchModel $make(CopyWithData data) =>
      FacilitySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          isPermanent: data.get(#isPermanent, or: $value.isPermanent),
          usage: data.get(#usage, or: $value.usage),
          storageCapacity:
              data.get(#storageCapacity, or: $value.storageCapacity),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  FacilitySearchModelCopyWith<$R2, FacilitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FacilitySearchModelCopyWithImpl($value, $cast, t);
}

class FacilityModelMapper extends ClassMapperBase<FacilityModel> {
  FacilityModelMapper._();

  static FacilityModelMapper? _instance;
  static FacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FacilityModelMapper._());
      AddressModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FacilityModel';

  static String _$id(FacilityModel v) => v.id;
  static const Field<FacilityModel, String> _f$id = Field('id', _$id);
  static bool? _$isPermanent(FacilityModel v) => v.isPermanent;
  static const Field<FacilityModel, bool> _f$isPermanent =
      Field('isPermanent', _$isPermanent, opt: true);
  static String? _$usage(FacilityModel v) => v.usage;
  static const Field<FacilityModel, String> _f$usage =
      Field('usage', _$usage, opt: true);
  static int? _$storageCapacity(FacilityModel v) => v.storageCapacity;
  static const Field<FacilityModel, int> _f$storageCapacity =
      Field('storageCapacity', _$storageCapacity, opt: true);
  static bool? _$nonRecoverableError(FacilityModel v) => v.nonRecoverableError;
  static const Field<FacilityModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(FacilityModel v) => v.tenantId;
  static const Field<FacilityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(FacilityModel v) => v.rowVersion;
  static const Field<FacilityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressModel? _$address(FacilityModel v) => v.address;
  static const Field<FacilityModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);

  @override
  final MappableFields<FacilityModel> fields = const {
    #id: _f$id,
    #isPermanent: _f$isPermanent,
    #usage: _f$usage,
    #storageCapacity: _f$storageCapacity,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #address: _f$address,
  };
  @override
  final bool ignoreNull = true;

  static FacilityModel _instantiate(DecodingData data) {
    return FacilityModel(
        id: data.dec(_f$id),
        isPermanent: data.dec(_f$isPermanent),
        usage: data.dec(_f$usage),
        storageCapacity: data.dec(_f$storageCapacity),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        address: data.dec(_f$address));
  }

  @override
  final Function instantiate = _instantiate;

  static FacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FacilityModel>(map);
  }

  static FacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<FacilityModel>(json);
  }
}

mixin FacilityModelMappable {
  String toJson() {
    return FacilityModelMapper.ensureInitialized()
        .encodeJson<FacilityModel>(this as FacilityModel);
  }

  Map<String, dynamic> toMap() {
    return FacilityModelMapper.ensureInitialized()
        .encodeMap<FacilityModel>(this as FacilityModel);
  }

  FacilityModelCopyWith<FacilityModel, FacilityModel, FacilityModel>
      get copyWith => _FacilityModelCopyWithImpl(
          this as FacilityModel, $identity, $identity);
  @override
  String toString() {
    return FacilityModelMapper.ensureInitialized()
        .stringifyValue(this as FacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            FacilityModelMapper.ensureInitialized()
                .isValueEqual(this as FacilityModel, other));
  }

  @override
  int get hashCode {
    return FacilityModelMapper.ensureInitialized()
        .hashValue(this as FacilityModel);
  }
}

extension FacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FacilityModel, $Out> {
  FacilityModelCopyWith<$R, FacilityModel, $Out> get $asFacilityModel =>
      $base.as((v, t, t2) => _FacilityModelCopyWithImpl(v, t, t2));
}

abstract class FacilityModelCopyWith<$R, $In extends FacilityModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  $R call(
      {String? id,
      bool? isPermanent,
      String? usage,
      int? storageCapacity,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AddressModel? address});
  FacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FacilityModel, $Out>
    implements FacilityModelCopyWith<$R, FacilityModel, $Out> {
  _FacilityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FacilityModel> $mapper =
      FacilityModelMapper.ensureInitialized();
  @override
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  $R call(
          {String? id,
          Object? isPermanent = $none,
          Object? usage = $none,
          Object? storageCapacity = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? address = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (isPermanent != $none) #isPermanent: isPermanent,
        if (usage != $none) #usage: usage,
        if (storageCapacity != $none) #storageCapacity: storageCapacity,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (address != $none) #address: address
      }));
  @override
  FacilityModel $make(CopyWithData data) => FacilityModel(
      id: data.get(#id, or: $value.id),
      isPermanent: data.get(#isPermanent, or: $value.isPermanent),
      usage: data.get(#usage, or: $value.usage),
      storageCapacity: data.get(#storageCapacity, or: $value.storageCapacity),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      address: data.get(#address, or: $value.address));

  @override
  FacilityModelCopyWith<$R2, FacilityModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FacilityModelCopyWithImpl($value, $cast, t);
}
