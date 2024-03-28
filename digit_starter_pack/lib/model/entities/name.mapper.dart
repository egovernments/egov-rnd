// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'name.dart';

class NameSearchModelMapper extends ClassMapperBase<NameSearchModel> {
  NameSearchModelMapper._();

  static NameSearchModelMapper? _instance;
  static NameSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NameSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NameSearchModel';

  static String? _$id(NameSearchModel v) => v.id;
  static const Field<NameSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$givenName(NameSearchModel v) => v.givenName;
  static const Field<NameSearchModel, String> _f$givenName =
      Field('givenName', _$givenName, opt: true);
  static String? _$familyName(NameSearchModel v) => v.familyName;
  static const Field<NameSearchModel, String> _f$familyName =
      Field('familyName', _$familyName, opt: true);
  static String? _$otherNames(NameSearchModel v) => v.otherNames;
  static const Field<NameSearchModel, String> _f$otherNames =
      Field('otherNames', _$otherNames, opt: true);
  static String? _$tenantId(NameSearchModel v) => v.tenantId;
  static const Field<NameSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<NameSearchModel> fields = const {
    #id: _f$id,
    #givenName: _f$givenName,
    #familyName: _f$familyName,
    #otherNames: _f$otherNames,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static NameSearchModel _instantiate(DecodingData data) {
    return NameSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        givenName: data.dec(_f$givenName),
        familyName: data.dec(_f$familyName),
        otherNames: data.dec(_f$otherNames),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static NameSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NameSearchModel>(map);
  }

  static NameSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<NameSearchModel>(json);
  }
}

mixin NameSearchModelMappable {
  String toJson() {
    return NameSearchModelMapper.ensureInitialized()
        .encodeJson<NameSearchModel>(this as NameSearchModel);
  }

  Map<String, dynamic> toMap() {
    return NameSearchModelMapper.ensureInitialized()
        .encodeMap<NameSearchModel>(this as NameSearchModel);
  }

  NameSearchModelCopyWith<NameSearchModel, NameSearchModel, NameSearchModel>
      get copyWith => _NameSearchModelCopyWithImpl(
          this as NameSearchModel, $identity, $identity);
  @override
  String toString() {
    return NameSearchModelMapper.ensureInitialized()
        .stringifyValue(this as NameSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NameSearchModelMapper.ensureInitialized()
                .isValueEqual(this as NameSearchModel, other));
  }

  @override
  int get hashCode {
    return NameSearchModelMapper.ensureInitialized()
        .hashValue(this as NameSearchModel);
  }
}

extension NameSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NameSearchModel, $Out> {
  NameSearchModelCopyWith<$R, NameSearchModel, $Out> get $asNameSearchModel =>
      $base.as((v, t, t2) => _NameSearchModelCopyWithImpl(v, t, t2));
}

