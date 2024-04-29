// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'referral.dart';

class HcmHFReferralModelMapper extends SubClassMapperBase<HcmHFReferralModel> {
  HcmHFReferralModelMapper._();

  static HcmHFReferralModelMapper? _instance;
  static HcmHFReferralModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HcmHFReferralModelMapper._());
      HFReferralModelMapper.ensureInitialized().addSubMapper(_instance!);
      ReferralAdditionalFieldsMapper.ensureInitialized();
      AuditDetailsMapper.ensureInitialized();
      ClientAuditDetailsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HcmHFReferralModel';

  static String? _$id(HcmHFReferralModel v) => v.id;
  static const Field<HcmHFReferralModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$tenantId(HcmHFReferralModel v) => v.tenantId;
  static const Field<HcmHFReferralModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static String? _$name(HcmHFReferralModel v) => v.name;
  static const Field<HcmHFReferralModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$projectId(HcmHFReferralModel v) => v.projectId;
  static const Field<HcmHFReferralModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$projectFacilityId(HcmHFReferralModel v) =>
      v.projectFacilityId;
  static const Field<HcmHFReferralModel, String> _f$projectFacilityId =
      Field('projectFacilityId', _$projectFacilityId, opt: true);
  static String? _$symptomSurveyId(HcmHFReferralModel v) => v.symptomSurveyId;
  static const Field<HcmHFReferralModel, String> _f$symptomSurveyId =
      Field('symptomSurveyId', _$symptomSurveyId, opt: true);
  static String? _$beneficiaryId(HcmHFReferralModel v) => v.beneficiaryId;
  static const Field<HcmHFReferralModel, String> _f$beneficiaryId =
      Field('beneficiaryId', _$beneficiaryId, opt: true);
  static String? _$referralCode(HcmHFReferralModel v) => v.referralCode;
  static const Field<HcmHFReferralModel, String> _f$referralCode =
      Field('referralCode', _$referralCode, opt: true);
  static String? _$nationalLevelId(HcmHFReferralModel v) => v.nationalLevelId;
  static const Field<HcmHFReferralModel, String> _f$nationalLevelId =
      Field('nationalLevelId', _$nationalLevelId, opt: true);
  static String? _$symptom(HcmHFReferralModel v) => v.symptom;
  static const Field<HcmHFReferralModel, String> _f$symptom =
      Field('symptom', _$symptom, opt: true);
  static bool? _$nonRecoverableError(HcmHFReferralModel v) =>
      v.nonRecoverableError;
  static const Field<HcmHFReferralModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(HcmHFReferralModel v) =>
      v.clientReferenceId;
  static const Field<HcmHFReferralModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static int? _$rowVersion(HcmHFReferralModel v) => v.rowVersion;
  static const Field<HcmHFReferralModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static ReferralAdditionalFields? _$additionalFields(HcmHFReferralModel v) =>
      v.additionalFields;
  static const Field<HcmHFReferralModel, ReferralAdditionalFields>
      _f$additionalFields =
      Field('additionalFields', _$additionalFields, opt: true);
  static AuditDetails? _$auditDetails(HcmHFReferralModel v) => v.auditDetails;
  static const Field<HcmHFReferralModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HcmHFReferralModel v) =>
      v.clientAuditDetails;
  static const Field<HcmHFReferralModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);

  @override
  final MappableFields<HcmHFReferralModel> fields = const {
    #id: _f$id,
    #tenantId: _f$tenantId,
    #name: _f$name,
    #projectId: _f$projectId,
    #projectFacilityId: _f$projectFacilityId,
    #symptomSurveyId: _f$symptomSurveyId,
    #beneficiaryId: _f$beneficiaryId,
    #referralCode: _f$referralCode,
    #nationalLevelId: _f$nationalLevelId,
    #symptom: _f$symptom,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #rowVersion: _f$rowVersion,
    #additionalFields: _f$additionalFields,
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = MappableClass.useAsDefault;
  @override
  late final ClassMapperBase superMapper =
      HFReferralModelMapper.ensureInitialized();

  static HcmHFReferralModel _instantiate(DecodingData data) {
    return HcmHFReferralModel(
        id: data.dec(_f$id),
        tenantId: data.dec(_f$tenantId),
        name: data.dec(_f$name),
        projectId: data.dec(_f$projectId),
        projectFacilityId: data.dec(_f$projectFacilityId),
        symptomSurveyId: data.dec(_f$symptomSurveyId),
        beneficiaryId: data.dec(_f$beneficiaryId),
        referralCode: data.dec(_f$referralCode),
        nationalLevelId: data.dec(_f$nationalLevelId),
        symptom: data.dec(_f$symptom),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        rowVersion: data.dec(_f$rowVersion),
        additionalFields: data.dec(_f$additionalFields),
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails));
  }

  @override
  final Function instantiate = _instantiate;

  static HcmHFReferralModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HcmHFReferralModel>(map);
  }

  static HcmHFReferralModel fromJson(String json) {
    return ensureInitialized().decodeJson<HcmHFReferralModel>(json);
  }
}

