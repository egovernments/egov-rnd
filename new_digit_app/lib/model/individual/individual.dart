// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:new_digit_app/model/entities/address.dart';
import 'package:new_digit_app/model/entities/blood_group.dart';
import 'package:new_digit_app/model/entities/gender.dart';
import 'package:new_digit_app/model/entities/identifier.dart';
import 'package:new_digit_app/model/entities/name.dart';

part 'individual.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IndividualSearchModel with IndividualSearchModelMappable {
  final List<String>? id;
  final List<String>? userUuid;
  final String? dateOfBirth;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final NameSearchModel? name;
  final Gender? gender;
  final List<IdentifierSearchModel>? identifiers;

  IndividualSearchModel({
    this.id,
    this.userUuid,
    this.dateOfBirth,
    this.clientReferenceId,
    this.tenantId,
    this.name,
    this.gender,
    this.identifiers,
  }) : super();

  @MappableConstructor()
  IndividualSearchModel.ignoreDeleted({
    this.id,
    this.userUuid,
    this.dateOfBirth,
    this.clientReferenceId,
    this.tenantId,
    this.name,
    this.gender,
    this.identifiers,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class IndividualModel with IndividualModelMappable {
  static const schemaName = 'Individual';

  final String? id;
  final String? individualId;
  final String? userId;
  final String? userUuid;
  final String? dateOfBirth;
  final String? mobileNumber;
  final String? altContactNumber;
  final String? email;
  final String? fatherName;
  final String? husbandName;
  final String? photo;
  final bool? nonRecoverableError;
  final String clientReferenceId;
  final String? tenantId;
  final int? rowVersion;
  final NameModel? name;
  final BloodGroup? bloodGroup;
  final List<AddressModel>? address;
  final Gender? gender;
  final List<IdentifierModel>? identifiers;

  IndividualModel({
    this.id,
    this.individualId,
    this.userId,
    this.userUuid,
    this.dateOfBirth,
    this.mobileNumber,
    this.altContactNumber,
    this.email,
    this.fatherName,
    this.husbandName,
    this.photo,
    this.nonRecoverableError = false,
    required this.clientReferenceId,
    this.tenantId,
    this.rowVersion,
    this.name,
    this.bloodGroup,
    this.address,
    this.gender,
    this.identifiers,
  }) : super();
}
