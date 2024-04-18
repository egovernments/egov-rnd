// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'locality.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class LocalitySearchModel with LocalitySearchModelMappable {
  final String? code;
  final String? name;
  final String? tenantId;

  LocalitySearchModel({
    this.code,
    this.name,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  LocalitySearchModel.ignoreDeleted({
    this.code,
    this.name,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class LocalityModel with LocalityModelMappable {
  static const schemaName = 'Locality';

  final String code;
  final String? name;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  LocalityModel({
    required this.code,
    this.name,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
