// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_attendance_model.dart';

class HCMAttendanceSearchModelMapper
    extends ClassMapperBase<HCMAttendanceSearchModel> {
  HCMAttendanceSearchModelMapper._();

  static HCMAttendanceSearchModelMapper? _instance;
  static HCMAttendanceSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceSearchModel';

  static String? _$id(HCMAttendanceSearchModel v) => v.id;
  static const Field<HCMAttendanceSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$staffId(HCMAttendanceSearchModel v) => v.staffId;
  static const Field<HCMAttendanceSearchModel, String> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$registerNumber(HCMAttendanceSearchModel v) =>
      v.registerNumber;
  static const Field<HCMAttendanceSearchModel, String> _f$registerNumber =
      Field('registerNumber', _$registerNumber, opt: true);
  static String? _$status(HCMAttendanceSearchModel v) => v.status;
  static const Field<HCMAttendanceSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$referenceId(HCMAttendanceSearchModel v) => v.referenceId;
  static const Field<HCMAttendanceSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$serviceCode(HCMAttendanceSearchModel v) => v.serviceCode;
  static const Field<HCMAttendanceSearchModel, String> _f$serviceCode =
      Field('serviceCode', _$serviceCode, opt: true);

  @override
  final MappableFields<HCMAttendanceSearchModel> fields = const {
    #id: _f$id,
    #staffId: _f$staffId,
    #registerNumber: _f$registerNumber,
    #status: _f$status,
    #referenceId: _f$referenceId,
    #serviceCode: _f$serviceCode,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceSearchModel _instantiate(DecodingData data) {
    return HCMAttendanceSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        registerNumber: data.dec(_f$registerNumber),
        status: data.dec(_f$status),
        referenceId: data.dec(_f$referenceId),
        serviceCode: data.dec(_f$serviceCode));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceSearchModel>(map);
  }

  static HCMAttendanceSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceSearchModel>(json);
  }
}

mixin HCMAttendanceSearchModelMappable {
  String toJson() {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceSearchModel>(this as HCMAttendanceSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceSearchModel>(this as HCMAttendanceSearchModel);
  }

  HCMAttendanceSearchModelCopyWith<HCMAttendanceSearchModel,
          HCMAttendanceSearchModel, HCMAttendanceSearchModel>
      get copyWith => _HCMAttendanceSearchModelCopyWithImpl(
          this as HCMAttendanceSearchModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceSearchModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceSearchModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceSearchModel);
  }
}

extension HCMAttendanceSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceSearchModel, $Out> {
  HCMAttendanceSearchModelCopyWith<$R, HCMAttendanceSearchModel, $Out>
      get $asHCMAttendanceSearchModel => $base
          .as((v, t, t2) => _HCMAttendanceSearchModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceSearchModelCopyWith<
    $R,
    $In extends HCMAttendanceSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? staffId,
      String? registerNumber,
      String? status,
      String? referenceId,
      String? serviceCode});
  HCMAttendanceSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceSearchModel, $Out>
    implements
        HCMAttendanceSearchModelCopyWith<$R, HCMAttendanceSearchModel, $Out> {
  _HCMAttendanceSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceSearchModel> $mapper =
      HCMAttendanceSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? staffId = $none,
          Object? registerNumber = $none,
          Object? status = $none,
          Object? referenceId = $none,
          Object? serviceCode = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (registerNumber != $none) #registerNumber: registerNumber,
        if (status != $none) #status: status,
        if (referenceId != $none) #referenceId: referenceId,
        if (serviceCode != $none) #serviceCode: serviceCode
      }));
  @override
  HCMAttendanceSearchModel $make(CopyWithData data) =>
      HCMAttendanceSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          staffId: data.get(#staffId, or: $value.staffId),
          registerNumber: data.get(#registerNumber, or: $value.registerNumber),
          status: data.get(#status, or: $value.status),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          serviceCode: data.get(#serviceCode, or: $value.serviceCode));

  @override
  HCMAttendanceSearchModelCopyWith<$R2, HCMAttendanceSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceSearchModelCopyWithImpl($value, $cast, t);
}

class HCMAttendanceRegisterModelMapper
    extends ClassMapperBase<HCMAttendanceRegisterModel> {
  HCMAttendanceRegisterModelMapper._();

  static HCMAttendanceRegisterModelMapper? _instance;
  static HCMAttendanceRegisterModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceRegisterModelMapper._());
      ClientAuditDetailsMapper.ensureInitialized();
      AuditDetailsMapper.ensureInitialized();
      AttendanceRegisterModelMapper.ensureInitialized();
      IndividualModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceRegisterModel';

  static ClientAuditDetails? _$clientAuditDetails(
          HCMAttendanceRegisterModel v) =>
      v.clientAuditDetails;
  static const Field<HCMAttendanceRegisterModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static AuditDetails? _$auditDetails(HCMAttendanceRegisterModel v) =>
      v.auditDetails;
  static const Field<HCMAttendanceRegisterModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static AttendanceRegisterModel _$attendanceRegister(
          HCMAttendanceRegisterModel v) =>
      v.attendanceRegister;
  static const Field<HCMAttendanceRegisterModel, AttendanceRegisterModel>
      _f$attendanceRegister = Field('attendanceRegister', _$attendanceRegister);
  static List<IndividualModel>? _$individualList(
          HCMAttendanceRegisterModel v) =>
      v.individualList;
  static const Field<HCMAttendanceRegisterModel, List<IndividualModel>>
      _f$individualList = Field('individualList', _$individualList, opt: true);

  @override
  final MappableFields<HCMAttendanceRegisterModel> fields = const {
    #clientAuditDetails: _f$clientAuditDetails,
    #auditDetails: _f$auditDetails,
    #attendanceRegister: _f$attendanceRegister,
    #individualList: _f$individualList,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceRegisterModel _instantiate(DecodingData data) {
    return HCMAttendanceRegisterModel(
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        auditDetails: data.dec(_f$auditDetails),
        attendanceRegister: data.dec(_f$attendanceRegister),
        individualList: data.dec(_f$individualList));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceRegisterModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceRegisterModel>(map);
  }

  static HCMAttendanceRegisterModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceRegisterModel>(json);
  }
}

