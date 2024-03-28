// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stock_model.dart';

class HcmStockSearchModelMapper extends ClassMapperBase<HcmStockSearchModel> {
  HcmStockSearchModelMapper._();

  static HcmStockSearchModelMapper? _instance;
  static HcmStockSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockSearchModelMapper._());
      StockSearchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockSearchModel';

  static StockSearchModel? _$stock(HcmStockSearchModel v) => v.stock;
  static const Field<HcmStockSearchModel, StockSearchModel> _f$stock =
      Field('stock', _$stock);

  @override
  final MappableFields<HcmStockSearchModel> fields = const {
    #stock: _f$stock,
  };
  @override
  final bool ignoreNull = true;

  static HcmStockSearchModel _instantiate(DecodingData data) {
    return HcmStockSearchModel.ignoreDeleted(data.dec(_f$stock));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockSearchModel>(map);
  }

  static HcmStockSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockSearchModel>(json);
  }
}

mixin HcmStockSearchModelMappable {
  String toJson() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .encodeJson<HcmStockSearchModel>(this as HcmStockSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .encodeMap<HcmStockSearchModel>(this as HcmStockSearchModel);
  }

  HcmStockSearchModelCopyWith<HcmStockSearchModel, HcmStockSearchModel,
          HcmStockSearchModel>
      get copyWith => _HcmStockSearchModelCopyWithImpl(
          this as HcmStockSearchModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockSearchModel, other));
  }

  @override
  int get hashCode {
    return HcmStockSearchModelMapper.ensureInitialized()
        .hashValue(this as HcmStockSearchModel);
  }
}

extension HcmStockSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockSearchModel, $Out> {
  HcmStockSearchModelCopyWith<$R, HcmStockSearchModel, $Out>
      get $asHcmStockSearchModel =>
          $base.as((v, t, t2) => _HcmStockSearchModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockSearchModelCopyWith<$R, $In extends HcmStockSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  StockSearchModelCopyWith<$R, StockSearchModel, StockSearchModel>? get stock;
  $R call({StockSearchModel? stock});
  HcmStockSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockSearchModel, $Out>
    implements HcmStockSearchModelCopyWith<$R, HcmStockSearchModel, $Out> {
  _HcmStockSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockSearchModel> $mapper =
      HcmStockSearchModelMapper.ensureInitialized();
  @override
  StockSearchModelCopyWith<$R, StockSearchModel, StockSearchModel>? get stock =>
      $value.stock?.copyWith.$chain((v) => call(stock: v));
  @override
  $R call({Object? stock = $none}) =>
      $apply(FieldCopyWithData({if (stock != $none) #stock: stock}));
  @override
  HcmStockSearchModel $make(CopyWithData data) =>
      HcmStockSearchModel.ignoreDeleted(data.get(#stock, or: $value.stock));

  @override
  HcmStockSearchModelCopyWith<$R2, HcmStockSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmStockSearchModelCopyWithImpl($value, $cast, t);
}

class HcmStockModelMapper extends ClassMapperBase<HcmStockModel> {
  HcmStockModelMapper._();

  static HcmStockModelMapper? _instance;
  static HcmStockModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockModelMapper._());
      StockModelMapper.ensureInitialized();
      AuditDetailsMapper.ensureInitialized();
      ClientAuditDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockModel';

  static StockModel? _$stock(HcmStockModel v) => v.stock;
  static const Field<HcmStockModel, StockModel> _f$stock =
      Field('stock', _$stock, opt: true);
  static AuditDetails? _$auditDetails(HcmStockModel v) => v.auditDetails;
  static const Field<HcmStockModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HcmStockModel v) =>
      v.clientAuditDetails;
  static const Field<HcmStockModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);

  @override
  final MappableFields<HcmStockModel> fields = const {
    #stock: _f$stock,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  static HcmStockModel _instantiate(DecodingData data) {
    return HcmStockModel(
        stock: data.dec(_f$stock),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockModel>(map);
  }

  static HcmStockModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockModel>(json);
  }
}

mixin HcmStockModelMappable {
  String toJson() {
    return HcmStockModelMapper.ensureInitialized()
        .encodeJson<HcmStockModel>(this as HcmStockModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockModelMapper.ensureInitialized()
        .encodeMap<HcmStockModel>(this as HcmStockModel);
  }

  HcmStockModelCopyWith<HcmStockModel, HcmStockModel, HcmStockModel>
      get copyWith => _HcmStockModelCopyWithImpl(
          this as HcmStockModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HcmStockModelMapper.ensureInitialized()
                .isValueEqual(this as HcmStockModel, other));
  }

  @override
  int get hashCode {
    return HcmStockModelMapper.ensureInitialized()
        .hashValue(this as HcmStockModel);
  }
}

extension HcmStockModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockModel, $Out> {
  HcmStockModelCopyWith<$R, HcmStockModel, $Out> get $asHcmStockModel =>
      $base.as((v, t, t2) => _HcmStockModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockModelCopyWith<$R, $In extends HcmStockModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  StockModelCopyWith<$R, StockModel, StockModel>? get stock;
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  $R call(
      {StockModel? stock,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails});
  HcmStockModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HcmStockModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockModel, $Out>
    implements HcmStockModelCopyWith<$R, HcmStockModel, $Out> {
  _HcmStockModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockModel> $mapper =
      HcmStockModelMapper.ensureInitialized();
  @override
  StockModelCopyWith<$R, StockModel, StockModel>? get stock =>
      $value.stock?.copyWith.$chain((v) => call(stock: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? stock = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (stock != $none) #stock: stock,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none) #clientAuditDetails: clientAuditDetails
      }));
  @override
  HcmStockModel $make(CopyWithData data) => HcmStockModel(
      stock: data.get(#stock, or: $value.stock),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails));

  @override
  HcmStockModelCopyWith<$R2, HcmStockModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockModelCopyWithImpl($value, $cast, t);
}
