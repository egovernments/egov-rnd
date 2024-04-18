// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dataModel.dart';

class ApiOperationMapper extends EnumMapper<ApiOperation> {
  ApiOperationMapper._();

  static ApiOperationMapper? _instance;
  static ApiOperationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApiOperationMapper._());
    }
    return _instance!;
  }

  static ApiOperation fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ApiOperation decode(dynamic value) {
    switch (value) {
      case 'login':
        return ApiOperation.login;
      case 'create':
        return ApiOperation.create;
      case 'search':
        return ApiOperation.search;
      case 'update':
        return ApiOperation.update;
      case 'delete':
        return ApiOperation.delete;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ApiOperation self) {
    switch (self) {
      case ApiOperation.login:
        return 'login';
      case ApiOperation.create:
        return 'create';
      case ApiOperation.search:
        return 'search';
      case ApiOperation.update:
        return 'update';
      case ApiOperation.delete:
        return 'delete';
    }
  }
}

extension ApiOperationMapperExtension on ApiOperation {
  String toValue() {
    ApiOperationMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ApiOperation>(this) as String;
  }
}

class DataModelTypeMapper extends EnumMapper<DataModelType> {
  DataModelTypeMapper._();

  static DataModelTypeMapper? _instance;
  static DataModelTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DataModelTypeMapper._());
    }
    return _instance!;
  }

  static DataModelType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  DataModelType decode(dynamic value) {
    switch (value) {
      case 'user':
        return DataModelType.user;
      case 'address':
        return DataModelType.address;
      case 'individual':
        return DataModelType.individual;
      case 'attendanceRegister':
        return DataModelType.attendanceRegister;
      case 'attendance':
        return DataModelType.attendance;
      case 'project':
        return DataModelType.project;
      case 'projectFacility':
        return DataModelType.projectFacility;
      case 'projectProductVariant':
        return DataModelType.projectProductVariant;
      case 'projectStaff':
        return DataModelType.projectStaff;
      case 'projectResource':
        return DataModelType.projectResource;
      case 'projectType':
        return DataModelType.projectType;
      case 'facility':
        return DataModelType.facility;
      case 'product':
        return DataModelType.product;
      case 'productVariant':
        return DataModelType.productVariant;
      case 'stock':
        return DataModelType.stock;
      case 'stockReconciliation':
        return DataModelType.stockReconciliation;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(DataModelType self) {
    switch (self) {
      case DataModelType.user:
        return 'user';
      case DataModelType.address:
        return 'address';
      case DataModelType.individual:
        return 'individual';
      case DataModelType.attendanceRegister:
        return 'attendanceRegister';
      case DataModelType.attendance:
        return 'attendance';
      case DataModelType.project:
        return 'project';
      case DataModelType.projectFacility:
        return 'projectFacility';
      case DataModelType.projectProductVariant:
        return 'projectProductVariant';
      case DataModelType.projectStaff:
        return 'projectStaff';
      case DataModelType.projectResource:
        return 'projectResource';
      case DataModelType.projectType:
        return 'projectType';
      case DataModelType.facility:
        return 'facility';
      case DataModelType.product:
        return 'product';
      case DataModelType.productVariant:
        return 'productVariant';
      case DataModelType.stock:
        return 'stock';
      case DataModelType.stockReconciliation:
        return 'stockReconciliation';
    }
  }
}

extension DataModelTypeMapperExtension on DataModelType {
  String toValue() {
    DataModelTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<DataModelType>(this) as String;
  }
}

class AuditDetailsMapper extends ClassMapperBase<AuditDetails> {
  AuditDetailsMapper._();

  static AuditDetailsMapper? _instance;
  static AuditDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuditDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuditDetails';

  static String? _$createdBy(AuditDetails v) => v.createdBy;
  static const Field<AuditDetails, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static int? _$createdTime(AuditDetails v) => v.createdTime;
  static const Field<AuditDetails, int> _f$createdTime =
      Field('createdTime', _$createdTime);
  static String? _$lastModifiedBy(AuditDetails v) => v.lastModifiedBy;
  static const Field<AuditDetails, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static int? _$lastModifiedTime(AuditDetails v) => v.lastModifiedTime;
  static const Field<AuditDetails, int> _f$lastModifiedTime =
      Field('lastModifiedTime', _$lastModifiedTime, opt: true);

  @override
  final MappableFields<AuditDetails> fields = const {
    #createdBy: _f$createdBy,
    #createdTime: _f$createdTime,
    #lastModifiedBy: _f$lastModifiedBy,
    #lastModifiedTime: _f$lastModifiedTime,
  };

  static AuditDetails _instantiate(DecodingData data) {
    return AuditDetails(
        createdBy: data.dec(_f$createdBy),
        createdTime: data.dec(_f$createdTime),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        lastModifiedTime: data.dec(_f$lastModifiedTime));
  }

  @override
  final Function instantiate = _instantiate;

  static AuditDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuditDetails>(map);
  }

  static AuditDetails fromJson(String json) {
    return ensureInitialized().decodeJson<AuditDetails>(json);
  }
}

