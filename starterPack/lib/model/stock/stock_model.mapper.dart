// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stock_model.dart';

class HcmStockSearchModelMapper extends ClassMapperBase<HcmStockSearchModel> {
  HcmStockSearchModelMapper._();

  static HcmStockSearchModelMapper? _instance;
  static HcmStockSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmStockSearchModelMapper._());
      StockSearchModelMapper.ensureInitialized();
      TransactionTypeMapper.ensureInitialized();
      TransactionReasonMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockSearchModel';

  static String? _$id(HcmStockSearchModel v) => v.id;
  static const Field<HcmStockSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(HcmStockSearchModel v) => v.tenantId;
  static const Field<HcmStockSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$facilityId(HcmStockSearchModel v) => v.facilityId;
  static const Field<HcmStockSearchModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static String? _$productVariantId(HcmStockSearchModel v) =>
      v.productVariantId;
  static const Field<HcmStockSearchModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$referenceId(HcmStockSearchModel v) => v.referenceId;
  static const Field<HcmStockSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$referenceIdType(HcmStockSearchModel v) => v.referenceIdType;
  static const Field<HcmStockSearchModel, String> _f$referenceIdType =
      Field('referenceIdType', _$referenceIdType, opt: true);
  static String? _$transactingPartyId(HcmStockSearchModel v) =>
      v.transactingPartyId;
  static const Field<HcmStockSearchModel, String> _f$transactingPartyId =
      Field('transactingPartyId', _$transactingPartyId, opt: true);
  static String? _$transactingPartyType(HcmStockSearchModel v) =>
      v.transactingPartyType;
  static const Field<HcmStockSearchModel, String> _f$transactingPartyType =
      Field('transactingPartyType', _$transactingPartyType, opt: true);
  static String? _$receiverId(HcmStockSearchModel v) => v.receiverId;
  static const Field<HcmStockSearchModel, String> _f$receiverId =
      Field('receiverId', _$receiverId, opt: true);
  static String? _$receiverType(HcmStockSearchModel v) => v.receiverType;
  static const Field<HcmStockSearchModel, String> _f$receiverType =
      Field('receiverType', _$receiverType, opt: true);
  static String? _$senderId(HcmStockSearchModel v) => v.senderId;
  static const Field<HcmStockSearchModel, String> _f$senderId =
      Field('senderId', _$senderId, opt: true);
  static String? _$senderType(HcmStockSearchModel v) => v.senderType;
  static const Field<HcmStockSearchModel, String> _f$senderType =
      Field('senderType', _$senderType, opt: true);
  static List<String>? _$clientReferenceId(HcmStockSearchModel v) =>
      v.clientReferenceId;
  static const Field<HcmStockSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static List<TransactionType>? _$transactionType(HcmStockSearchModel v) =>
      v.transactionType;
  static const Field<HcmStockSearchModel, List<TransactionType>>
      _f$transactionType =
      Field('transactionType', _$transactionType, opt: true);
  static List<TransactionReason>? _$transactionReason(HcmStockSearchModel v) =>
      v.transactionReason;
  static const Field<HcmStockSearchModel, List<TransactionReason>>
      _f$transactionReason =
      Field('transactionReason', _$transactionReason, opt: true);

  @override
  final MappableFields<HcmStockSearchModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #facilityId: _f$facilityId,
    #productVariantId: _f$productVariantId,
    #referenceId: _f$referenceId,
    #referenceIdType: _f$referenceIdType,
    #transactingPartyId: _f$transactingPartyId,
    #transactingPartyType: _f$transactingPartyType,
    #receiverId: _f$receiverId,
    #receiverType: _f$receiverType,
    #senderId: _f$senderId,
    #senderType: _f$senderType,
    #clientReferenceId: _f$clientReferenceId,
    #transactionType: _f$transactionType,
    #transactionReason: _f$transactionReason,
  };
  @override
  final bool ignoreNull = true;

  static HcmStockSearchModel _instantiate(DecodingData data) {
    return HcmStockSearchModel(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        facilityId: data.dec(_f$facilityId),
        productVariantId: data.dec(_f$productVariantId),
        referenceId: data.dec(_f$referenceId),
        referenceIdType: data.dec(_f$referenceIdType),
        transactingPartyId: data.dec(_f$transactingPartyId),
        transactingPartyType: data.dec(_f$transactingPartyType),
        receiverId: data.dec(_f$receiverId),
        receiverType: data.dec(_f$receiverType),
        senderId: data.dec(_f$senderId),
        senderType: data.dec(_f$senderType),
        clientReferenceId: data.dec(_f$clientReferenceId),
        transactionType: data.dec(_f$transactionType),
        transactionReason: data.dec(_f$transactionReason));
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
    return HcmStockSearchModelMapper.ensureInitialized()
        .equalsValue(this as HcmStockSearchModel, other);
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
    $Out> implements StockSearchModelCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  @override
  ListCopyWith<$R, TransactionType,
          ObjectCopyWith<$R, TransactionType, TransactionType>>?
      get transactionType;
  @override
  ListCopyWith<$R, TransactionReason,
          ObjectCopyWith<$R, TransactionReason, TransactionReason>>?
      get transactionReason;
  @override
  $R call(
      {String? id,
      String? tenantId,
      String? facilityId,
      String? productVariantId,
      String? referenceId,
      String? referenceIdType,
      String? transactingPartyId,
      String? transactingPartyType,
      String? receiverId,
      String? receiverType,
      String? senderId,
      String? senderType,
      List<String>? clientReferenceId,
      List<TransactionType>? transactionType,
      List<TransactionReason>? transactionReason});
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
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  ListCopyWith<$R, TransactionType,
          ObjectCopyWith<$R, TransactionType, TransactionType>>?
      get transactionType => $value.transactionType != null
          ? ListCopyWith(
              $value.transactionType!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(transactionType: v))
          : null;
  @override
  ListCopyWith<$R, TransactionReason,
          ObjectCopyWith<$R, TransactionReason, TransactionReason>>?
      get transactionReason => $value.transactionReason != null
          ? ListCopyWith(
              $value.transactionReason!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(transactionReason: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? facilityId = $none,
          Object? productVariantId = $none,
          Object? referenceId = $none,
          Object? referenceIdType = $none,
          Object? transactingPartyId = $none,
          Object? transactingPartyType = $none,
          Object? receiverId = $none,
          Object? receiverType = $none,
          Object? senderId = $none,
          Object? senderType = $none,
          Object? clientReferenceId = $none,
          Object? transactionType = $none,
          Object? transactionReason = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (facilityId != $none) #facilityId: facilityId,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (referenceId != $none) #referenceId: referenceId,
        if (referenceIdType != $none) #referenceIdType: referenceIdType,
        if (transactingPartyId != $none)
          #transactingPartyId: transactingPartyId,
        if (transactingPartyType != $none)
          #transactingPartyType: transactingPartyType,
        if (receiverId != $none) #receiverId: receiverId,
        if (receiverType != $none) #receiverType: receiverType,
        if (senderId != $none) #senderId: senderId,
        if (senderType != $none) #senderType: senderType,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (transactionType != $none) #transactionType: transactionType,
        if (transactionReason != $none) #transactionReason: transactionReason
      }));
  @override
  HcmStockSearchModel $make(CopyWithData data) => HcmStockSearchModel(
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      referenceIdType: data.get(#referenceIdType, or: $value.referenceIdType),
      transactingPartyId:
          data.get(#transactingPartyId, or: $value.transactingPartyId),
      transactingPartyType:
          data.get(#transactingPartyType, or: $value.transactingPartyType),
      receiverId: data.get(#receiverId, or: $value.receiverId),
      receiverType: data.get(#receiverType, or: $value.receiverType),
      senderId: data.get(#senderId, or: $value.senderId),
      senderType: data.get(#senderType, or: $value.senderType),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      transactionType: data.get(#transactionType, or: $value.transactionType),
      transactionReason:
          data.get(#transactionReason, or: $value.transactionReason));

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
      HcmStockModelAdditionalFieldsMapper.ensureInitialized();
      TransactionReasonMapper.ensureInitialized();
      TransactionTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockModel';

  static AuditDetails? _$auditDetails(HcmStockModel v) => v.auditDetails;
  static const Field<HcmStockModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HcmStockModel v) =>
      v.clientAuditDetails;
  static const Field<HcmStockModel, ClientAuditDetails> _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static HcmStockModelAdditionalFields? _$additionalFields(HcmStockModel v) =>
      v.additionalFields;
  static const Field<HcmStockModel, HcmStockModelAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static String? _$clientReferenceId(HcmStockModel v) => v.clientReferenceId;
  static const Field<HcmStockModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$id(HcmStockModel v) => v.id;
  static const Field<HcmStockModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(HcmStockModel v) => v.tenantId;
  static const Field<HcmStockModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$facilityId(HcmStockModel v) => v.facilityId;
  static const Field<HcmStockModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static String? _$productVariantId(HcmStockModel v) => v.productVariantId;
  static const Field<HcmStockModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$referenceId(HcmStockModel v) => v.referenceId;
  static const Field<HcmStockModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$referenceIdType(HcmStockModel v) => v.referenceIdType;
  static const Field<HcmStockModel, String> _f$referenceIdType =
      Field('referenceIdType', _$referenceIdType, opt: true);
  static String? _$transactingPartyId(HcmStockModel v) => v.transactingPartyId;
  static const Field<HcmStockModel, String> _f$transactingPartyId =
      Field('transactingPartyId', _$transactingPartyId, opt: true);
  static String? _$transactingPartyType(HcmStockModel v) =>
      v.transactingPartyType;
  static const Field<HcmStockModel, String> _f$transactingPartyType =
      Field('transactingPartyType', _$transactingPartyType, opt: true);
  static String? _$quantity(HcmStockModel v) => v.quantity;
  static const Field<HcmStockModel, String> _f$quantity =
      Field('quantity', _$quantity, opt: true);
  static String? _$waybillNumber(HcmStockModel v) => v.waybillNumber;
  static const Field<HcmStockModel, String> _f$waybillNumber =
      Field('waybillNumber', _$waybillNumber, opt: true);
  static String? _$receiverId(HcmStockModel v) => v.receiverId;
  static const Field<HcmStockModel, String> _f$receiverId =
      Field('receiverId', _$receiverId, opt: true);
  static String? _$receiverType(HcmStockModel v) => v.receiverType;
  static const Field<HcmStockModel, String> _f$receiverType =
      Field('receiverType', _$receiverType, opt: true);
  static String? _$senderId(HcmStockModel v) => v.senderId;
  static const Field<HcmStockModel, String> _f$senderId =
      Field('senderId', _$senderId, opt: true);
  static String? _$senderType(HcmStockModel v) => v.senderType;
  static const Field<HcmStockModel, String> _f$senderType =
      Field('senderType', _$senderType, opt: true);
  static bool? _$nonRecoverableError(HcmStockModel v) => v.nonRecoverableError;
  static const Field<HcmStockModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static int? _$rowVersion(HcmStockModel v) => v.rowVersion;
  static const Field<HcmStockModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static TransactionReason? _$transactionReason(HcmStockModel v) =>
      v.transactionReason;
  static const Field<HcmStockModel, TransactionReason> _f$transactionReason =
      Field('transactionReason', _$transactionReason, opt: true);
  static TransactionType? _$transactionType(HcmStockModel v) =>
      v.transactionType;
  static const Field<HcmStockModel, TransactionType> _f$transactionType =
      Field('transactionType', _$transactionType, opt: true);

  @override
  final MappableFields<HcmStockModel> fields = const {
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #additionalFields: _f$additionalFields,
    #clientReferenceId: _f$clientReferenceId,
    #id: _f$id,
    #tenantId: _f$tenantId,
    #facilityId: _f$facilityId,
    #productVariantId: _f$productVariantId,
    #referenceId: _f$referenceId,
    #referenceIdType: _f$referenceIdType,
    #transactingPartyId: _f$transactingPartyId,
    #transactingPartyType: _f$transactingPartyType,
    #quantity: _f$quantity,
    #waybillNumber: _f$waybillNumber,
    #receiverId: _f$receiverId,
    #receiverType: _f$receiverType,
    #senderId: _f$senderId,
    #senderType: _f$senderType,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
    #transactionReason: _f$transactionReason,
    #transactionType: _f$transactionType,
  };
  @override
  final bool ignoreNull = true;

  static HcmStockModel _instantiate(DecodingData data) {
    return HcmStockModel(
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        additionalFields: data.dec(_f$additionalFields),
        clientReferenceId: data.dec(_f$clientReferenceId),
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        facilityId: data.dec(_f$facilityId),
        productVariantId: data.dec(_f$productVariantId),
        referenceId: data.dec(_f$referenceId),
        referenceIdType: data.dec(_f$referenceIdType),
        transactingPartyId: data.dec(_f$transactingPartyId),
        transactingPartyType: data.dec(_f$transactingPartyType),
        quantity: data.dec(_f$quantity),
        waybillNumber: data.dec(_f$waybillNumber),
        receiverId: data.dec(_f$receiverId),
        receiverType: data.dec(_f$receiverType),
        senderId: data.dec(_f$senderId),
        senderType: data.dec(_f$senderType),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion),
        transactionReason: data.dec(_f$transactionReason),
        transactionType: data.dec(_f$transactionType));
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
    return HcmStockModelMapper.ensureInitialized()
        .equalsValue(this as HcmStockModel, other);
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
    implements StockModelCopyWith<$R, $In, $Out> {
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields,
      HcmStockModelAdditionalFields>? get additionalFields;
  @override
  $R call(
      {AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      HcmStockModelAdditionalFields? additionalFields,
      String? clientReferenceId,
      String? id,
      String? tenantId,
      String? facilityId,
      String? productVariantId,
      String? referenceId,
      String? referenceIdType,
      String? transactingPartyId,
      String? transactingPartyType,
      String? quantity,
      String? waybillNumber,
      String? receiverId,
      String? receiverType,
      String? senderId,
      String? senderType,
      bool? nonRecoverableError,
      int? rowVersion,
      TransactionReason? transactionReason,
      TransactionType? transactionType});
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
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields,
          HcmStockModelAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  $R call(
          {Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? additionalFields = $none,
          Object? clientReferenceId = $none,
          Object? id = $none,
          Object? tenantId = $none,
          Object? facilityId = $none,
          Object? productVariantId = $none,
          Object? referenceId = $none,
          Object? referenceIdType = $none,
          Object? transactingPartyId = $none,
          Object? transactingPartyType = $none,
          Object? quantity = $none,
          Object? waybillNumber = $none,
          Object? receiverId = $none,
          Object? receiverType = $none,
          Object? senderId = $none,
          Object? senderType = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none,
          Object? transactionReason = $none,
          Object? transactionType = $none}) =>
      $apply(FieldCopyWithData({
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (facilityId != $none) #facilityId: facilityId,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (referenceId != $none) #referenceId: referenceId,
        if (referenceIdType != $none) #referenceIdType: referenceIdType,
        if (transactingPartyId != $none)
          #transactingPartyId: transactingPartyId,
        if (transactingPartyType != $none)
          #transactingPartyType: transactingPartyType,
        if (quantity != $none) #quantity: quantity,
        if (waybillNumber != $none) #waybillNumber: waybillNumber,
        if (receiverId != $none) #receiverId: receiverId,
        if (receiverType != $none) #receiverType: receiverType,
        if (senderId != $none) #senderId: senderId,
        if (senderType != $none) #senderType: senderType,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (transactionReason != $none) #transactionReason: transactionReason,
        if (transactionType != $none) #transactionType: transactionType
      }));
  @override
  HcmStockModel $make(CopyWithData data) => HcmStockModel(
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      productVariantId:
          data.get(#productVariantId, or: $value.productVariantId),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      referenceIdType: data.get(#referenceIdType, or: $value.referenceIdType),
      transactingPartyId:
          data.get(#transactingPartyId, or: $value.transactingPartyId),
      transactingPartyType:
          data.get(#transactingPartyType, or: $value.transactingPartyType),
      quantity: data.get(#quantity, or: $value.quantity),
      waybillNumber: data.get(#waybillNumber, or: $value.waybillNumber),
      receiverId: data.get(#receiverId, or: $value.receiverId),
      receiverType: data.get(#receiverType, or: $value.receiverType),
      senderId: data.get(#senderId, or: $value.senderId),
      senderType: data.get(#senderType, or: $value.senderType),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      transactionReason:
          data.get(#transactionReason, or: $value.transactionReason),
      transactionType: data.get(#transactionType, or: $value.transactionType));

  @override
  HcmStockModelCopyWith<$R2, HcmStockModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockModelCopyWithImpl($value, $cast, t);
}

class HcmStockModelAdditionalFieldsMapper
    extends SubClassMapperBase<HcmStockModelAdditionalFields> {
  HcmStockModelAdditionalFieldsMapper._();

  static HcmStockModelAdditionalFieldsMapper? _instance;
  static HcmStockModelAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmStockModelAdditionalFieldsMapper._());
      AdditionalFieldsMapper.ensureInitialized().addSubMapper(_instance!);
      AdditionalFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockModelAdditionalFields';

  static String _$schema(HcmStockModelAdditionalFields v) => v.schema;
  static const Field<HcmStockModelAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'StockReconciliation');
  static int _$version(HcmStockModelAdditionalFields v) => v.version;
  static const Field<HcmStockModelAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(HcmStockModelAdditionalFields v) =>
      v.fields;
  static const Field<HcmStockModelAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<HcmStockModelAdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      AdditionalFieldsMapper.ensureInitialized();

  static HcmStockModelAdditionalFields _instantiate(DecodingData data) {
    return HcmStockModelAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockModelAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockModelAdditionalFields>(map);
  }

  static HcmStockModelAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockModelAdditionalFields>(json);
  }
}

mixin HcmStockModelAdditionalFieldsMappable {
  String toJson() {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<HcmStockModelAdditionalFields>(
            this as HcmStockModelAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<HcmStockModelAdditionalFields>(
            this as HcmStockModelAdditionalFields);
  }

  HcmStockModelAdditionalFieldsCopyWith<HcmStockModelAdditionalFields,
          HcmStockModelAdditionalFields, HcmStockModelAdditionalFields>
      get copyWith => _HcmStockModelAdditionalFieldsCopyWithImpl(
          this as HcmStockModelAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as HcmStockModelAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as HcmStockModelAdditionalFields, other);
  }

  @override
  int get hashCode {
    return HcmStockModelAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as HcmStockModelAdditionalFields);
  }
}

extension HcmStockModelAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockModelAdditionalFields, $Out> {
  HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields, $Out>
      get $asHcmStockModelAdditionalFields => $base.as(
          (v, t, t2) => _HcmStockModelAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class HcmStockModelAdditionalFieldsCopyWith<
    $R,
    $In extends HcmStockModelAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  HcmStockModelAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockModelAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockModelAdditionalFields, $Out>
    implements
        HcmStockModelAdditionalFieldsCopyWith<$R, HcmStockModelAdditionalFields,
            $Out> {
  _HcmStockModelAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockModelAdditionalFields> $mapper =
      HcmStockModelAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields}) =>
      $apply(FieldCopyWithData({
        if (schema != null) #schema: schema,
        if (version != null) #version: version,
        if (fields != null) #fields: fields
      }));
  @override
  HcmStockModelAdditionalFields $make(CopyWithData data) =>
      HcmStockModelAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  HcmStockModelAdditionalFieldsCopyWith<$R2, HcmStockModelAdditionalFields,
      $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmStockModelAdditionalFieldsCopyWithImpl($value, $cast, t);
}
