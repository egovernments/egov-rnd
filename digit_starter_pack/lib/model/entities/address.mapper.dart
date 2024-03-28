// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'address.dart';

class AddressSearchModelMapper extends ClassMapperBase<AddressSearchModel> {
  AddressSearchModelMapper._();

  static AddressSearchModelMapper? _instance;
  static AddressSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AddressSearchModel';

  static String? _$id(AddressSearchModel v) => v.id;
  static const Field<AddressSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static double? _$latitude(AddressSearchModel v) => v.latitude;
  static const Field<AddressSearchModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(AddressSearchModel v) => v.longitude;
  static const Field<AddressSearchModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static int? _$limit(AddressSearchModel v) => v.limit;
  static const Field<AddressSearchModel, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$offset(AddressSearchModel v) => v.offset;
  static const Field<AddressSearchModel, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static double? _$maxRadius(AddressSearchModel v) => v.maxRadius;
  static const Field<AddressSearchModel, double> _f$maxRadius =
      Field('maxRadius', _$maxRadius, opt: true);
  static String? _$tenantId(AddressSearchModel v) => v.tenantId;
  static const Field<AddressSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<AddressSearchModel> fields = const {
    #id: _f$id,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #limit: _f$limit,
    #offset: _f$offset,
    #maxRadius: _f$maxRadius,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static AddressSearchModel _instantiate(DecodingData data) {
    return AddressSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        limit: data.dec(_f$limit),
        offset: data.dec(_f$offset),
        maxRadius: data.dec(_f$maxRadius),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressSearchModel>(map);
  }

  static AddressSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<AddressSearchModel>(json);
  }
}

mixin AddressSearchModelMappable {
  String toJson() {
    return AddressSearchModelMapper.ensureInitialized()
        .encodeJson<AddressSearchModel>(this as AddressSearchModel);
  }

  Map<String, dynamic> toMap() {
    return AddressSearchModelMapper.ensureInitialized()
        .encodeMap<AddressSearchModel>(this as AddressSearchModel);
  }

  AddressSearchModelCopyWith<AddressSearchModel, AddressSearchModel,
          AddressSearchModel>
      get copyWith => _AddressSearchModelCopyWithImpl(
          this as AddressSearchModel, $identity, $identity);
  @override
  String toString() {
    return AddressSearchModelMapper.ensureInitialized()
        .stringifyValue(this as AddressSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressSearchModelMapper.ensureInitialized()
                .isValueEqual(this as AddressSearchModel, other));
  }

  @override
  int get hashCode {
    return AddressSearchModelMapper.ensureInitialized()
        .hashValue(this as AddressSearchModel);
  }
}

extension AddressSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressSearchModel, $Out> {
  AddressSearchModelCopyWith<$R, AddressSearchModel, $Out>
      get $asAddressSearchModel =>
          $base.as((v, t, t2) => _AddressSearchModelCopyWithImpl(v, t, t2));
}