mixin HCMAttendanceRegisterModelMappable {
  String toJson() {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceRegisterModel>(
            this as HCMAttendanceRegisterModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceRegisterModel>(
            this as HCMAttendanceRegisterModel);
  }

  HCMAttendanceRegisterModelCopyWith<HCMAttendanceRegisterModel,
          HCMAttendanceRegisterModel, HCMAttendanceRegisterModel>
      get copyWith => _HCMAttendanceRegisterModelCopyWithImpl(
          this as HCMAttendanceRegisterModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceRegisterModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceRegisterModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceRegisterModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceRegisterModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceRegisterModel);
  }
}

extension HCMAttendanceRegisterModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceRegisterModel, $Out> {
  HCMAttendanceRegisterModelCopyWith<$R, HCMAttendanceRegisterModel, $Out>
      get $asHCMAttendanceRegisterModel => $base
          .as((v, t, t2) => _HCMAttendanceRegisterModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceRegisterModelCopyWith<
    $R,
    $In extends HCMAttendanceRegisterModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  AttendanceRegisterModelCopyWith<$R, AttendanceRegisterModel,
      AttendanceRegisterModel> get attendanceRegister;
  ListCopyWith<$R, IndividualModel,
          IndividualModelCopyWith<$R, IndividualModel, IndividualModel>>?
      get individualList;
  $R call(
      {ClientAuditDetails? clientAuditDetails,
      AuditDetails? auditDetails,
      AttendanceRegisterModel? attendanceRegister,
      List<IndividualModel>? individualList});
  HCMAttendanceRegisterModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceRegisterModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceRegisterModel, $Out>
    implements
        HCMAttendanceRegisterModelCopyWith<$R, HCMAttendanceRegisterModel,
            $Out> {
  _HCMAttendanceRegisterModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceRegisterModel> $mapper =
      HCMAttendanceRegisterModelMapper.ensureInitialized();
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  AttendanceRegisterModelCopyWith<$R, AttendanceRegisterModel,
          AttendanceRegisterModel>
      get attendanceRegister => $value.attendanceRegister.copyWith
          .$chain((v) => call(attendanceRegister: v));
  @override
  ListCopyWith<$R, IndividualModel,
          IndividualModelCopyWith<$R, IndividualModel, IndividualModel>>?
      get individualList => $value.individualList != null
          ? ListCopyWith($value.individualList!, (v, t) => v.copyWith.$chain(t),
              (v) => call(individualList: v))
          : null;
  @override
  $R call(
          {Object? clientAuditDetails = $none,
          Object? auditDetails = $none,
          AttendanceRegisterModel? attendanceRegister,
          Object? individualList = $none}) =>
      $apply(FieldCopyWithData({
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (attendanceRegister != null) #attendanceRegister: attendanceRegister,
        if (individualList != $none) #individualList: individualList
      }));
  @override
  HCMAttendanceRegisterModel $make(
          CopyWithData data) =>
      HCMAttendanceRegisterModel(
          clientAuditDetails:
              data.get(#clientAuditDetails, or: $value.clientAuditDetails),
          auditDetails: data.get(#auditDetails, or: $value.auditDetails),
          attendanceRegister:
              data.get(#attendanceRegister, or: $value.attendanceRegister),
          individualList: data.get(#individualList, or: $value.individualList));

  @override
  HCMAttendanceRegisterModelCopyWith<$R2, HCMAttendanceRegisterModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceRegisterModelCopyWithImpl($value, $cast, t);
}
