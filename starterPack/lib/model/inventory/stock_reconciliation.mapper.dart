// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'stock_reconciliation.dart';

class HcmStockReconciliationModelMapper
    extends SubClassMapperBase<HcmStockReconciliationModel> {
  HcmStockReconciliationModelMapper._();

  static HcmStockReconciliationModelMapper? _instance;
  static HcmStockReconciliationModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HcmStockReconciliationModelMapper._());
      StockReconciliationModelMapper.ensureInitialized()
          .addSubMapper(_instance!);
      AuditDetailsMapper.ensureInitialized();
      ClientAuditDetailsMapper.ensureInitialized();
      AdditionalFieldsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmStockReconciliationModel';

  static AuditDetails? _$auditDetails(HcmStockReconciliationModel v) =>
      v.auditDetails;
  static const Field<HcmStockReconciliationModel, AuditDetails>
      _f$auditDetails = Field('auditDetails', _$auditDetails);
  static ClientAuditDetails? _$clientAuditDetails(
          HcmStockReconciliationModel v) =>
      v.clientAuditDetails;
  static const Field<HcmStockReconciliationModel, ClientAuditDetails>
      _f$clientAuditDetails = Field('clientAuditDetails', _$clientAuditDetails);
  static String? _$id(HcmStockReconciliationModel v) => v.id;
  static const Field<HcmStockReconciliationModel, String> _f$id =
      Field('id', _$id, opt: true);
  static int? _$calculatedCount(HcmStockReconciliationModel v) =>
      v.calculatedCount;
  static const Field<HcmStockReconciliationModel, int> _f$calculatedCount =
      Field('calculatedCount', _$calculatedCount, opt: true);
  static String _$clientReferenceId(HcmStockReconciliationModel v) =>
      v.clientReferenceId;
  static const Field<HcmStockReconciliationModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$commentsOnReconciliation(HcmStockReconciliationModel v) =>
      v.commentsOnReconciliation;
  static const Field<HcmStockReconciliationModel, String>
      _f$commentsOnReconciliation =
      Field('commentsOnReconciliation', _$commentsOnReconciliation, opt: true);
  static int _$dateOfReconciliation(HcmStockReconciliationModel v) =>
      v.dateOfReconciliation;
  static const Field<HcmStockReconciliationModel, int> _f$dateOfReconciliation =
      Field('dateOfReconciliation', _$dateOfReconciliation);
  static String? _$facilityId(HcmStockReconciliationModel v) => v.facilityId;
  static const Field<HcmStockReconciliationModel, String> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static bool? _$nonRecoverableError(HcmStockReconciliationModel v) =>
      v.nonRecoverableError;
  static const Field<HcmStockReconciliationModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$physicalCount(HcmStockReconciliationModel v) => v.physicalCount;
  static const Field<HcmStockReconciliationModel, int> _f$physicalCount =
      Field('physicalCount', _$physicalCount, opt: true);
  static String? _$productVariantId(HcmStockReconciliationModel v) =>
      v.productVariantId;
  static const Field<HcmStockReconciliationModel, String> _f$productVariantId =
      Field('productVariantId', _$productVariantId, opt: true);
  static String? _$referenceId(HcmStockReconciliationModel v) => v.referenceId;
  static const Field<HcmStockReconciliationModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$referenceIdType(HcmStockReconciliationModel v) =>
      v.referenceIdType;
  static const Field<HcmStockReconciliationModel, String> _f$referenceIdType =
      Field('referenceIdType', _$referenceIdType, opt: true);
  static int? _$rowVersion(HcmStockReconciliationModel v) => v.rowVersion;
  static const Field<HcmStockReconciliationModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static String? _$tenantId(HcmStockReconciliationModel v) => v.tenantId;
  static const Field<HcmStockReconciliationModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static AdditionalFields? _$additionalFields(HcmStockReconciliationModel v) =>
      v.additionalFields;
  static const Field<HcmStockReconciliationModel, AdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static DateTime _$dateOfReconciliationTime(HcmStockReconciliationModel v) =>
      v.dateOfReconciliationTime;
  static const Field<HcmStockReconciliationModel, DateTime>
      _f$dateOfReconciliationTime = Field(
          'dateOfReconciliationTime', _$dateOfReconciliationTime,
          mode: FieldMode.member);

  @override
  final MappableFields<HcmStockReconciliationModel> fields = const {
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #id: _f$id,
    #calculatedCount: _f$calculatedCount,
    #clientReferenceId: _f$clientReferenceId,
    #commentsOnReconciliation: _f$commentsOnReconciliation,
    #dateOfReconciliation: _f$dateOfReconciliation,
    #facilityId: _f$facilityId,
    #nonRecoverableError: _f$nonRecoverableError,
    #physicalCount: _f$physicalCount,
    #productVariantId: _f$productVariantId,
    #referenceId: _f$referenceId,
    #referenceIdType: _f$referenceIdType,
    #rowVersion: _f$rowVersion,
    #tenantId: _f$tenantId,
    #additionalFields: _f$additionalFields,
    #dateOfReconciliationTime: _f$dateOfReconciliationTime,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      StockReconciliationModelMapper.ensureInitialized();

  static HcmStockReconciliationModel _instantiate(DecodingData data) {
    return HcmStockReconciliationModel(
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        id: data.dec(_f$id),
        calculatedCount: data.dec(_f$calculatedCount),
        clientReferenceId: data.dec(_f$clientReferenceId),
        commentsOnReconciliation: data.dec(_f$commentsOnReconciliation),
        dateOfReconciliation: data.dec(_f$dateOfReconciliation),
        facilityId: data.dec(_f$facilityId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        physicalCount: data.dec(_f$physicalCount),
        productVariantId: data.dec(_f$productVariantId),
        referenceId: data.dec(_f$referenceId),
        referenceIdType: data.dec(_f$referenceIdType),
        rowVersion: data.dec(_f$rowVersion),
        tenantId: data.dec(_f$tenantId),
        additionalFields: data.dec(_f$additionalFields));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmStockReconciliationModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmStockReconciliationModel>(map);
  }

  static HcmStockReconciliationModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmStockReconciliationModel>(json);
  }
}

