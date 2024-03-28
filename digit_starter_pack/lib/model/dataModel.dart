import 'package:dart_mappable/dart_mappable.dart';

part 'dataModel.mapper.dart';

@MappableEnum()
enum ApiOperation { login, create, search, update, delete }

@MappableEnum()
enum DataModelType {
  user,
  address,
  individual,
  attendanceRegister,
  attendance,
  project,
  projectFacility,
  projectProductVariant,
  projectStaff,
  projectResource,
  projectType,
  Facility,
  stock,
}

// // @MappableClass()
class ActionPathModel {
  final DataModelType type;
  final String path;
  final ApiOperation operation;

  const ActionPathModel({
    required this.operation,
    required this.type,
    required this.path,
  });
}

@MappableClass()
class AuditDetails with AuditDetailsMappable {
  final String createdBy;
  final String lastModifiedBy;
  final int createdTime;
  final int lastModifiedTime;

  const AuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  })  : lastModifiedBy = lastModifiedBy ?? createdBy,
        lastModifiedTime = lastModifiedTime ?? createdTime;
}

@MappableClass()
class ClientAuditDetails with ClientAuditDetailsMappable {
  final int createdTime;
  final int? lastModifiedTime;
  final String createdBy;
  final String lastModifiedBy;

  ClientAuditDetails({
    required this.createdBy,
    required this.createdTime,
    String? lastModifiedBy,
    int? lastModifiedTime,
  })  : lastModifiedBy = lastModifiedBy ?? createdBy,
        lastModifiedTime = lastModifiedTime ?? createdTime;
}
