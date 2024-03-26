// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'identifier.dart';

class IdentifierSearchModelMapper
    extends ClassMapperBase<IdentifierSearchModel> {
  IdentifierSearchModelMapper._();

  static IdentifierSearchModelMapper? _instance;
  static IdentifierSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdentifierSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IdentifierSearchModel';

  static String? _$id(IdentifierSearchModel v) => v.id;
  static const Field<IdentifierSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$identifierType(IdentifierSearchModel v) => v.identifierType;
  static const Field<IdentifierSearchModel, String> _f$identifierType =
      Field('identifierType', _$identifierType, opt: true);
  static String? _$identifierId(IdentifierSearchModel v) => v.identifierId;
  static const Field<IdentifierSearchModel, String> _f$identifierId =
      Field('identifierId', _$identifierId, opt: true);
  static List<String>? _$clientReferenceId(IdentifierSearchModel v) =>
      v.clientReferenceId;
  static const Field<IdentifierSearchModel, List<String>> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId, opt: true);
  static String? _$tenantId(IdentifierSearchModel v) => v.tenantId;
  static const Field<IdentifierSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<IdentifierSearchModel> fields = const {
    #id: _f$id,
    #identifierType: _f$identifierType,
    #identifierId: _f$identifierId,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static IdentifierSearchModel _instantiate(DecodingData data) {
    return IdentifierSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        identifierType: data.dec(_f$identifierType),
        identifierId: data.dec(_f$identifierId),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static IdentifierSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IdentifierSearchModel>(map);
  }

  static IdentifierSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<IdentifierSearchModel>(json);
  }
}

mixin IdentifierSearchModelMappable {
  String toJson() {
    return IdentifierSearchModelMapper.ensureInitialized()
        .encodeJson<IdentifierSearchModel>(this as IdentifierSearchModel);
  }

  Map<String, dynamic> toMap() {
    return IdentifierSearchModelMapper.ensureInitialized()
        .encodeMap<IdentifierSearchModel>(this as IdentifierSearchModel);
  }

  IdentifierSearchModelCopyWith<IdentifierSearchModel, IdentifierSearchModel,
          IdentifierSearchModel>
      get copyWith => _IdentifierSearchModelCopyWithImpl(
          this as IdentifierSearchModel, $identity, $identity);
  @override
  String toString() {
    return IdentifierSearchModelMapper.ensureInitialized()
        .stringifyValue(this as IdentifierSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IdentifierSearchModelMapper.ensureInitialized()
                .isValueEqual(this as IdentifierSearchModel, other));
  }

  @override
  int get hashCode {
    return IdentifierSearchModelMapper.ensureInitialized()
        .hashValue(this as IdentifierSearchModel);
  }
}

extension IdentifierSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IdentifierSearchModel, $Out> {
  IdentifierSearchModelCopyWith<$R, IdentifierSearchModel, $Out>
      get $asIdentifierSearchModel =>
          $base.as((v, t, t2) => _IdentifierSearchModelCopyWithImpl(v, t, t2));
}

