// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';

part 'identifier.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IdentifierSearchModel with IdentifierSearchModelMappable {
  final String? id;
  final String? identifierType;
  final String? identifierId;
  final List<String>? clientReferenceId;
  final String? tenantId;

  IdentifierSearchModel({
    this.id,
    this.identifierType,
    this.identifierId,
    this.clientReferenceId,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  IdentifierSearchModel.ignoreDeleted({
    this.id,
    this.identifierType,
    this.identifierId,
    this.clientReferenceId,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IdentifierModel with IdentifierModelMappable {
  static const schemaName = 'Identifier';

  final String? id;
  final String? identifierType;
  final String? identifierId;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;

  IdentifierModel({
    this.id,
    this.identifierType,
    this.identifierId,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
  }) : super();
}