mixin HcmStockReconciliationModelMappable {
  String toJson() {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .encodeJson<HcmStockReconciliationModel>(
            this as HcmStockReconciliationModel);
  }

  Map<String, dynamic> toMap() {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .encodeMap<HcmStockReconciliationModel>(
            this as HcmStockReconciliationModel);
  }

  HcmStockReconciliationModelCopyWith<HcmStockReconciliationModel,
          HcmStockReconciliationModel, HcmStockReconciliationModel>
      get copyWith => _HcmStockReconciliationModelCopyWithImpl(
          this as HcmStockReconciliationModel, $identity, $identity);
  @override
  String toString() {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .stringifyValue(this as HcmStockReconciliationModel);
  }

  @override
  bool operator ==(Object other) {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .equalsValue(this as HcmStockReconciliationModel, other);
  }

  @override
  int get hashCode {
    return HcmStockReconciliationModelMapper.ensureInitialized()
        .hashValue(this as HcmStockReconciliationModel);
  }
}

extension HcmStockReconciliationModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmStockReconciliationModel, $Out> {
  HcmStockReconciliationModelCopyWith<$R, HcmStockReconciliationModel, $Out>
      get $asHcmStockReconciliationModel => $base
          .as((v, t, t2) => _HcmStockReconciliationModelCopyWithImpl(v, t, t2));
}