abstract class IdentifierSearchModelCopyWith<
    $R,
    $In extends IdentifierSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId;
  $R call(
      {String? id,
      String? identifierType,
      String? identifierId,
      List<String>? clientReferenceId,
      String? tenantId});
  IdentifierSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IdentifierSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IdentifierSearchModel, $Out>
    implements IdentifierSearchModelCopyWith<$R, IdentifierSearchModel, $Out> {
  _IdentifierSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IdentifierSearchModel> $mapper =
      IdentifierSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get clientReferenceId => $value.clientReferenceId != null
          ? ListCopyWith(
              $value.clientReferenceId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(clientReferenceId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? identifierType = $none,
          Object? identifierId = $none,
          Object? clientReferenceId = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (identifierType != $none) #identifierType: identifierType,
        if (identifierId != $none) #identifierId: identifierId,
        if (clientReferenceId != $none) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  IdentifierSearchModel $make(CopyWithData data) =>
      IdentifierSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          identifierType: data.get(#identifierType, or: $value.identifierType),
          identifierId: data.get(#identifierId, or: $value.identifierId),
          clientReferenceId:
              data.get(#clientReferenceId, or: $value.clientReferenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  IdentifierSearchModelCopyWith<$R2, IdentifierSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _IdentifierSearchModelCopyWithImpl($value, $cast, t);
}

class IdentifierModelMapper extends ClassMapperBase<IdentifierModel> {
  IdentifierModelMapper._();

  static IdentifierModelMapper? _instance;
  static IdentifierModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = IdentifierModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'IdentifierModel';

  static String? _$id(IdentifierModel v) => v.id;
  static const Field<IdentifierModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$identifierType(IdentifierModel v) => v.identifierType;
  static const Field<IdentifierModel, String> _f$identifierType =
      Field('identifierType', _$identifierType, opt: true);
  static String? _$identifierId(IdentifierModel v) => v.identifierId;
  static const Field<IdentifierModel, String> _f$identifierId =
      Field('identifierId', _$identifierId, opt: true);
  static bool? _$nonRecoverableError(IdentifierModel v) =>
      v.nonRecoverableError;
  static const Field<IdentifierModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String _$clientReferenceId(IdentifierModel v) => v.clientReferenceId;
  static const Field<IdentifierModel, String> _f$clientReferenceId =
      Field('clientReferenceId', _$clientReferenceId);
  static String? _$tenantId(IdentifierModel v) => v.tenantId;
  static const Field<IdentifierModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(IdentifierModel v) => v.rowVersion;
  static const Field<IdentifierModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<IdentifierModel> fields = const {
    #id: _f$id,
    #identifierType: _f$identifierType,
    #identifierId: _f$identifierId,
    #nonRecoverableError: _f$nonRecoverableError,
    #clientReferenceId: _f$clientReferenceId,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static IdentifierModel _instantiate(DecodingData data) {
    return IdentifierModel(
        id: data.dec(_f$id),
        identifierType: data.dec(_f$identifierType),
        identifierId: data.dec(_f$identifierId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        clientReferenceId: data.dec(_f$clientReferenceId),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static IdentifierModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<IdentifierModel>(map);
  }

  static IdentifierModel fromJson(String json) {
    return ensureInitialized().decodeJson<IdentifierModel>(json);
  }
}

mixin IdentifierModelMappable {
  String toJson() {
    return IdentifierModelMapper.ensureInitialized()
        .encodeJson<IdentifierModel>(this as IdentifierModel);
  }

  Map<String, dynamic> toMap() {
    return IdentifierModelMapper.ensureInitialized()
        .encodeMap<IdentifierModel>(this as IdentifierModel);
  }

  IdentifierModelCopyWith<IdentifierModel, IdentifierModel, IdentifierModel>
      get copyWith => _IdentifierModelCopyWithImpl(
          this as IdentifierModel, $identity, $identity);
  @override
  String toString() {
    return IdentifierModelMapper.ensureInitialized()
        .stringifyValue(this as IdentifierModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            IdentifierModelMapper.ensureInitialized()
                .isValueEqual(this as IdentifierModel, other));
  }

  @override
  int get hashCode {
    return IdentifierModelMapper.ensureInitialized()
        .hashValue(this as IdentifierModel);
  }
}

extension IdentifierModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, IdentifierModel, $Out> {
  IdentifierModelCopyWith<$R, IdentifierModel, $Out> get $asIdentifierModel =>
      $base.as((v, t, t2) => _IdentifierModelCopyWithImpl(v, t, t2));
}

abstract class IdentifierModelCopyWith<$R, $In extends IdentifierModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? identifierType,
      String? identifierId,
      bool? nonRecoverableError,
      String? clientReferenceId,
      String? tenantId,
      int? rowVersion});
  IdentifierModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _IdentifierModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, IdentifierModel, $Out>
    implements IdentifierModelCopyWith<$R, IdentifierModel, $Out> {
  _IdentifierModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<IdentifierModel> $mapper =
      IdentifierModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? identifierType = $none,
          Object? identifierId = $none,
          Object? nonRecoverableError = $none,
          String? clientReferenceId,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (identifierType != $none) #identifierType: identifierType,
        if (identifierId != $none) #identifierId: identifierId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (clientReferenceId != null) #clientReferenceId: clientReferenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  IdentifierModel $make(CopyWithData data) => IdentifierModel(
      id: data.get(#id, or: $value.id),
      identifierType: data.get(#identifierType, or: $value.identifierType),
      identifierId: data.get(#identifierId, or: $value.identifierId),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      clientReferenceId:
          data.get(#clientReferenceId, or: $value.clientReferenceId),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  IdentifierModelCopyWith<$R2, IdentifierModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _IdentifierModelCopyWithImpl($value, $cast, t);
}
