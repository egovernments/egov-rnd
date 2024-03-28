// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'project_staff.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectStaffSearchModel with ProjectStaffSearchModelMappable {
  final String? id;
  final List<String>? staffId;
  final String? userId;
  final String? projectId;
  final String? tenantId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  ProjectStaffSearchModel({
    this.id,
    this.staffId,
    this.userId,
    this.projectId,
    this.tenantId,
    int? startDate,
    int? endDate,
  })  : startDateTime = startDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = endDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(endDate),
        super();

  @MappableConstructor()
  ProjectStaffSearchModel.ignoreDeleted({
    this.id,
    this.staffId,
    this.userId,
    this.projectId,
    this.tenantId,
    int? startDate,
    int? endDate,
  })  : startDateTime = startDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = endDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(endDate),
        super();

  int? get startDate => startDateTime?.millisecondsSinceEpoch;

  int? get endDate => endDateTime?.millisecondsSinceEpoch;
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectStaffModel with ProjectStaffModelMappable {
  static const schemaName = 'ProjectStaff';

  final String id;
  final String? staffId;
  final String? userId;
  final String? projectId;
  final String? channel;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  ProjectStaffModel({
    required this.id,
    this.staffId,
    this.userId,
    this.projectId,
    this.channel,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    int? startDate,
    int? endDate,
  })  : startDateTime = startDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(startDate),
        endDateTime = endDate == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(endDate),
        super();

  int? get startDate => startDateTime?.millisecondsSinceEpoch;

  int? get endDate => endDateTime?.millisecondsSinceEpoch;
}