mixin HcmHFReferralModelMappable {
  String toJson() {
    return HcmHFReferralModelMapper.ensureInitialized()
        .encodeJson<HcmHFReferralModel>(this as HcmHFReferralModel);
  }

  Map<String, dynamic> toMap() {
    return HcmHFReferralModelMapper.ensureInitialized()
        .encodeMap<HcmHFReferralModel>(this as HcmHFReferralModel);
  }

  HcmHFReferralModelCopyWith<HcmHFReferralModel, HcmHFReferralModel,
          HcmHFReferralModel>
      get copyWith => _HcmHFReferralModelCopyWithImpl(
          this as HcmHFReferralModel, $identity, $identity);
  @override
  String toString() {
    return HcmHFReferralModelMapper.ensureInitialized()
        .stringifyValue(this as HcmHFReferralModel);
  }

  @override
  bool operator ==(Object other) {
    return HcmHFReferralModelMapper.ensureInitialized()
        .equalsValue(this as HcmHFReferralModel, other);
  }

  @override
  int get hashCode {
    return HcmHFReferralModelMapper.ensureInitialized()
        .hashValue(this as HcmHFReferralModel);
  }
}

extension HcmHFReferralModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HcmHFReferralModel, $Out> {
  HcmHFReferralModelCopyWith<$R, HcmHFReferralModel, $Out>
      get $asHcmHFReferralModel =>
          $base.as((v, t, t2) => _HcmHFReferralModelCopyWithImpl(v, t, t2));
}

