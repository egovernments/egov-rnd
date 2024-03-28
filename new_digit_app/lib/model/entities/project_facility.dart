// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'project_facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilitySearchModel with ProjectFacilitySearchModelMappable {
  final String? id;
  final List<String>? facilityId;
  final List<String>? projectId;
  final String? tenantId;

  ProjectFacilitySearchModel({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
  });

  @MappableConstructor()
  ProjectFacilitySearchModel.ignoreDeleted({
    this.id,
    this.facilityId,
    this.projectId,
    this.tenantId,
  });
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class ProjectFacilityModel with ProjectFacilityModelMappable {
  static const schemaName = 'ProjectFacility';

  final String id;
  final String facilityId;
  final String projectId;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  ProjectFacilityModel({
    required this.id,
    required this.facilityId,
    required this.projectId,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  });
}
