// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_facility.dart';

class ProjectFacilitySearchModelMapper
    extends ClassMapperBase<ProjectFacilitySearchModel> {
  ProjectFacilitySearchModelMapper._();

  static ProjectFacilitySearchModelMapper? _instance;
  static ProjectFacilitySearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectFacilitySearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectFacilitySearchModel';

  static String? _$id(ProjectFacilitySearchModel v) => v.id;
  static const Field<ProjectFacilitySearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$facilityId(ProjectFacilitySearchModel v) =>
      v.facilityId;
  static const Field<ProjectFacilitySearchModel, List<String>> _f$facilityId =
      Field('facilityId', _$facilityId, opt: true);
  static List<String>? _$projectId(ProjectFacilitySearchModel v) => v.projectId;
  static const Field<ProjectFacilitySearchModel, List<String>> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$tenantId(ProjectFacilitySearchModel v) => v.tenantId;
  static const Field<ProjectFacilitySearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);

  @override
  final MappableFields<ProjectFacilitySearchModel> fields = const {
    #id: _f$id,
    #facilityId: _f$facilityId,
    #projectId: _f$projectId,
    #tenantId: _f$tenantId,
  };
  @override
  final bool ignoreNull = true;

  static ProjectFacilitySearchModel _instantiate(DecodingData data) {
    return ProjectFacilitySearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        facilityId: data.dec(_f$facilityId),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectFacilitySearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectFacilitySearchModel>(map);
  }

  static ProjectFacilitySearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectFacilitySearchModel>(json);
  }
}

mixin ProjectFacilitySearchModelMappable {
  String toJson() {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .encodeJson<ProjectFacilitySearchModel>(
            this as ProjectFacilitySearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .encodeMap<ProjectFacilitySearchModel>(
            this as ProjectFacilitySearchModel);
  }

  ProjectFacilitySearchModelCopyWith<ProjectFacilitySearchModel,
          ProjectFacilitySearchModel, ProjectFacilitySearchModel>
      get copyWith => _ProjectFacilitySearchModelCopyWithImpl(
          this as ProjectFacilitySearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectFacilitySearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectFacilitySearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectFacilitySearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectFacilitySearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectFacilitySearchModel);
  }
}

extension ProjectFacilitySearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectFacilitySearchModel, $Out> {
  ProjectFacilitySearchModelCopyWith<$R, ProjectFacilitySearchModel, $Out>
      get $asProjectFacilitySearchModel => $base
          .as((v, t, t2) => _ProjectFacilitySearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectFacilitySearchModelCopyWith<
    $R,
    $In extends ProjectFacilitySearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get facilityId;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId;
  $R call(
      {String? id,
      List<String>? facilityId,
      List<String>? projectId,
      String? tenantId});
  ProjectFacilitySearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectFacilitySearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectFacilitySearchModel, $Out>
    implements
        ProjectFacilitySearchModelCopyWith<$R, ProjectFacilitySearchModel,
            $Out> {
  _ProjectFacilitySearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectFacilitySearchModel> $mapper =
      ProjectFacilitySearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get facilityId => $value.facilityId != null
          ? ListCopyWith(
              $value.facilityId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(facilityId: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get projectId =>
      $value.projectId != null
          ? ListCopyWith(
              $value.projectId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(projectId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? facilityId = $none,
          Object? projectId = $none,
          Object? tenantId = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (facilityId != $none) #facilityId: facilityId,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId
      }));
  @override
  ProjectFacilitySearchModel $make(CopyWithData data) =>
      ProjectFacilitySearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          facilityId: data.get(#facilityId, or: $value.facilityId),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId));

  @override
  ProjectFacilitySearchModelCopyWith<$R2, ProjectFacilitySearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectFacilitySearchModelCopyWithImpl($value, $cast, t);
}

class ProjectFacilityModelMapper extends ClassMapperBase<ProjectFacilityModel> {
  ProjectFacilityModelMapper._();

  static ProjectFacilityModelMapper? _instance;
  static ProjectFacilityModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectFacilityModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectFacilityModel';

  static String _$id(ProjectFacilityModel v) => v.id;
  static const Field<ProjectFacilityModel, String> _f$id = Field('id', _$id);
  static String _$facilityId(ProjectFacilityModel v) => v.facilityId;
  static const Field<ProjectFacilityModel, String> _f$facilityId =
      Field('facilityId', _$facilityId);
  static String _$projectId(ProjectFacilityModel v) => v.projectId;
  static const Field<ProjectFacilityModel, String> _f$projectId =
      Field('projectId', _$projectId);
  static bool? _$nonRecoverableError(ProjectFacilityModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectFacilityModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectFacilityModel v) => v.tenantId;
  static const Field<ProjectFacilityModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectFacilityModel v) => v.rowVersion;
  static const Field<ProjectFacilityModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);

  @override
  final MappableFields<ProjectFacilityModel> fields = const {
    #id: _f$id,
    #facilityId: _f$facilityId,
    #projectId: _f$projectId,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
  };
  @override
  final bool ignoreNull = true;

  static ProjectFacilityModel _instantiate(DecodingData data) {
    return ProjectFacilityModel(
        id: data.dec(_f$id),
        facilityId: data.dec(_f$facilityId),
        projectId: data.dec(_f$projectId),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectFacilityModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectFacilityModel>(map);
  }

  static ProjectFacilityModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectFacilityModel>(json);
  }
}

mixin ProjectFacilityModelMappable {
  String toJson() {
    return ProjectFacilityModelMapper.ensureInitialized()
        .encodeJson<ProjectFacilityModel>(this as ProjectFacilityModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectFacilityModelMapper.ensureInitialized()
        .encodeMap<ProjectFacilityModel>(this as ProjectFacilityModel);
  }

  ProjectFacilityModelCopyWith<ProjectFacilityModel, ProjectFacilityModel,
          ProjectFacilityModel>
      get copyWith => _ProjectFacilityModelCopyWithImpl(
          this as ProjectFacilityModel, $identity, $identity);
  @override
  String toString() {
    return ProjectFacilityModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectFacilityModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectFacilityModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectFacilityModel, other));
  }

  @override
  int get hashCode {
    return ProjectFacilityModelMapper.ensureInitialized()
        .hashValue(this as ProjectFacilityModel);
  }
}

extension ProjectFacilityModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectFacilityModel, $Out> {
  ProjectFacilityModelCopyWith<$R, ProjectFacilityModel, $Out>
      get $asProjectFacilityModel =>
          $base.as((v, t, t2) => _ProjectFacilityModelCopyWithImpl(v, t, t2));
}

abstract class ProjectFacilityModelCopyWith<
    $R,
    $In extends ProjectFacilityModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? facilityId,
      String? projectId,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion});
  ProjectFacilityModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectFacilityModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectFacilityModel, $Out>
    implements ProjectFacilityModelCopyWith<$R, ProjectFacilityModel, $Out> {
  _ProjectFacilityModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectFacilityModel> $mapper =
      ProjectFacilityModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          String? facilityId,
          String? projectId,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (facilityId != null) #facilityId: facilityId,
        if (projectId != null) #projectId: projectId,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion
      }));
  @override
  ProjectFacilityModel $make(CopyWithData data) => ProjectFacilityModel(
      id: data.get(#id, or: $value.id),
      facilityId: data.get(#facilityId, or: $value.facilityId),
      projectId: data.get(#projectId, or: $value.projectId),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion));

  @override
  ProjectFacilityModelCopyWith<$R2, ProjectFacilityModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectFacilityModelCopyWithImpl($value, $cast, t);
}