abstract class HcmStockReconciliationModelCopyWith<
    $R,
    $In extends HcmStockReconciliationModel,
    $Out> implements StockReconciliationModelCopyWith<$R, $In, $Out> {
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields;
  @override
  $R call(
      {AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      String? id,
      int? calculatedCount,
      String? clientReferenceId,
      String? commentsOnReconciliation,
      int? dateOfReconciliation,
      String? facilityId,
      bool? nonRecoverableError,
      int? physicalCount,
      String? productVariantId,
      String? referenceId,
      String? referenceIdType,
      int? rowVersion,
      String? tenantId,
      AdditionalFields? additionalFields});
  HcmStockReconciliationModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmStockReconciliationModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmStockReconciliationModel, $Out>
    implements
        HcmStockReconciliationModelCopyWith<$R, HcmStockReconciliationModel,
            $Out> {
  _HcmStockReconciliationModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmStockReconciliationModel> $mapper =
      HcmStockReconciliationModelMapper.ensureInitialized();
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  AdditionalFieldsCopyWith<$R, AdditionalFields, AdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  $R call(
          {Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? id = $none,
          Object? calculatedCount = $none,
          String? clientReferenceId,
          Object? commentsOnReconciliation = $none,
          int? dateOfReconciliation,
          Object? facilityId = $none,
          Object? nonRecoverableError = $none,
          Object? physicalCount = $none,
          Object? productVariantId = $none,
          Object? referenceId = $none,
          Object? referenceIdType = $none,
          Object? rowVersion = $none,
          Object? tenantId = $none,
          Object? additionalFields = $none}) =>
      $apply(FieldCopyWithData({
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (id != $none) #id: id,
        if (calculatedCount != $none) #calculatedCount: calculatedCount,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (commentsOnReconciliation != $none)
          #commentsOnReconciliation: commentsOnReconciliation,
        if (dateOfReconciliation != null)
          #dateOfReconciliation: dateOfReconciliation,
        if (facilityId != $none) #facilityId: facilityId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (physicalCount != $none) #physicalCount: physicalCount,
        if (productVariantId != $none) #productVariantId: productVariantId,
        if (referenceId != $none) #referenceId: referenceId,
        if (referenceIdType != $none) #referenceIdType: referenceIdType,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (tenantId != $none) #tenantId: tenantId,
        if (additionalFields != $none) #additionalFields: additionalFields
      }));
  @override
  HcmStockReconciliationModel
      $make(CopyWithData data) =>
          HcmStockReconciliationModel(
              auditDetails: data.get(#auditDetails, or: $value.auditDetails),
              clientAuditDetails:
                  data.get(#clientAuditDetails, or: $value.clientAuditDetails),
              id: data.get(#id, or: $value.id),
              calculatedCount:
                  data.get(#calculatedCount, or: $value.calculatedCount),
              clientReferenceId:
                  data.get(#clientReferenceId, or: $value.clientReferenceId),
              commentsOnReconciliation: data.get(#commentsOnReconciliation,
                  or: $value.commentsOnReconciliation),
              dateOfReconciliation: data.get(#dateOfReconciliation,
                  or: $value.dateOfReconciliation),
              facilityId: data.get(#facilityId, or: $value.facilityId),
              nonRecoverableError: data.get(#nonRecoverableError,
                  or: $value.nonRecoverableError),
              physicalCount: data.get(#physicalCount, or: $value.physicalCount),
              productVariantId:
                  data.get(#productVariantId, or: $value.productVariantId),
              referenceId: data.get(#referenceId, or: $value.referenceId),
              referenceIdType:
                  data.get(#referenceIdType, or: $value.referenceIdType),
              rowVersion: data.get(#rowVersion, or: $value.rowVersion),
              tenantId: data.get(#tenantId, or: $value.tenantId),
              additionalFields:
                  data.get(#additionalFields, or: $value.additionalFields));

  @override
  HcmStockReconciliationModelCopyWith<$R2, HcmStockReconciliationModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HcmStockReconciliationModelCopyWithImpl($value, $cast, t);
}

class StockReconciliationAdditionalFieldsMapper
    extends SubClassMapperBase<StockReconciliationAdditionalFields> {
  StockReconciliationAdditionalFieldsMapper._();

  static StockReconciliationAdditionalFieldsMapper? _instance;
  static StockReconciliationAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = StockReconciliationAdditionalFieldsMapper._());
      AdditionalFieldsMapper.ensureInitialized().addSubMapper(_instance!);
      AdditionalFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StockReconciliationAdditionalFields';

  static String _$schema(StockReconciliationAdditionalFields v) => v.schema;
  static const Field<StockReconciliationAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true, def: 'StockReconciliation');
  static int _$version(StockReconciliationAdditionalFields v) => v.version;
  static const Field<StockReconciliationAdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(
          StockReconciliationAdditionalFields v) =>
      v.fields;
  static const Field<StockReconciliationAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<StockReconciliationAdditionalFields> fields = const {
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

  static StockReconciliationAdditionalFields _instantiate(DecodingData data) {
    return StockReconciliationAdditionalFields(
        schema: data.dec(_f$schema),
        version: data.dec(_f$version),
        fields: data.dec(_f$fields));
  }

  @override
  final Function instantiate = _instantiate;

  static StockReconciliationAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized()
        .decodeMap<StockReconciliationAdditionalFields>(map);
  }

  static StockReconciliationAdditionalFields fromJson(String json) {
    return ensureInitialized()
        .decodeJson<StockReconciliationAdditionalFields>(json);
  }
}

mixin StockReconciliationAdditionalFieldsMappable {
  String toJson() {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<StockReconciliationAdditionalFields>(
            this as StockReconciliationAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<StockReconciliationAdditionalFields>(
            this as StockReconciliationAdditionalFields);
  }

  StockReconciliationAdditionalFieldsCopyWith<
          StockReconciliationAdditionalFields,
          StockReconciliationAdditionalFields,
          StockReconciliationAdditionalFields>
      get copyWith => _StockReconciliationAdditionalFieldsCopyWithImpl(
          this as StockReconciliationAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as StockReconciliationAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as StockReconciliationAdditionalFields, other);
  }

  @override
  int get hashCode {
    return StockReconciliationAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as StockReconciliationAdditionalFields);
  }
}

extension StockReconciliationAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StockReconciliationAdditionalFields, $Out> {
  StockReconciliationAdditionalFieldsCopyWith<$R,
          StockReconciliationAdditionalFields, $Out>
      get $asStockReconciliationAdditionalFields => $base.as((v, t, t2) =>
          _StockReconciliationAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class StockReconciliationAdditionalFieldsCopyWith<
    $R,
    $In extends StockReconciliationAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  StockReconciliationAdditionalFieldsCopyWith<$R2, $In, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StockReconciliationAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StockReconciliationAdditionalFields, $Out>
    implements
        StockReconciliationAdditionalFieldsCopyWith<$R,
            StockReconciliationAdditionalFields, $Out> {
  _StockReconciliationAdditionalFieldsCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StockReconciliationAdditionalFields> $mapper =
      StockReconciliationAdditionalFieldsMapper.ensureInitialized();
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
  StockReconciliationAdditionalFields $make(CopyWithData data) =>
      StockReconciliationAdditionalFields(
          schema: data.get(#schema, or: $value.schema),
          version: data.get(#version, or: $value.version),
          fields: data.get(#fields, or: $value.fields));

  @override
  StockReconciliationAdditionalFieldsCopyWith<$R2,
      StockReconciliationAdditionalFields, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StockReconciliationAdditionalFieldsCopyWithImpl($value, $cast, t);
}
