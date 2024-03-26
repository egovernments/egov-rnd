// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'locality.dart';

class LocalitySearchModelMapper extends ClassMapperBase<LocalitySearchModel> {
  LocalitySearchModelMapper._();

  static LocalitySearchModelMapper? _instance;
  static LocalitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalitySearchModel';

  static String? _$code(LocalitySearchModel v) => v.code;
  static const Field<LocalitySearchModel, String> _f$code =
      Field('code', _$code, opt: true);
  static String? _$name(LocalitySearchModel v) => v.name;
  static const Field<LocalitySearchModel, String> _f$name =
      Field('name', _$name, opt: true);
  static String? _$tenantId(LocalitySearchModel v) => v.tenantId;
  static const Field<LocalitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<LocalitySearchModel> fields = const {
    #code: _f$code,
    #name: _f$name,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static LocalitySearchModel _instantiate(DecodingData data) {
    return LocalitySearchModel.ignoreDeleted(
        code: data.dec(_f$code),
        name: data.dec(_f$name),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalitySearchModel>(map);
  }

  static LocalitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<LocalitySearchModel>(json);
  }
}

mixin LocalitySearchModelMappable {
  String toJson() {
    return LocalitySearchModelMapper.ensureInitialized()
        .encodeJson<LocalitySearchModel>(this as LocalitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return LocalitySearchModelMapper.ensureInitialized()
        .encodeMap<LocalitySearchModel>(this as LocalitySearchModel);
  }

  LocalitySearchModelCopyWith<LocalitySearchModel, LocalitySearchModel,
          LocalitySearchModel>
      get copyWith => _LocalitySearchModelCopyWithImpl(
          this as LocalitySearchModel, $identity, $identity);
  @override
  String toString() {
    return LocalitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as LocalitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as LocalitySearchModel, other));
  }

  @override
  int get hashCode {
    return LocalitySearchModelMapper.ensureInitialized()
        .hashValue(this as LocalitySearchModel);
  }
}

extension LocalitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalitySearchModel, $Out> {
  LocalitySearchModelCopyWith<$R, LocalitySearchModel, $Out>
      get $asLocalitySearchModel =>
          $base.as((v, t, t2) => _LocalitySearchModelCopyWithImpl(v, t, t2));
}

abstract class LocalitySearchModelCopyWith<$R, $In extends LocalitySearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? code, String? name, String? tenantId});
  LocalitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalitySearchModel, $Out>
    implements LocalitySearchModelCopyWith<$R, LocalitySearchModel, $Out> {
  _LocalitySearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalitySearchModel> $mapper =
      LocalitySearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? code = $none,
          Object? name = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (code != $none) #code: code,
        if (name != $none) #name: name,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  LocalitySearchModel $make(CopyWithData data) =>
      LocalitySearchModel.ignoreDeleted(
          code: data.get(#code, or: $value.code),
          name: data.get(#name, or: $value.name),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  LocalitySearchModelCopyWith<$R2, LocalitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocalitySearchModelCopyWithImpl($value, $cast, t);
}

class LocalityModelMapper extends ClassMapperBase<LocalityModel> {
  LocalityModelMapper._();

  static LocalityModelMapper? _instance;
  static LocalityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalityModel';

  static String _$code(LocalityModel v) => v.code;
  static const Field<LocalityModel, String> _f$code = Field('code', _$code);
  static String? _$name(LocalityModel v) => v.name;
  static const Field<LocalityModel, String> _f$name =
      Field('name', _$name, opt: true);
  static bool? _$nonRecoverableError(LocalityModel v) => v.nonRecoverableError;
  static const Field<LocalityModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(LocalityModel v) => v.tenantId;
  static const Field<LocalityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(LocalityModel v) => v.rowVersion;
  static const Field<LocalityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<LocalityModel> fields = const {
    #code: _f$code,
    #name: _f$name,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static LocalityModel _instantiate(DecodingData data) {
    return LocalityModel(
        code: data.dec(_f$code),
        name: data.dec(_f$name),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalityModel>(map);
  }

  static LocalityModel fromJson(String json) {
    return ensureInitialized().decodeJson<LocalityModel>(json);
  }
}

mixin LocalityModelMappable {
  String toJson() {
    return LocalityModelMapper.ensureInitialized()
        .encodeJson<LocalityModel>(this as LocalityModel);
  }

  Map<String, dynamic> toMap() {
    return LocalityModelMapper.ensureInitialized()
        .encodeMap<LocalityModel>(this as LocalityModel);
  }

  LocalityModelCopyWith<LocalityModel, LocalityModel, LocalityModel>
      get copyWith => _LocalityModelCopyWithImpl(
          this as LocalityModel, $identity, $identity);
  @override
  String toString() {
    return LocalityModelMapper.ensureInitialized()
        .stringifyValue(this as LocalityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            LocalityModelMapper.ensureInitialized()
                .isValueEqual(this as LocalityModel, other));
  }

  @override
  int get hashCode {
    return LocalityModelMapper.ensureInitialized()
        .hashValue(this as LocalityModel);
  }
}

extension LocalityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalityModel, $Out> {
  LocalityModelCopyWith<$R, LocalityModel, $Out> get $asLocalityModel =>
      $base.as((v, t, t2) => _LocalityModelCopyWithImpl(v, t, t2));
}

abstract class LocalityModelCopyWith<$R, $In extends LocalityModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? code,
      String? name,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion});
  LocalityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocalityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalityModel, $Out>
    implements LocalityModelCopyWith<$R, LocalityModel, $Out> {
  _LocalityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalityModel> $mapper =
      LocalityModelMapper.ensureInitialized();
  @override
  $R call(
          {String? code,
          Object? name = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (code != null) #code: code,
        if (name != $none) #name: name,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  LocalityModel $make(CopyWithData data) => LocalityModel(
      code: data.get(#code, or: $value.code),
      name: data.get(#name, or: $value.name),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  LocalityModelCopyWith<$R2, LocalityModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalityModelCopyWithImpl($value, $cast, t);
}