abstract class NameSearchModelCopyWith<$R, $In extends NameSearchModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? givenName,
      String? familyName,
      String? otherNames,
      String? tenantId});
  NameSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NameSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NameSearchModel, $Out>
    implements NameSearchModelCopyWith<$R, NameSearchModel, $Out> {
  _NameSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NameSearchModel> $mapper =
      NameSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? givenName = $none,
          Object? familyName = $none,
          Object? otherNames = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (givenName != $none) #givenName: givenName,
        if (familyName != $none) #familyName: familyName,
        if (otherNames != $none) #otherNames: otherNames,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  NameSearchModel $make(CopyWithData data) => NameSearchModel.ignoreDeleted(
      id: data.get(#id, or: $value.id),
      givenName: data.get(#givenName, or: $value.givenName),
      familyName: data.get(#familyName, or: $value.familyName),
      otherNames: data.get(#otherNames, or: $value.otherNames),
      tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  NameSearchModelCopyWith<$R2, NameSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NameSearchModelCopyWithImpl($value, $cast, t);
}

class NameModelMapper extends ClassMapperBase<NameModel> {
  NameModelMapper._();

  static NameModelMapper? _instance;
  static NameModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NameModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NameModel';

  static String? _$id(NameModel v) => v.id;
  static const Field<NameModel, String> _f$id = Field('id', _$id, opt: true);
  static String? _$individualClientReferenceId(NameModel v) =>
      v.individualClientReferenceId;
  static const Field<NameModel, String> _f$individualClientReferenceId = Field(
      'individualClientReferenceId', _$individualClientReferenceId,
      opt: true);
  static String? _$givenName(NameModel v) => v.givenName;
  static const Field<NameModel, String> _f$givenName =
      Field('givenName', _$givenName, opt: true);
  static String? _$familyName(NameModel v) => v.familyName;
  static const Field<NameModel, String> _f$familyName =
      Field('familyName', _$familyName, opt: true);
  static String? _$otherNames(NameModel v) => v.otherNames;
  static const Field<NameModel, String> _f$otherNames =
      Field('otherNames', _$otherNames, opt: true);
  static bool? _$nonRecoverableError(NameModel v) => v.nonRecoverableError;
  static const Field<NameModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(NameModel v) => v.tenantId;
  static const Field<NameModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(NameModel v) => v.rowVersion;
  static const Field<NameModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<NameModel> fields = const {
    #id: _f$id,
    #individualClientReferenceId: _f$individualClientReferenceId,
    #givenName: _f$givenName,
    #familyName: _f$familyName,
    #otherNames: _f$otherNames,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static NameModel _instantiate(DecodingData data) {
    return NameModel(
        id: data.dec(_f$id),
        individualClientReferenceId: data.dec(_f$individualClientReferenceId),
        givenName: data.dec(_f$givenName),
        familyName: data.dec(_f$familyName),
        otherNames: data.dec(_f$otherNames),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static NameModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NameModel>(map);
  }

  static NameModel fromJson(String json) {
    return ensureInitialized().decodeJson<NameModel>(json);
  }
}

mixin NameModelMappable {
  String toJson() {
    return NameModelMapper.ensureInitialized()
        .encodeJson<NameModel>(this as NameModel);
  }

  Map<String, dynamic> toMap() {
    return NameModelMapper.ensureInitialized()
        .encodeMap<NameModel>(this as NameModel);
  }

  NameModelCopyWith<NameModel, NameModel, NameModel> get copyWith =>
      _NameModelCopyWithImpl(this as NameModel, $identity, $identity);
  @override
  String toString() {
    return NameModelMapper.ensureInitialized()
        .stringifyValue(this as NameModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            NameModelMapper.ensureInitialized()
                .isValueEqual(this as NameModel, other));
  }

  @override
  int get hashCode {
    return NameModelMapper.ensureInitialized().hashValue(this as NameModel);
  }
}

extension NameModelValueCopy<$R, $Out> on ObjectCopyWith<$R, NameModel, $Out> {
  NameModelCopyWith<$R, NameModel, $Out> get $asNameModel =>
      $base.as((v, t, t2) => _NameModelCopyWithImpl(v, t, t2));
}

abstract class NameModelCopyWith<$R, $In extends NameModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? individualClientReferenceId,
      String? givenName,
      String? familyName,
      String? otherNames,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion});
  NameModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NameModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NameModel, $Out>
    implements NameModelCopyWith<$R, NameModel, $Out> {
  _NameModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NameModel> $mapper =
      NameModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? individualClientReferenceId = $none,
          Object? givenName = $none,
          Object? familyName = $none,
          Object? otherNames = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (individualClientReferenceId != $none)
          #individualClientReferenceId: individualClientReferenceId,
        if (givenName != $none) #givenName: givenName,
        if (familyName != $none) #familyName: familyName,
        if (otherNames != $none) #otherNames: otherNames,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  NameModel $make(CopyWithData data) => NameModel(
      id: data.get(#id, or: $value.id),
      individualClientReferenceId: data.get(#individualClientReferenceId,
          or: $value.individualClientReferenceId),
      givenName: data.get(#givenName, or: $value.givenName),
      familyName: data.get(#familyName, or: $value.familyName),
      otherNames: data.get(#otherNames, or: $value.otherNames),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  NameModelCopyWith<$R2, NameModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NameModelCopyWithImpl($value, $cast, t);
}
