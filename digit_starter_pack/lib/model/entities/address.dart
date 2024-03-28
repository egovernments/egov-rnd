// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';
import 'package:new_digit_app/model/entities/address_type.dart';
import 'package:new_digit_app/model/entities/locality.dart';

part 'address.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AddressSearchModel with AddressSearchModelMappable {
  final String? id;
  final double? latitude;
  final double? longitude;
  final int? limit;
  final int? offset;
  final double? maxRadius;
  final String? tenantId;

  AddressSearchModel({
    this.id,
    this.latitude,
    this.longitude,
    this.limit,
    this.offset,
    this.maxRadius,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  AddressSearchModel.ignoreDeleted({
    this.id,
    this.latitude,
    this.longitude,
    this.limit,
    this.offset,
    this.maxRadius,
    this.tenantId,
  }) : super();
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class AddressModel with AddressModelMappable {
  static const schemaName = 'Address';

  final String? id;
  final String? relatedClientReferenceId;
  final String? doorNo;
  final double? latitude;
  final double? longitude;
  final double? locationAccuracy;
  final String? addressLine1;
  final String? addressLine2;
  final String? landmark;
  final String? city;
  final String? pincode;
  final String? buildingName;
  final String? street;
  final String? boundaryType;
  final String? boundary;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final AddressType? type;
  final LocalityModel? locality;

  AddressModel({
    this.id,
    this.relatedClientReferenceId,
    this.doorNo,
    this.latitude,
    this.longitude,
    this.locationAccuracy,
    this.addressLine1,
    this.addressLine2,
    this.landmark,
    this.city,
    this.pincode,
    this.buildingName,
    this.street,
    this.boundaryType,
    this.boundary,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.type,
    this.locality,
  }) : super();
}
