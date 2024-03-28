// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:new_digit_app/model/entities/address.dart';

part 'facility.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilitySearchModel with FacilitySearchModelMappable {
  final List<String>? id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final String? tenantId;

  FacilitySearchModel({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
  }) : super();

  @MappableConstructor()
  FacilitySearchModel.ignoreDeleted({
    this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.tenantId,
  });
}

@MappableClass(ignoreNull: true, discriminatorValue: MappableClass.useAsDefault)
class FacilityModel with FacilityModelMappable {
  static const schemaName = 'Facility';

  final String id;
  final bool? isPermanent;
  final String? usage;
  final int? storageCapacity;
  final bool? nonRecoverableError;
  final String? tenantId;
  final int? rowVersion;
  final AddressModel? address;

  FacilityModel({
    required this.id,
    this.isPermanent,
    this.usage,
    this.storageCapacity,
    this.nonRecoverableError = false,
    this.tenantId,
    this.rowVersion,
    this.address,
  }) : super();
}
