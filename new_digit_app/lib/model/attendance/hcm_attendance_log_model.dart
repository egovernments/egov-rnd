import 'package:attendance_management/models/attendance_log.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:new_digit_app/model/dataModel.dart';

part 'hcm_attendance_log_model.mapper.dart';

@MappableClass(ignoreNull: true)
class HCMAttendanceLogSearchModel with HCMAttendanceLogSearchModelMappable {
  final String? id;
  final String? tenantId;
  final String? registerId;
  final String? individualId;
  final int? time;
  final int? entryTime;
  final int? exitTime;
  final String? type;
  final String? status;
  final List<String>? clientReferenceId;
  final bool? uploadToServer;

  HCMAttendanceLogSearchModel({
    this.id,
    this.registerId,
    this.individualId,
    this.status,
    this.type,
    this.tenantId,
    this.time,
    this.entryTime,
    this.exitTime,
    this.clientReferenceId,
    this.uploadToServer,
  }) : super();

  @MappableConstructor()
  HCMAttendanceLogSearchModel.ignoreDeleted({
    this.id,
    this.registerId,
    this.individualId,
    this.status,
    this.type,
    this.tenantId,
    this.time,
    this.entryTime,
    this.exitTime,
    this.clientReferenceId,
    this.uploadToServer,
  }) : super();
}

@MappableClass(
  ignoreNull: true,
  discriminatorValue: MappableClass.useAsDefault,
)
class HCMAttendanceLogModel with HCMAttendanceLogModelMappable {
  static const schemaName = 'AttendanceLog';
  final AttendanceLogModel? attendance;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final AuditDetails? auditDetails;
  final ClientAuditDetails? clientAuditDetails;

  HCMAttendanceLogModel({
    this.auditDetails,
    this.clientAuditDetails,
    this.attendance,
    this.nonRecoverableError = false,
    this.rowVersion,
  }) : super();
}