mixin AuditDetailsMappable {
  String toJson() {
    return AuditDetailsMapper.ensureInitialized()
        .encodeJson<AuditDetails>(this as AuditDetails);
  }

  Map<String, dynamic> toMap() {
    return AuditDetailsMapper.ensureInitialized()
        .encodeMap<AuditDetails>(this as AuditDetails);
  }

  AuditDetailsCopyWith<AuditDetails, AuditDetails, AuditDetails> get copyWith =>
      _AuditDetailsCopyWithImpl(this as AuditDetails, $identity, $identity);
  @override
  String toString() {
    return AuditDetailsMapper.ensureInitialized()
        .stringifyValue(this as AuditDetails);
  }

  @override
  bool operator ==(Object other) {
    return AuditDetailsMapper.ensureInitialized()
        .equalsValue(this as AuditDetails, other);
  }

  @override
  int get hashCode {
    return AuditDetailsMapper.ensureInitialized()
        .hashValue(this as AuditDetails);
  }
}

extension AuditDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuditDetails, $Out> {
  AuditDetailsCopyWith<$R, AuditDetails, $Out> get $asAuditDetails =>
      $base.as((v, t, t2) => _AuditDetailsCopyWithImpl(v, t, t2));
}

abstract class AuditDetailsCopyWith<$R, $In extends AuditDetails, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? createdBy,
      int? createdTime,
      String? lastModifiedBy,
      int? lastModifiedTime});
  AuditDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuditDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuditDetails, $Out>
    implements AuditDetailsCopyWith<$R, AuditDetails, $Out> {
  _AuditDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuditDetails> $mapper =
      AuditDetailsMapper.ensureInitialized();
  @override
  $R call(
          {Object? createdBy = $none,
          Object? createdTime = $none,
          Object? lastModifiedBy = $none,
          Object? lastModifiedTime = $none}) =>
      $apply(FieldCopyWithData({
        if (createdBy != $none) #createdBy: createdBy,
        if (createdTime != $none) #createdTime: createdTime,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (lastModifiedTime != $none) #lastModifiedTime: lastModifiedTime
      }));
  @override
  AuditDetails $make(CopyWithData data) => AuditDetails(
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdTime: data.get(#createdTime, or: $value.createdTime),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      lastModifiedTime:
          data.get(#lastModifiedTime, or: $value.lastModifiedTime));

  @override
  AuditDetailsCopyWith<$R2, AuditDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuditDetailsCopyWithImpl($value, $cast, t);
}

class ClientAuditDetailsMapper extends ClassMapperBase<ClientAuditDetails> {
  ClientAuditDetailsMapper._();

  static ClientAuditDetailsMapper? _instance;
  static ClientAuditDetailsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClientAuditDetailsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClientAuditDetails';

  static String? _$createdBy(ClientAuditDetails v) => v.createdBy;
  static const Field<ClientAuditDetails, String> _f$createdBy =
      Field('createdBy', _$createdBy);
  static int? _$createdTime(ClientAuditDetails v) => v.createdTime;
  static const Field<ClientAuditDetails, int> _f$createdTime =
      Field('createdTime', _$createdTime);
  static String? _$lastModifiedBy(ClientAuditDetails v) => v.lastModifiedBy;
  static const Field<ClientAuditDetails, String> _f$lastModifiedBy =
      Field('lastModifiedBy', _$lastModifiedBy, opt: true);
  static int? _$lastModifiedTime(ClientAuditDetails v) => v.lastModifiedTime;
  static const Field<ClientAuditDetails, int> _f$lastModifiedTime =
      Field('lastModifiedTime', _$lastModifiedTime, opt: true);

  @override
  final MappableFields<ClientAuditDetails> fields = const {
    #createdBy: _f$createdBy,
    #createdTime: _f$createdTime,
    #lastModifiedBy: _f$lastModifiedBy,
    #lastModifiedTime: _f$lastModifiedTime,
  };

  static ClientAuditDetails _instantiate(DecodingData data) {
    return ClientAuditDetails(
        createdBy: data.dec(_f$createdBy),
        createdTime: data.dec(_f$createdTime),
        lastModifiedBy: data.dec(_f$lastModifiedBy),
        lastModifiedTime: data.dec(_f$lastModifiedTime));
  }

  @override
  final Function instantiate = _instantiate;

  static ClientAuditDetails fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClientAuditDetails>(map);
  }

  static ClientAuditDetails fromJson(String json) {
    return ensureInitialized().decodeJson<ClientAuditDetails>(json);
  }
}

mixin ClientAuditDetailsMappable {
  String toJson() {
    return ClientAuditDetailsMapper.ensureInitialized()
        .encodeJson<ClientAuditDetails>(this as ClientAuditDetails);
  }

  Map<String, dynamic> toMap() {
    return ClientAuditDetailsMapper.ensureInitialized()
        .encodeMap<ClientAuditDetails>(this as ClientAuditDetails);
  }

  ClientAuditDetailsCopyWith<ClientAuditDetails, ClientAuditDetails,
          ClientAuditDetails>
      get copyWith => _ClientAuditDetailsCopyWithImpl(
          this as ClientAuditDetails, $identity, $identity);
  @override
  String toString() {
    return ClientAuditDetailsMapper.ensureInitialized()
        .stringifyValue(this as ClientAuditDetails);
  }

  @override
  bool operator ==(Object other) {
    return ClientAuditDetailsMapper.ensureInitialized()
        .equalsValue(this as ClientAuditDetails, other);
  }

  @override
  int get hashCode {
    return ClientAuditDetailsMapper.ensureInitialized()
        .hashValue(this as ClientAuditDetails);
  }
}

extension ClientAuditDetailsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClientAuditDetails, $Out> {
  ClientAuditDetailsCopyWith<$R, ClientAuditDetails, $Out>
      get $asClientAuditDetails =>
          $base.as((v, t, t2) => _ClientAuditDetailsCopyWithImpl(v, t, t2));
}

abstract class ClientAuditDetailsCopyWith<$R, $In extends ClientAuditDetails,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? createdBy,
      int? createdTime,
      String? lastModifiedBy,
      int? lastModifiedTime});
  ClientAuditDetailsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ClientAuditDetailsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClientAuditDetails, $Out>
    implements ClientAuditDetailsCopyWith<$R, ClientAuditDetails, $Out> {
  _ClientAuditDetailsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClientAuditDetails> $mapper =
      ClientAuditDetailsMapper.ensureInitialized();
  @override
  $R call(
          {Object? createdBy = $none,
          Object? createdTime = $none,
          Object? lastModifiedBy = $none,
          Object? lastModifiedTime = $none}) =>
      $apply(FieldCopyWithData({
        if (createdBy != $none) #createdBy: createdBy,
        if (createdTime != $none) #createdTime: createdTime,
        if (lastModifiedBy != $none) #lastModifiedBy: lastModifiedBy,
        if (lastModifiedTime != $none) #lastModifiedTime: lastModifiedTime
      }));
  @override
  ClientAuditDetails $make(CopyWithData data) => ClientAuditDetails(
      createdBy: data.get(#createdBy, or: $value.createdBy),
      createdTime: data.get(#createdTime, or: $value.createdTime),
      lastModifiedBy: data.get(#lastModifiedBy, or: $value.lastModifiedBy),
      lastModifiedTime:
          data.get(#lastModifiedTime, or: $value.lastModifiedTime));

  @override
  ClientAuditDetailsCopyWith<$R2, ClientAuditDetails, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ClientAuditDetailsCopyWithImpl($value, $cast, t);
}

class AdditionalFieldsMapper extends ClassMapperBase<AdditionalFields> {
  AdditionalFieldsMapper._();

  static AdditionalFieldsMapper? _instance;
  static AdditionalFieldsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalFieldsMapper._());
      AdditionalFieldMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AdditionalFields';

  static String _$schema(AdditionalFields v) => v.schema;
  static const Field<AdditionalFields, String> _f$schema =
      Field('schema', _$schema);
  static int _$version(AdditionalFields v) => v.version;
  static const Field<AdditionalFields, int> _f$version =
      Field('version', _$version);
  static List<AdditionalField> _$fields(AdditionalFields v) => v.fields;
  static const Field<AdditionalFields, List<AdditionalField>> _f$fields =
      Field('fields', _$fields, opt: true, def: const []);

  @override
  final MappableFields<AdditionalFields> fields = const {
    #schema: _f$schema,
    #version: _f$version,
    #fields: _f$fields,
  };

  static AdditionalFields _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('AdditionalFields');
  }

  @override
  final Function instantiate = _instantiate;

  static AdditionalFields fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdditionalFields>(map);
  }

  static AdditionalFields fromJson(String json) {
    return ensureInitialized().decodeJson<AdditionalFields>(json);
  }
}

mixin AdditionalFieldsMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AdditionalFieldsCopyWith<AdditionalFields, AdditionalFields, AdditionalFields>
      get copyWith;
}

abstract class AdditionalFieldsCopyWith<$R, $In extends AdditionalFields, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, AdditionalField,
      AdditionalFieldCopyWith<$R, AdditionalField, AdditionalField>> get fields;
  $R call({String? schema, int? version, List<AdditionalField>? fields});
  AdditionalFieldsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class AdditionalFieldMapper extends ClassMapperBase<AdditionalField> {
  AdditionalFieldMapper._();

  static AdditionalFieldMapper? _instance;
  static AdditionalFieldMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AdditionalFieldMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AdditionalField';

  static String _$key(AdditionalField v) => v.key;
  static const Field<AdditionalField, String> _f$key = Field('key', _$key);
  static dynamic _$value(AdditionalField v) => v.value;
  static const Field<AdditionalField, dynamic> _f$value =
      Field('value', _$value);

  @override
  final MappableFields<AdditionalField> fields = const {
    #key: _f$key,
    #value: _f$value,
  };

  static AdditionalField _instantiate(DecodingData data) {
    return AdditionalField(data.dec(_f$key), data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static AdditionalField fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AdditionalField>(map);
  }

  static AdditionalField fromJson(String json) {
    return ensureInitialized().decodeJson<AdditionalField>(json);
  }
}

mixin AdditionalFieldMappable {
  String toJson() {
    return AdditionalFieldMapper.ensureInitialized()
        .encodeJson<AdditionalField>(this as AdditionalField);
  }

  Map<String, dynamic> toMap() {
    return AdditionalFieldMapper.ensureInitialized()
        .encodeMap<AdditionalField>(this as AdditionalField);
  }

  AdditionalFieldCopyWith<AdditionalField, AdditionalField, AdditionalField>
      get copyWith => _AdditionalFieldCopyWithImpl(
          this as AdditionalField, $identity, $identity);
  @override
  String toString() {
    return AdditionalFieldMapper.ensureInitialized()
        .stringifyValue(this as AdditionalField);
  }

  @override
  bool operator ==(Object other) {
    return AdditionalFieldMapper.ensureInitialized()
        .equalsValue(this as AdditionalField, other);
  }

  @override
  int get hashCode {
    return AdditionalFieldMapper.ensureInitialized()
        .hashValue(this as AdditionalField);
  }
}

extension AdditionalFieldValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AdditionalField, $Out> {
  AdditionalFieldCopyWith<$R, AdditionalField, $Out> get $asAdditionalField =>
      $base.as((v, t, t2) => _AdditionalFieldCopyWithImpl(v, t, t2));
}

abstract class AdditionalFieldCopyWith<$R, $In extends AdditionalField, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? key, dynamic value});
  AdditionalFieldCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AdditionalFieldCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AdditionalField, $Out>
    implements AdditionalFieldCopyWith<$R, AdditionalField, $Out> {
  _AdditionalFieldCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AdditionalField> $mapper =
      AdditionalFieldMapper.ensureInitialized();
  @override
  $R call({String? key, Object? value = $none}) => $apply(FieldCopyWithData(
      {if (key != null) #key: key, if (value != $none) #value: value}));
  @override
  AdditionalField $make(CopyWithData data) => AdditionalField(
      data.get(#key, or: $value.key), data.get(#value, or: $value.value));

  @override
  AdditionalFieldCopyWith<$R2, AdditionalField, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AdditionalFieldCopyWithImpl($value, $cast, t);
}
