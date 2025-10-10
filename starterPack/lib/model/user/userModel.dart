import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';

part 'userModel.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class UserSearchModel with UserSearchModelMappable {
  final String? id;
  final String? userName;
  final List<String>? uuid;

  UserSearchModel({
    this.id,
    this.userName,
    this.uuid,
  }) : super();
}

@MappableClass(ignoreNull: true)
class UserModel with UserModelMappable {
  static const schemaName = 'user';

  final String? id;
  final String? userName;
  final String? salutation;
  final String? name;
  final String? gender;
  final String? mobileNumber;
  final String? emailId;
  final String? altContactNumber;
  final String? pan;
  final String? aadhaarNumber;
  final String? permanentAddress;
  final String? permanentCity;
  final String? permanentPinCode;
  final String? correspondenceAddress;
  final String? correspondenceCity;
  final String? correspondencePinCode;
  final String? alternatemobilenumber;
  final bool? active;
  final String? locale;
  final String? type;
  final bool? accountLocked;
  final int? accountLockedDate;
  final String? fatherOrHusbandName;
  final String? relationship;
  final String? signature;
  final String? bloodGroup;
  final String? photo;
  final String? identificationMark;
  final int? createdBy;
  final String? lastModifiedBy;
  final String? tenantId;
  final String? uuid;
  final String? createdDate;
  final bool? nonRecoverableError;
  final int? rowVersion;
  final List<Role>? roles;

  UserModel(
      {this.id,
      this.userName,
      this.salutation,
      this.name,
      this.gender,
      this.mobileNumber,
      this.emailId,
      this.altContactNumber,
      this.pan,
      this.aadhaarNumber,
      this.permanentAddress,
      this.permanentCity,
      this.permanentPinCode,
      this.correspondenceAddress,
      this.correspondenceCity,
      this.correspondencePinCode,
      this.alternatemobilenumber,
      this.active,
      this.locale,
      this.type,
      this.accountLocked,
      this.accountLockedDate,
      this.fatherOrHusbandName,
      this.relationship,
      this.signature,
      this.bloodGroup,
      this.photo,
      this.identificationMark,
      this.createdBy,
      this.lastModifiedBy,
      this.tenantId,
      this.uuid,
      this.createdDate,
      this.nonRecoverableError = false,
      this.rowVersion,
      this.roles})
      : super();
}

@MappableClass(ignoreNull: true)
class Role with RoleMappable {
  final String? code;
  final String? name;
  final String? tenantId;

  Role({required this.code, required this.name, required this.tenantId});
}
