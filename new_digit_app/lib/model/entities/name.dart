// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

part 'name.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class NameSearchModel with NameSearchModelMappable {
  final String? id;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final String? tenantId;

  NameSearchModel({
    this.id,
    this.givenName,
    this.familyName,
    this.otherNames,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  NameSearchModel.ignoreDeleted({
    this.id,
    this.givenName,
    this.familyName,
    this.otherNames,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class NameModel with NameModelMappable {
  static const schemaName = 'Name';

  final String? id;
  final String? individualClientReferenceId;
  final String? givenName;
  final String? familyName;
  final String? otherNames;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;

  NameModel({
    this.id,
    this.individualClientReferenceId,
    this.givenName,
    this.familyName,
    this.otherNames,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
