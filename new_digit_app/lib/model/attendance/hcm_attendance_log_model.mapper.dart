// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'hcm_attendance_log_model.dart';

class HCMAttendanceLogSearchModelMapper
    extends ClassMapperBase<HCMAttendanceLogSearchModel> {
  HCMAttendanceLogSearchModelMapper._();

  static HCMAttendanceLogSearchModelMapper? _instance;
  static HCMAttendanceLogSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = HCMAttendanceLogSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceLogSearchModel';

  static String? _$id(HCMAttendanceLogSearchModel v) => v.id;
  static const Field<HCMAttendanceLogSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$registerId(HCMAttendanceLogSearchModel v) => v.registerId;
  static const Field<HCMAttendanceLogSearchModel, String> _f$registerId =
      Field('registerId', _$registerId, opt: true);
  static String? _$individualId(HCMAttendanceLogSearchModel v) =>
      v.individualId;
  static const Field<HCMAttendanceLogSearchModel, String> _f$individualId =
      Field('individualId', _$individualId, opt: true);
  static String? _$status(HCMAttendanceLogSearchModel v) => v.status;
  static const Field<HCMAttendanceLogSearchModel, String> _f$status =
      Field('status', _$status, opt: true);
  static String? _$type(HCMAttendanceLogSearchModel v) => v.type;
  static const Field<HCMAttendanceLogSearchModel, String> _f$type =
      Field('type', _$type, opt: true);
  static String? _$tenantId(HCMAttendanceLogSearchModel v) => v.tenantId;
  static const Field<HCMAttendanceLogSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$time(HCMAttendanceLogSearchModel v) => v.time;
  static const Field<HCMAttendanceLogSearchModel, int> _f$time =
      Field('time', _$time, opt: true);
  static int? _$entryTime(HCMAttendanceLogSearchModel v) => v.entryTime;
  static const Field<HCMAttendanceLogSearchModel, int> _f$entryTime =
      Field('entryTime', _$entryTime, opt: true);
  static int? _$exitTime(HCMAttendanceLogSearchModel v) => v.exitTime;
  static const Field<HCMAttendanceLogSearchModel, int> _f$exitTime =
      Field('exitTime', _$exitTime, opt: true);
  static List<String>? _$clientReferenceId(HCMAttendanceLogSearchModel v) =>
      v.clientReferenceId;
  static const Field<HCMAttendanceLogSearchModel, List<String>>
      _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static bool? _$uploadToServer(HCMAttendanceLogSearchModel v) =>
      v.uploadToServer;
  static const Field<HCMAttendanceLogSearchModel, bool> _f$uploadToServer =
      Field('uploadToServer', _$uploadToServer, opt: true);

  @override
  final MappableFields<HCMAttendanceLogSearchModel> fields = const {
    #id: _f$id,
    #registerId: _f$registerId,
    #individualId: _f$individualId,
    #status: _f$status,
    #type: _f$type,
    #tenantId: _f$tenantId,
    #time: _f$time,
    #entryTime: _f$entryTime,
    #exitTime: _f$exitTime,
    #clientReferenceId: _f$clientReferenceId,
    #uploadToServer: _f$uploadToServer,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceLogSearchModel _instantiate(DecodingData data) {
    return HCMAttendanceLogSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        registerId: data.dec(_f$registerId),
        individualId: data.dec(_f$individualId),
        status: data.dec(_f$status),
        type: data.dec(_f$type),
        tenantId: data.dec(_f$tenantId),
        time: data.dec(_f$time),
        entryTime: data.dec(_f$entryTime),
        exitTime: data.dec(_f$exitTime),
        clientReferenceId: data.dec(_f$clientReferenceId),
        uploadToServer: data.dec(_f$uploadToServer));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceLogSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceLogSearchModel>(map);
  }

  static HCMAttendanceLogSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceLogSearchModel>(json);
  }
}

mixin HCMAttendanceLogSearchModelMappable {
  String toJson() {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceLogSearchModel>(
            this as HCMAttendanceLogSearchModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceLogSearchModel>(
            this as HCMAttendanceLogSearchModel);
  }

  HCMAttendanceLogSearchModelCopyWith<HCMAttendanceLogSearchModel,
          HCMAttendanceLogSearchModel, HCMAttendanceLogSearchModel>
      get copyWith => _HCMAttendanceLogSearchModelCopyWithImpl(
          this as HCMAttendanceLogSearchModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceLogSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceLogSearchModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceLogSearchModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceLogSearchModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceLogSearchModel);
  }
}

