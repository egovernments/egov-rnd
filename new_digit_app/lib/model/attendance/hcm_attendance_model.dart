import 'package:attendance_management/models/attendance_register.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:new_digit_app/model/individual/individual.dart';
import 'package:new_digit_app/model/dataModel.dart';

part 'hcm_attendance_model.mapper.dart';

//REMINDER:: IN THE HCMRegisterModel CREATE AND SEND THE CLIENTAUDITDETAILS AND AUDITDETAILS
@MappableClass(ignoreNull: true)
class HCMAttendanceSearchModel with HCMAttendanceSearchModelMappable {
  final String? id;
  final String? staffId;
  final String? registerNumber;
  final String? status;
  final String? referenceId;
  final String? serviceCode;

  HCMAttendanceSearchModel({
    this.id,
    this.staffId,
    this.registerNumber,
    this.status,
    this.serviceCode,
    this.referenceId,
  }) : super();

  @MappableConstructor()
  HCMAttendanceSearchModel.ignoreDeleted({
    this.id,
    this.staffId,
    this.registerNumber,
    this.status,
    this.referenceId,
    this.serviceCode,
  }) : super();
}

@MappableClass(ignoreNull: true)
class HCMAttendanceRegisterModel with HCMAttendanceRegisterModelMappable {
  static const schemaName = 'AttendanceRegister';
  final AttendanceRegisterModel attendanceRegister;
  final List<IndividualModel>? individualList;
  final ClientAuditDetails? clientAuditDetails;
  final AuditDetails? auditDetails;

  HCMAttendanceRegisterModel({
    this.clientAuditDetails,
    this.auditDetails,
    required this.attendanceRegister,
    this.individualList,
  }) : super();
}
