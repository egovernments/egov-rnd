// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:new_digit_app/model/entities/address.dart';

part 'project.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectSearchModelWrapper with ProjectSearchModelWrapperMappable {
  final List<ProjectSearchModel>? projects;

  ProjectSearchModelWrapper({this.projects});
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectSearchModel with ProjectSearchModelMappable {
  final String? id;
  final String? projectTypeId;
  final String? projectNumber;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String? department;
  final String? referenceId;
  final String? tenantId;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  ProjectSearchModel({
    this.id,
    this.projectTypeId,
    this.projectNumber,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.referenceId,
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
  ProjectSearchModel.ignoreDeleted({
    this.id,
    this.projectTypeId,
    this.projectNumber,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    this.department,
    this.referenceId,
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
class ProjectModel with ProjectModelMappable {
  static const schemaName = 'Project';

  final String id;
  final String? projectType;
  final String? projectTypeId;
  final String? projectNumber;
  final String? subProjectTypeId;
  final bool? isTaskEnabled;
  final String? parent;
  final String name;
  final String? department;
  final String? description;
  final String? referenceId;
  final String? projectHierarchy;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;

  final DateTime? startDateTime;
  final DateTime? endDateTime;

  ProjectModel({
    required this.id,
    this.projectType,
    this.projectTypeId,
    this.projectNumber,
    this.subProjectTypeId,
    this.isTaskEnabled,
    this.parent,
    required this.name,
    this.department,
    this.description,
    this.referenceId,
    this.projectHierarchy,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.address,
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