extension HCMAttendanceLogSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceLogSearchModel, $Out> {
  HCMAttendanceLogSearchModelCopyWith<$R, HCMAttendanceLogSearchModel, $Out>
      get $asHCMAttendanceLogSearchModel => $base
          .as((v, t, t2) => _HCMAttendanceLogSearchModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceLogSearchModelCopyWith<
    $R,
    $In extends HCMAttendanceLogSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  $R call(
      {String? id,
      String? registerId,
      String? individualId,
      String? status,
      String? type,
      String? tenantId,
      int? time,
      int? entryTime,
      int? exitTime,
      List<String>? clientReferenceId,
      bool? uploadToServer});
  HCMAttendanceLogSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceLogSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceLogSearchModel, $Out>
    implements
        HCMAttendanceLogSearchModelCopyWith<$R, HCMAttendanceLogSearchModel,
            $Out> {
  _HCMAttendanceLogSearchModelCopyWithImpl(
      super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceLogSearchModel> $mapper =
      HCMAttendanceLogSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? registerId = $none,
          Object? individualId = $none,
          Object? status = $none,
          Object? type = $none,
          Object? tenantId = $none,
          Object? time = $none,
          Object? entryTime = $none,
          Object? exitTime = $none,
          Object? clientReferenceId = $none,
          Object? uploadToServer = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (registerId != $none) #registerId: registerId,
        if (individualId != $none) #individualId: individualId,
        if (status != $none) #status: status,
        if (type != $none) #type: type,
        if (tenantId != $none) #tenantId: tenantId,
        if (time != $none) #time: time,
        if (entryTime != $none) #entryTime: entryTime,
        if (exitTime != $none) #exitTime: exitTime,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (uploadToServer != $none) #uploadToServer: uploadToServer
      }));
  @override
  HCMAttendanceLogSearchModel $make(CopyWithData data) =>
      HCMAttendanceLogSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          registerId: data.get(#registerId, or: $value.registerId),
          individualId: data.get(#individualId, or: $value.individualId),
          status: data.get(#status, or: $value.status),
          type: data.get(#type, or: $value.type),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          time: data.get(#time, or: $value.time),
          entryTime: data.get(#entryTime, or: $value.entryTime),
          exitTime: data.get(#exitTime, or: $value.exitTime),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          uploadToServer: data.get(#uploadToServer, or: $value.uploadToServer));

  @override
  HCMAttendanceLogSearchModelCopyWith<$R2, HCMAttendanceLogSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceLogSearchModelCopyWithImpl($value, $cast, t);
}

class HCMAttendanceLogModelMapper
    extends ClassMapperBase<HCMAttendanceLogModel> {
  HCMAttendanceLogModelMapper._();

  static HCMAttendanceLogModelMapper? _instance;
  static HCMAttendanceLogModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HCMAttendanceLogModelMapper._());
      AuditDetailsMapper.ensureInitialized();
      ClientAuditDetailsMapper.ensureInitialized();
      AttendanceLogModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HCMAttendanceLogModel';

  static AuditDetails? _$auditDetails(HCMAttendanceLogModel v) =>
      v.auditDetails;
  static const Field<HCMAttendanceLogModel, AuditDetails> _f$auditDetails =
      Field('auditDetails', _$auditDetails, opt: true);
  static ClientAuditDetails? _$clientAuditDetails(HCMAttendanceLogModel v) =>
      v.clientAuditDetails;
  static const Field<HCMAttendanceLogModel, ClientAuditDetails>
      _f$clientAuditDetails =
      Field('clientAuditDetails', _$clientAuditDetails, opt: true);
  static AttendanceLogModel? _$attendance(HCMAttendanceLogModel v) =>
      v.attendance;
  static const Field<HCMAttendanceLogModel, AttendanceLogModel> _f$attendance =
      Field('attendance', _$attendance, opt: true);
  static bool? _$nonRecoverableError(HCMAttendanceLogModel v) =>
      v.nonRecoverableError;
  static const Field<HCMAttendanceLogModel, bool> _f$nonRecoverableError =
      Field('nonRecoverableError', _$nonRecoverableError,
          opt: true, def: false);
  static int? _$rowVersion(HCMAttendanceLogModel v) => v.rowVersion;
  static const Field<HCMAttendanceLogModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<HCMAttendanceLogModel> fields = const {
    #auditDetails: _f$auditDetails,
    #clientAuditDetails: _f$clientAuditDetails,
    #attendance: _f$attendance,
    #nonRecoverableError: _f$nonRecoverableError,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static HCMAttendanceLogModel _instantiate(DecodingData data) {
    return HCMAttendanceLogModel(
        auditDetails: data.dec(_f$auditDetails),
        clientAuditDetails: data.dec(_f$clientAuditDetails),
        attendance: data.dec(_f$attendance),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static HCMAttendanceLogModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HCMAttendanceLogModel>(map);
  }

  static HCMAttendanceLogModel fromJson(String json) {
    return ensureInitialized().decodeJson<HCMAttendanceLogModel>(json);
  }
}

mixin HCMAttendanceLogModelMappable {
  String toJson() {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .encodeJson<HCMAttendanceLogModel>(this as HCMAttendanceLogModel);
  }

  Map<String, dynamic> toMap() {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .encodeMap<HCMAttendanceLogModel>(this as HCMAttendanceLogModel);
  }

  HCMAttendanceLogModelCopyWith<HCMAttendanceLogModel, HCMAttendanceLogModel,
          HCMAttendanceLogModel>
      get copyWith => _HCMAttendanceLogModelCopyWithImpl(
          this as HCMAttendanceLogModel, $identity, $identity);
  @override
  String toString() {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .stringifyValue(this as HCMAttendanceLogModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            HCMAttendanceLogModelMapper.ensureInitialized()
                .isValueEqual(this as HCMAttendanceLogModel, other));
  }

  @override
  int get hashCode {
    return HCMAttendanceLogModelMapper.ensureInitialized()
        .hashValue(this as HCMAttendanceLogModel);
  }
}

extension HCMAttendanceLogModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HCMAttendanceLogModel, $Out> {
  HCMAttendanceLogModelCopyWith<$R, HCMAttendanceLogModel, $Out>
      get $asHCMAttendanceLogModel =>
          $base.as((v, t, t2) => _HCMAttendanceLogModelCopyWithImpl(v, t, t2));
}

abstract class HCMAttendanceLogModelCopyWith<
    $R,
    $In extends HCMAttendanceLogModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails;
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails;
  AttendanceLogModelCopyWith<$R, AttendanceLogModel, AttendanceLogModel>?
      get attendance;
  $R call(
      {AuditDetails? auditDetails,
      ClientAuditDetails? clientAuditDetails,
      AttendanceLogModel? attendance,
      bool? nonRecoverableError,
      int? rowVersion});
  HCMAttendanceLogModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HCMAttendanceLogModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HCMAttendanceLogModel, $Out>
    implements HCMAttendanceLogModelCopyWith<$R, HCMAttendanceLogModel, $Out> {
  _HCMAttendanceLogModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HCMAttendanceLogModel> $mapper =
      HCMAttendanceLogModelMapper.ensureInitialized();
  @override
  AuditDetailsCopyWith<$R, AuditDetails, AuditDetails>? get auditDetails =>
      $value.auditDetails?.copyWith.$chain((v) => call(auditDetails: v));
  @override
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, ClientAuditDetails>?
      get clientAuditDetails => $value.clientAuditDetails?.copyWith
          .$chain((v) => call(clientAuditDetails: v));
  @override
  AttendanceLogModelCopyWith<$R, AttendanceLogModel, AttendanceLogModel>?
      get attendance =>
          $value.attendance?.copyWith.$chain((v) => call(attendance: v));
  @override
  $R call(
          {Object? auditDetails = $none,
          Object? clientAuditDetails = $none,
          Object? attendance = $none,
          Object? nonRecoverableError = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (auditDetails != $none) #auditDetails: auditDetails,
        if (clientAuditDetails != $none)
          #clientAuditDetails: clientAuditDetails,
        if (attendance != $none) #attendance: attendance,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  HCMAttendanceLogModel $make(CopyWithData data) => HCMAttendanceLogModel(
      auditDetails: data.get(#auditDetails, or: $value.auditDetails),
      clientAuditDetails:
          data.get(#clientAuditDetails, or: $value.clientAuditDetails),
      attendance: data.get(#attendance, or: $value.attendance),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  HCMAttendanceLogModelCopyWith<$R2, HCMAttendanceLogModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _HCMAttendanceLogModelCopyWithImpl($value, $cast, t);
}