abstract class AddressSearchModelCopyWith<$R, $In extends AddressSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      double? latitude,
      double? longitude,
      int? limit,
      int? offset,
      double? maxRadius,
      String? tenantId});
  AddressSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AddressSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressSearchModel, $Out>
    implements AddressSearchModelCopyWith<$R, AddressSearchModel, $Out> {
  _AddressSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressSearchModel> $mapper =
      AddressSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? limit = $none,
          Object? offset = $none,
          Object? maxRadius = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (limit != $none) #limit: limit,
        if (offset != $none) #offset: offset,
        if (maxRadius != $none) #maxRadius: maxRadius,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  AddressSearchModel $make(CopyWithData data) =>
      AddressSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          latitude: data.get(#latitude, or: $value.latitude),
          longitude: data.get(#longitude, or: $value.longitude),
          limit: data.get(#limit, or: $value.limit),
          offset: data.get(#offset, or: $value.offset),
          maxRadius: data.get(#maxRadius, or: $value.maxRadius),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  AddressSearchModelCopyWith<$R2, AddressSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressSearchModelCopyWithImpl($value, $cast, t);
}

class AddressModelMapper extends ClassMapperBase<AddressModel> {
  AddressModelMapper._();

  static AddressModelMapper? _instance;
  static AddressModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AddressModelMapper._());
      AddressTypeMapper.ensureInitialized();
      LocalityModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AddressModel';

  static String? _$id(AddressModel v) => v.id;
  static const Field<AddressModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$relatedClientReferenceId(AddressModel v) =>
      v.relatedClientReferenceId;
  static const Field<AddressModel, String> _f$relatedClientReferenceId =
      Field('relatedClientReferenceId', _$relatedClientReferenceId, opt: true);
  static String? _$doorNo(AddressModel v) => v.doorNo;
  static const Field<AddressModel, String> _f$doorNo =
      Field('doorNo', _$doorNo, opt: true);
  static double? _$latitude(AddressModel v) => v.latitude;
  static const Field<AddressModel, double> _f$latitude =
      Field('latitude', _$latitude, opt: true);
  static double? _$longitude(AddressModel v) => v.longitude;
  static const Field<AddressModel, double> _f$longitude =
      Field('longitude', _$longitude, opt: true);
  static double? _$locationAccuracy(AddressModel v) => v.locationAccuracy;
  static const Field<AddressModel, double> _f$locationAccuracy =
      Field('locationAccuracy', _$locationAccuracy, opt: true);
  static String? _$addressLine1(AddressModel v) => v.addressLine1;
  static const Field<AddressModel, String> _f$addressLine1 =
      Field('addressLine1', _$addressLine1, opt: true);
  static String? _$addressLine2(AddressModel v) => v.addressLine2;
  static const Field<AddressModel, String> _f$addressLine2 =
      Field('addressLine2', _$addressLine2, opt: true);
  static String? _$landmark(AddressModel v) => v.landmark;
  static const Field<AddressModel, String> _f$landmark =
      Field('landmark', _$landmark, opt: true);
  static String? _$city(AddressModel v) => v.city;
  static const Field<AddressModel, String> _f$city =
      Field('city', _$city, opt: true);
  static String? _$pincode(AddressModel v) => v.pincode;
  static const Field<AddressModel, String> _f$pincode =
      Field('pincode', _$pincode, opt: true);
  static String? _$buildingName(AddressModel v) => v.buildingName;
  static const Field<AddressModel, String> _f$buildingName =
      Field('buildingName', _$buildingName, opt: true);
  static String? _$street(AddressModel v) => v.street;
  static const Field<AddressModel, String> _f$street =
      Field('street', _$street, opt: true);
  static String? _$boundaryType(AddressModel v) => v.boundaryType;
  static const Field<AddressModel, String> _f$boundaryType =
      Field('boundaryType', _$boundaryType, opt: true);
  static String? _$boundary(AddressModel v) => v.boundary;
  static const Field<AddressModel, String> _f$boundary =
      Field('boundary', _$boundary, opt: true);
  static bool? _$nonRecoverableError(AddressModel v) => v.nonRecoverableError;
  static const Field<AddressModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(AddressModel v) => v.tenantId;
  static const Field<AddressModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(AddressModel v) => v.rowVersion;
  static const Field<AddressModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressType? _$type(AddressModel v) => v.type;
  static const Field<AddressModel, AddressType> _f$type =
      Field('type', _$type, opt: true);
  static LocalityModel? _$locality(AddressModel v) => v.locality;
  static const Field<AddressModel, LocalityModel> _f$locality =
      Field('locality', _$locality, opt: true);

  @override
  final MappableFields<AddressModel> fields = const {
    #id: _f$id,
    #relatedClientReferenceId: _f$relatedClientReferenceId,
    #doorNo: _f$doorNo,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #locationAccuracy: _f$locationAccuracy,
    #addressLine1: _f$addressLine1,
    #addressLine2: _f$addressLine2,
    #landmark: _f$landmark,
    #city: _f$city,
    #pincode: _f$pincode,
    #buildingName: _f$buildingName,
    #street: _f$street,
    #boundaryType: _f$boundaryType,
    #boundary: _f$boundary,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #type: _f$type,
    #locality: _f$locality,
  };
  @override
  final bool ignoreNull = true;

  static AddressModel _instantiate(DecodingData data) {
    return AddressModel(
        id: data.dec(_f$id),
        relatedClientReferenceId: data.dec(_f$relatedClientReferenceId),
        doorNo: data.dec(_f$doorNo),
        latitude: data.dec(_f$latitude),
        longitude: data.dec(_f$longitude),
        locationAccuracy: data.dec(_f$locationAccuracy),
        addressLine1: data.dec(_f$addressLine1),
        addressLine2: data.dec(_f$addressLine2),
        landmark: data.dec(_f$landmark),
        city: data.dec(_f$city),
        pincode: data.dec(_f$pincode),
        buildingName: data.dec(_f$buildingName),
        street: data.dec(_f$street),
        boundaryType: data.dec(_f$boundaryType),
        boundary: data.dec(_f$boundary),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        type: data.dec(_f$type),
        locality: data.dec(_f$locality));
  }

  @override
  final Function instantiate = _instantiate;

  static AddressModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AddressModel>(map);
  }

  static AddressModel fromJson(String json) {
    return ensureInitialized().decodeJson<AddressModel>(json);
  }
}

mixin AddressModelMappable {
  String toJson() {
    return AddressModelMapper.ensureInitialized()
        .encodeJson<AddressModel>(this as AddressModel);
  }

  Map<String, dynamic> toMap() {
    return AddressModelMapper.ensureInitialized()
        .encodeMap<AddressModel>(this as AddressModel);
  }

  AddressModelCopyWith<AddressModel, AddressModel, AddressModel> get copyWith =>
      _AddressModelCopyWithImpl(this as AddressModel, $identity, $identity);
  @override
  String toString() {
    return AddressModelMapper.ensureInitialized()
        .stringifyValue(this as AddressModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            AddressModelMapper.ensureInitialized()
                .isValueEqual(this as AddressModel, other));
  }

  @override
  int get hashCode {
    return AddressModelMapper.ensureInitialized()
        .hashValue(this as AddressModel);
  }
}

extension AddressModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AddressModel, $Out> {
  AddressModelCopyWith<$R, AddressModel, $Out> get $asAddressModel =>
      $base.as((v, t, t2) => _AddressModelCopyWithImpl(v, t, t2));
}

abstract class AddressModelCopyWith<$R, $In extends AddressModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  LocalityModelCopyWith<$R, LocalityModel, LocalityModel>? get locality;
  $R call(
      {String? id,
      String? relatedClientReferenceId,
      String? doorNo,
      double? latitude,
      double? longitude,
      double? locationAccuracy,
      String? addressLine1,
      String? addressLine2,
      String? landmark,
      String? city,
      String? pincode,
      String? buildingName,
      String? street,
      String? boundaryType,
      String? boundary,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AddressType? type,
      LocalityModel? locality});
  AddressModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AddressModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AddressModel, $Out>
    implements AddressModelCopyWith<$R, AddressModel, $Out> {
  _AddressModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AddressModel> $mapper =
      AddressModelMapper.ensureInitialized();
  @override
  LocalityModelCopyWith<$R, LocalityModel, LocalityModel>? get locality =>
      $value.locality?.copyWith.$chain((v) => call(locality: v));
  @override
  $R call(
          {Object? id = $none,
          Object? relatedClientReferenceId = $none,
          Object? doorNo = $none,
          Object? latitude = $none,
          Object? longitude = $none,
          Object? locationAccuracy = $none,
          Object? addressLine1 = $none,
          Object? addressLine2 = $none,
          Object? landmark = $none,
          Object? city = $none,
          Object? pincode = $none,
          Object? buildingName = $none,
          Object? street = $none,
          Object? boundaryType = $none,
          Object? boundary = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? type = $none,
          Object? locality = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (relatedClientReferenceId != $none)
          #relatedClientReferenceId: relatedClientReferenceId,
        if (doorNo != $none) #doorNo: doorNo,
        if (latitude != $none) #latitude: latitude,
        if (longitude != $none) #longitude: longitude,
        if (locationAccuracy != $none) #locationAccuracy: locationAccuracy,
        if (addressLine1 != $none) #addressLine1: addressLine1,
        if (addressLine2 != $none) #addressLine2: addressLine2,
        if (landmark != $none) #landmark: landmark,
        if (city != $none) #city: city,
        if (pincode != $none) #pincode: pincode,
        if (buildingName != $none) #buildingName: buildingName,
        if (street != $none) #street: street,
        if (boundaryType != $none) #boundaryType: boundaryType,
        if (boundary != $none) #boundary: boundary,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (type != $none) #type: type,
        if (locality != $none) #locality: locality
      }));
  @override
  AddressModel $make(CopyWithData data) => AddressModel(
      id: data.get(#id, or: $value.id),
      relatedClientReferenceId: data.get(#relatedClientReferenceId,
          or: $value.relatedClientReferenceId),
      doorNo: data.get(#doorNo, or: $value.doorNo),
      latitude: data.get(#latitude, or: $value.latitude),
      longitude: data.get(#longitude, or: $value.longitude),
      locationAccuracy:
          data.get(#locationAccuracy, or: $value.locationAccuracy),
      addressLine1: data.get(#addressLine1, or: $value.addressLine1),
      addressLine2: data.get(#addressLine2, or: $value.addressLine2),
      landmark: data.get(#landmark, or: $value.landmark),
      city: data.get(#city, or: $value.city),
      pincode: data.get(#pincode, or: $value.pincode),
      buildingName: data.get(#buildingName, or: $value.buildingName),
      street: data.get(#street, or: $value.street),
      boundaryType: data.get(#boundaryType, or: $value.boundaryType),
      boundary: data.get(#boundary, or: $value.boundary),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      type: data.get(#type, or: $value.type),
      locality: data.get(#locality, or: $value.locality));

  @override
  AddressModelCopyWith<$R2, AddressModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AddressModelCopyWithImpl($value, $cast, t);
}