abstract class HcmHFReferralModelCopyWith<$R, $In extends HcmHFReferralModel,
    $Out> implements HFReferralModelCopyWith<$R, $In, $Out> {
  ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields,
      ReferralAdditionalFields>? get additionalFields;
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  @override
  $R call(
      {String? id,
      String? tenantId,
      String? name,
      String? projectId,
      String? projectFacilityId,
      String? symptomSurveyId,
      String? beneficiaryId,
      String? referralCode,
      String? nationalLevelId,
      String? symptom,
      bool? nonRecoverableError,
      String? clientReferenceId,
      int? rowVersion,
      ReferralAdditionalFields? additionalFields,
      AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails});
  HcmHFReferralModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HcmHFReferralModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HcmHFReferralModel, $Out>
    implements HcmHFReferralModelCopyWith<$R, HcmHFReferralModel, $Out> {
  _HcmHFReferralModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HcmHFReferralModel> $mapper =
      HcmHFReferralModelMapper.ensureInitialized();
  @override
  ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields,
          ReferralAdditionalFields>?
      get additionalFields => $value.additionalFields?.copyWith
          .$chain((v) => call(additionalFields: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  $R call(
          {Object? id = $none,
          Object? tenantId = $none,
          Object? name = $none,
          Object? projectId = $none,
          Object? projectFacilityId = $none,
          Object? symptomSurveyId = $none,
          Object? beneficiaryId = $none,
          Object? referralCode = $none,
          Object? nationalLevelId = $none,
          Object? symptom = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? rowVersion = $none,
          Object? additionalFields = $none,
          Object? auditDetails = $none,
          Object? clientAuditDetails = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (tenantId != $none) #tenantId: tenantId,
        if (name != $none) #name: name,
        if (projectId != $none) #projectId: projectId,
        if (projectFacilityId != $none) #projectFacilityId: projectFacilityId,
        if (symptomSurveyId != $none) #symptomSurveyId: symptomSurveyId,
        if (beneficiaryId != $none) #beneficiaryId: beneficiaryId,
        if (referralCode != $none) #referralCode: referralCode,
        if (nationalLevelId != $none) #nationalLevelId: nationalLevelId,
        if (symptom != $none) #symptom: symptom,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (additionalFields != $none) #additionalFields: additionalFields,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none) #clientAuditDetails: clientAuditDetails
      }));
  @override
  HcmHFReferralModel $make(CopyWithData data) => HcmHFReferralModel(
      id: data.get(#id, or: $value.id),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      name: data.get(#name, or: $value.name),
      projectId: data.get(#projectId, or: $value.projectId),
      projectFacilityId:
          data.get(#projectFacilityId, or: $value.projectFacilityId),
      symptomSurveyId: data.get(#symptomSurveyId, or: $value.symptomSurveyId),
      beneficiaryId: data.get(#beneficiaryId, or: $value.beneficiaryId),
      referralCode: data.get(#referralCode, or: $value.referralCode),
      nationalLevelId: data.get(#nationalLevelId, or: $value.nationalLevelId),
      symptom: data.get(#symptom, or: $value.symptom),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      additionalFields:
          data.get(#additionalFields, or: $value.additionalFields),
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails));

  @override
  HcmHFReferralModelCopyWith<$R2, HcmHFReferralModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HcmHFReferralModelCopyWithImpl($value, $cast, t);
}

class ReferralAdditionalFieldsMapper
    extends ClassMapperBase<ReferralAdditionalFields> {
  ReferralAdditionalFieldsMapper._();

  static ReferralAdditionalFieldsMapper? _instance;
  static ReferralAdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ReferralAdditionalFieldsMapper._());
      AdditionalFieldsMapper.ensureInitialized();
      AdditionalFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ReferralAdditionalFields';

  static List<AdditionalField> _$fields(ReferralAdditionalFields v) => v.fields;
  static const Field<ReferralAdditionalFields, List<AdditionalField>>
      _f$fields = Field('fields', _$fields, opt: true, def: const []);
  static String? _$schema(ReferralAdditionalFields v) => v.schema;
  static const Field<ReferralAdditionalFields, String> _f$schema =
      Field('schema', _$schema, opt: true);
  static int _$version(ReferralAdditionalFields v) => v.version;
  static const Field<ReferralAdditionalFields, int> _f$version =
      Field('version', _$version);

  @override
  final MappableFields<ReferralAdditionalFields> fields = const {
    #fields: _f$fields,
    #schema: _f$schema,
    #version: _f$version,
  };

  static ReferralAdditionalFields _instantiate(DecodingData data) {
    return ReferralAdditionalFields(
        fields: data.dec(_f$fields),
        schema: data.dec(_f$schema),
        version: data.dec(_f$version));
  }

  @override
  final Function instantiate = _instantiate;

  static ReferralAdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ReferralAdditionalFields>(map);
  }

  static ReferralAdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<ReferralAdditionalFields>(json);
  }
}

mixin ReferralAdditionalFieldsMappable {
  String toJson() {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .encodeJson<ReferralAdditionalFields>(this as ReferralAdditionalFields);
  }

  Map<String, dynamic> toMap() {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .encodeMap<ReferralAdditionalFields>(this as ReferralAdditionalFields);
  }

  ReferralAdditionalFieldsCopyWith<ReferralAdditionalFields,
          ReferralAdditionalFields, ReferralAdditionalFields>
      get copyWith => _ReferralAdditionalFieldsCopyWithImpl(
          this as ReferralAdditionalFields, $identity, $identity);
  @override
  String toString() {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .stringifyValue(this as ReferralAdditionalFields);
  }

  @override
  bool operator ==(Object other) {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .equalsValue(this as ReferralAdditionalFields, other);
  }

  @override
  int get hashCode {
    return ReferralAdditionalFieldsMapper.ensureInitialized()
        .hashValue(this as ReferralAdditionalFields);
  }
}

extension ReferralAdditionalFieldsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ReferralAdditionalFields, $Out> {
  ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields, $Out>
      get $asReferralAdditionalFields => $base
          .as((v, t, t2) => _ReferralAdditionalFieldsCopyWithImpl(v, t, t2));
}

abstract class ReferralAdditionalFieldsCopyWith<
    $R,
    $In extends ReferralAdditionalFields,
    $Out> implements AdditionalFieldsCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  @override
  $R call({List<AdditionalField>? fields, String? schema, int? version});
  ReferralAdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ReferralAdditionalFieldsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ReferralAdditionalFields, $Out>
    implements
        ReferralAdditionalFieldsCopyWith<$R, ReferralAdditionalFields, $Out> {
  _ReferralAdditionalFieldsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ReferralAdditionalFields> $mapper =
      ReferralAdditionalFieldsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, AdditionalField,
          AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>>
      get fields => ListCopyWith($value.fields, (v, t) => v.copyWith.$chain(t),
          (v) => call(fields: v));
  @override
  $R call(
          {List<AdditionalField>? fields,
          Object? schema = $none,
          int? version}) =>
      $apply(FieldCopyWithData({
        if (fields != null) #fields: fields,
        if (schema != $none) #schema: schema,
        if (version != null) #version: version
      }));
  @override
  ReferralAdditionalFields $make(CopyWithData data) => ReferralAdditionalFields(
      fields: data.get(#fields, or: $value.fields),
      schema: data.get(#schema, or: $value.schema),
      version: data.get(#version, or: $value.version));

  @override
  ReferralAdditionalFieldsCopyWith<$R2, ReferralAdditionalFields, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ReferralAdditionalFieldsCopyWithImpl($value, $cast, t);
}
