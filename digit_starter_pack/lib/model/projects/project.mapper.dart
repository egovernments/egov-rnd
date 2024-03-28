// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project.dart';

class ProjectSearchModelWrapperMapper
    extends ClassMapperBase<ProjectSearchModelWrapper> {
  ProjectSearchModelWrapperMapper._();

  static ProjectSearchModelWrapperMapper? _instance;
  static ProjectSearchModelWrapperMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectSearchModelWrapperMapper._());
      ProjectSearchModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectSearchModelWrapper';

  static List<ProjectSearchModel>? _$projects(ProjectSearchModelWrapper v) =>
      v.projects;
  static const Field<ProjectSearchModelWrapper, List<ProjectSearchModel>>
      _f$projects = Field('projects', _$projects, opt: true);

  @override
  final MappableFields<ProjectSearchModelWrapper> fields = const {
    #projects: _f$projects,
  };
  @override
  final bool ignoreNull = true;

  static ProjectSearchModelWrapper _instantiate(DecodingData data) {
    return ProjectSearchModelWrapper(projects: data.dec(_f$projects));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectSearchModelWrapper fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectSearchModelWrapper>(map);
  }

  static ProjectSearchModelWrapper fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectSearchModelWrapper>(json);
  }
}

mixin ProjectSearchModelWrapperMappable {
  String toJson() {
    return ProjectSearchModelWrapperMapper.ensureInitialized()
        .encodeJson<ProjectSearchModelWrapper>(
            this as ProjectSearchModelWrapper);
  }

  Map<String, dynamic> toMap() {
    return ProjectSearchModelWrapperMapper.ensureInitialized()
        .encodeMap<ProjectSearchModelWrapper>(
            this as ProjectSearchModelWrapper);
  }

  ProjectSearchModelWrapperCopyWith<ProjectSearchModelWrapper,
          ProjectSearchModelWrapper, ProjectSearchModelWrapper>
      get copyWith => _ProjectSearchModelWrapperCopyWithImpl(
          this as ProjectSearchModelWrapper, $identity, $identity);
  @override
  String toString() {
    return ProjectSearchModelWrapperMapper.ensureInitialized()
        .stringifyValue(this as ProjectSearchModelWrapper);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectSearchModelWrapperMapper.ensureInitialized()
                .isValueEqual(this as ProjectSearchModelWrapper, other));
  }

  @override
  int get hashCode {
    return ProjectSearchModelWrapperMapper.ensureInitialized()
        .hashValue(this as ProjectSearchModelWrapper);
  }
}

extension ProjectSearchModelWrapperValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectSearchModelWrapper, $Out> {
  ProjectSearchModelWrapperCopyWith<$R, ProjectSearchModelWrapper, $Out>
      get $asProjectSearchModelWrapper => $base
          .as((v, t, t2) => _ProjectSearchModelWrapperCopyWithImpl(v, t, t2));
}

abstract class ProjectSearchModelWrapperCopyWith<
    $R,
    $In extends ProjectSearchModelWrapper,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      ProjectSearchModel,
      ProjectSearchModelCopyWith<$R, ProjectSearchModel,
          ProjectSearchModel>>? get projects;
  $R call({List<ProjectSearchModel>? projects});
  ProjectSearchModelWrapperCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectSearchModelWrapperCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectSearchModelWrapper, $Out>
    implements
        ProjectSearchModelWrapperCopyWith<$R, ProjectSearchModelWrapper, $Out> {
  _ProjectSearchModelWrapperCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectSearchModelWrapper> $mapper =
      ProjectSearchModelWrapperMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      ProjectSearchModel,
      ProjectSearchModelCopyWith<$R, ProjectSearchModel,
          ProjectSearchModel>>? get projects => $value.projects != null
      ? ListCopyWith($value.projects!, (v, t) => v.copyWith.$chain(t),
          (v) => call(projects: v))
      : null;
  @override
  $R call({Object? projects = $none}) =>
      $apply(FieldCopyWithData({if (projects != $none) #projects: projects}));
  @override
  ProjectSearchModelWrapper $make(CopyWithData data) =>
      ProjectSearchModelWrapper(
          projects: data.get(#projects, or: $value.projects));

  @override
  ProjectSearchModelWrapperCopyWith<$R2, ProjectSearchModelWrapper, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectSearchModelWrapperCopyWithImpl($value, $cast, t);
}

class ProjectSearchModelMapper extends ClassMapperBase<ProjectSearchModel> {
  ProjectSearchModelMapper._();

  static ProjectSearchModelMapper? _instance;
  static ProjectSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectSearchModel';

  static String? _$id(ProjectSearchModel v) => v.id;
  static const Field<ProjectSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static String? _$projectTypeId(ProjectSearchModel v) => v.projectTypeId;
  static const Field<ProjectSearchModel, String> _f$projectTypeId =
      Field('projectTypeId', _$projectTypeId, opt: true);
  static String? _$projectNumber(ProjectSearchModel v) => v.projectNumber;
  static const Field<ProjectSearchModel, String> _f$projectNumber =
      Field('projectNumber', _$projectNumber, opt: true);
  static String? _$subProjectTypeId(ProjectSearchModel v) => v.subProjectTypeId;
  static const Field<ProjectSearchModel, String> _f$subProjectTypeId =
      Field('subProjectTypeId', _$subProjectTypeId, opt: true);
  static bool? _$isTaskEnabled(ProjectSearchModel v) => v.isTaskEnabled;
  static const Field<ProjectSearchModel, bool> _f$isTaskEnabled =
      Field('isTaskEnabled', _$isTaskEnabled, opt: true);
  static String? _$parent(ProjectSearchModel v) => v.parent;
  static const Field<ProjectSearchModel, String> _f$parent =
      Field('parent', _$parent, opt: true);
  static String? _$department(ProjectSearchModel v) => v.department;
  static const Field<ProjectSearchModel, String> _f$department =
      Field('department', _$department, opt: true);
  static String? _$referenceId(ProjectSearchModel v) => v.referenceId;
  static const Field<ProjectSearchModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$tenantId(ProjectSearchModel v) => v.tenantId;
  static const Field<ProjectSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$startDate(ProjectSearchModel v) => v.startDate;
  static const Field<ProjectSearchModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectSearchModel v) => v.endDate;
  static const Field<ProjectSearchModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static DateTime? _$startDateTime(ProjectSearchModel v) => v.startDateTime;
  static const Field<ProjectSearchModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectSearchModel v) => v.endDateTime;
  static const Field<ProjectSearchModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectSearchModel> fields = const {
    #id: _f$id,
    #projectTypeId: _f$projectTypeId,
    #projectNumber: _f$projectNumber,
    #subProjectTypeId: _f$subProjectTypeId,
    #isTaskEnabled: _f$isTaskEnabled,
    #parent: _f$parent,
    #department: _f$department,
    #referenceId: _f$referenceId,
    #tenantId: _f$tenantId,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
  };
  @override
  final bool ignoreNull = true;

  static ProjectSearchModel _instantiate(DecodingData data) {
    return ProjectSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        projectTypeId: data.dec(_f$projectTypeId),
        projectNumber: data.dec(_f$projectNumber),
        subProjectTypeId: data.dec(_f$subProjectTypeId),
        isTaskEnabled: data.dec(_f$isTaskEnabled),
        parent: data.dec(_f$parent),
        department: data.dec(_f$department),
        referenceId: data.dec(_f$referenceId),
        tenantId: data.dec(_f$tenantId),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectSearchModel>(map);
  }

  static ProjectSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectSearchModel>(json);
  }
}

mixin ProjectSearchModelMappable {
  String toJson() {
    return ProjectSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectSearchModel>(this as ProjectSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectSearchModel>(this as ProjectSearchModel);
  }

  ProjectSearchModelCopyWith<ProjectSearchModel, ProjectSearchModel,
          ProjectSearchModel>
      get copyWith => _ProjectSearchModelCopyWithImpl(
          this as ProjectSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectSearchModel);
  }
}

extension ProjectSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectSearchModel, $Out> {
  ProjectSearchModelCopyWith<$R, ProjectSearchModel, $Out>
      get $asProjectSearchModel =>
          $base.as((v, t, t2) => _ProjectSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectSearchModelCopyWith<$R, $In extends ProjectSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? projectTypeId,
      String? projectNumber,
      String? subProjectTypeId,
      bool? isTaskEnabled,
      String? parent,
      String? department,
      String? referenceId,
      String? tenantId,
      int? startDate,
      int? endDate});
  ProjectSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectSearchModel, $Out>
    implements ProjectSearchModelCopyWith<$R, ProjectSearchModel, $Out> {
  _ProjectSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectSearchModel> $mapper =
      ProjectSearchModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? projectTypeId = $none,
          Object? projectNumber = $none,
          Object? subProjectTypeId = $none,
          Object? isTaskEnabled = $none,
          Object? parent = $none,
          Object? department = $none,
          Object? referenceId = $none,
          Object? tenantId = $none,
          Object? startDate = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (projectTypeId != $none) #projectTypeId: projectTypeId,
        if (projectNumber != $none) #projectNumber: projectNumber,
        if (subProjectTypeId != $none) #subProjectTypeId: subProjectTypeId,
        if (isTaskEnabled != $none) #isTaskEnabled: isTaskEnabled,
        if (parent != $none) #parent: parent,
        if (department != $none) #department: department,
        if (referenceId != $none) #referenceId: referenceId,
        if (tenantId != $none) #tenantId: tenantId,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  ProjectSearchModel $make(CopyWithData data) =>
      ProjectSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          projectTypeId: data.get(#projectTypeId, or: $value.projectTypeId),
          projectNumber: data.get(#projectNumber, or: $value.projectNumber),
          subProjectTypeId:
              data.get(#subProjectTypeId, or: $value.subProjectTypeId),
          isTaskEnabled: data.get(#isTaskEnabled, or: $value.isTaskEnabled),
          parent: data.get(#parent, or: $value.parent),
          department: data.get(#department, or: $value.department),
          referenceId: data.get(#referenceId, or: $value.referenceId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          startDate: data.get(#startDate, or: $value.startDate),
          endDate: data.get(#endDate, or: $value.endDate));

  @override
  ProjectSearchModelCopyWith<$R2, ProjectSearchModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectModelMapper extends ClassMapperBase<ProjectModel> {
  ProjectModelMapper._();

  static ProjectModelMapper? _instance;
  static ProjectModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectModelMapper._());
      AddressModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectModel';

  static String _$id(ProjectModel v) => v.id;
  static const Field<ProjectModel, String> _f$id = Field('id', _$id);
  static String? _$projectType(ProjectModel v) => v.projectType;
  static const Field<ProjectModel, String> _f$projectType =
      Field('projectType', _$projectType, opt: true);
  static String? _$projectTypeId(ProjectModel v) => v.projectTypeId;
  static const Field<ProjectModel, String> _f$projectTypeId =
      Field('projectTypeId', _$projectTypeId, opt: true);
  static String? _$projectNumber(ProjectModel v) => v.projectNumber;
  static const Field<ProjectModel, String> _f$projectNumber =
      Field('projectNumber', _$projectNumber, opt: true);
  static String? _$subProjectTypeId(ProjectModel v) => v.subProjectTypeId;
  static const Field<ProjectModel, String> _f$subProjectTypeId =
      Field('subProjectTypeId', _$subProjectTypeId, opt: true);
  static bool? _$isTaskEnabled(ProjectModel v) => v.isTaskEnabled;
  static const Field<ProjectModel, bool> _f$isTaskEnabled =
      Field('isTaskEnabled', _$isTaskEnabled, opt: true);
  static String? _$parent(ProjectModel v) => v.parent;
  static const Field<ProjectModel, String> _f$parent =
      Field('parent', _$parent, opt: true);
  static String _$name(ProjectModel v) => v.name;
  static const Field<ProjectModel, String> _f$name = Field('name', _$name);
  static String? _$department(ProjectModel v) => v.department;
  static const Field<ProjectModel, String> _f$department =
      Field('department', _$department, opt: true);
  static String? _$description(ProjectModel v) => v.description;
  static const Field<ProjectModel, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$referenceId(ProjectModel v) => v.referenceId;
  static const Field<ProjectModel, String> _f$referenceId =
      Field('referenceId', _$referenceId, opt: true);
  static String? _$projectHierarchy(ProjectModel v) => v.projectHierarchy;
  static const Field<ProjectModel, String> _f$projectHierarchy =
      Field('projectHierarchy', _$projectHierarchy, opt: true);
  static bool? _$nonRecoverableError(ProjectModel v) => v.nonRecoverableError;
  static const Field<ProjectModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectModel v) => v.tenantId;
  static const Field<ProjectModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectModel v) => v.rowVersion;
  static const Field<ProjectModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static AddressModel? _$address(ProjectModel v) => v.address;
  static const Field<ProjectModel, AddressModel> _f$address =
      Field('address', _$address, opt: true);
  static int? _$startDate(ProjectModel v) => v.startDate;
  static const Field<ProjectModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectModel v) => v.endDate;
  static const Field<ProjectModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static DateTime? _$startDateTime(ProjectModel v) => v.startDateTime;
  static const Field<ProjectModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectModel v) => v.endDateTime;
  static const Field<ProjectModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectModel> fields = const {
    #id: _f$id,
    #projectType: _f$projectType,
    #projectTypeId: _f$projectTypeId,
    #projectNumber: _f$projectNumber,
    #subProjectTypeId: _f$subProjectTypeId,
    #isTaskEnabled: _f$isTaskEnabled,
    #parent: _f$parent,
    #name: _f$name,
    #department: _f$department,
    #description: _f$description,
    #referenceId: _f$referenceId,
    #projectHierarchy: _f$projectHierarchy,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #address: _f$address,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
  };
  @override
  final bool ignoreNull = true;

  static ProjectModel _instantiate(DecodingData data) {
    return ProjectModel(
        id: data.dec(_f$id),
        projectType: data.dec(_f$projectType),
        projectTypeId: data.dec(_f$projectTypeId),
        projectNumber: data.dec(_f$projectNumber),
        subProjectTypeId: data.dec(_f$subProjectTypeId),
        isTaskEnabled: data.dec(_f$isTaskEnabled),
        parent: data.dec(_f$parent),
        name: data.dec(_f$name),
        department: data.dec(_f$department),
        description: data.dec(_f$description),
        referenceId: data.dec(_f$referenceId),
        projectHierarchy: data.dec(_f$projectHierarchy),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        address: data.dec(_f$address),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectModel>(map);
  }

  static ProjectModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectModel>(json);
  }
}

mixin ProjectModelMappable {
  String toJson() {
    return ProjectModelMapper.ensureInitialized()
        .encodeJson<ProjectModel>(this as ProjectModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectModelMapper.ensureInitialized()
        .encodeMap<ProjectModel>(this as ProjectModel);
  }

  ProjectModelCopyWith<ProjectModel, ProjectModel, ProjectModel> get copyWith =>
      _ProjectModelCopyWithImpl(this as ProjectModel, $identity, $identity);
  @override
  String toString() {
    return ProjectModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectModel, other));
  }

  @override
  int get hashCode {
    return ProjectModelMapper.ensureInitialized()
        .hashValue(this as ProjectModel);
  }
}

extension ProjectModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectModel, $Out> {
  ProjectModelCopyWith<$R, ProjectModel, $Out> get $asProjectModel =>
      $base.as((v, t, t2) => _ProjectModelCopyWithImpl(v, t, t2));
}

abstract class ProjectModelCopyWith<$R, $In extends ProjectModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address;
  $R call(
      {String? id,
      String? projectType,
      String? projectTypeId,
      String? projectNumber,
      String? subProjectTypeId,
      bool? isTaskEnabled,
      String? parent,
      String? name,
      String? department,
      String? description,
      String? referenceId,
      String? projectHierarchy,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      AddressModel? address,
      int? startDate,
      int? endDate});
  ProjectModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectModel, $Out>
    implements ProjectModelCopyWith<$R, ProjectModel, $Out> {
  _ProjectModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectModel> $mapper =
      ProjectModelMapper.ensureInitialized();
  @override
  AddressModelCopyWith<$R, AddressModel, AddressModel>? get address =>
      $value.address?.copyWith.$chain((v) => call(address: v));
  @override
  $R call(
          {String? id,
          Object? projectType = $none,
          Object? projectTypeId = $none,
          Object? projectNumber = $none,
          Object? subProjectTypeId = $none,
          Object? isTaskEnabled = $none,
          Object? parent = $none,
          String? name,
          Object? department = $none,
          Object? description = $none,
          Object? referenceId = $none,
          Object? projectHierarchy = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? address = $none,
          Object? startDate = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (projectType != $none) #projectType: projectType,
        if (projectTypeId != $none) #projectTypeId: projectTypeId,
        if (projectNumber != $none) #projectNumber: projectNumber,
        if (subProjectTypeId != $none) #subProjectTypeId: subProjectTypeId,
        if (isTaskEnabled != $none) #isTaskEnabled: isTaskEnabled,
        if (parent != $none) #parent: parent,
        if (name != null) #name: name,
        if (department != $none) #department: department,
        if (description != $none) #description: description,
        if (referenceId != $none) #referenceId: referenceId,
        if (projectHierarchy != $none) #projectHierarchy: projectHierarchy,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (address != $none) #address: address,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  ProjectModel $make(CopyWithData data) => ProjectModel(
      id: data.get(#id, or: $value.id),
      projectType: data.get(#projectType, or: $value.projectType),
      projectTypeId: data.get(#projectTypeId, or: $value.projectTypeId),
      projectNumber: data.get(#projectNumber, or: $value.projectNumber),
      subProjectTypeId:
          data.get(#subProjectTypeId, or: $value.subProjectTypeId),
      isTaskEnabled: data.get(#isTaskEnabled, or: $value.isTaskEnabled),
      parent: data.get(#parent, or: $value.parent),
      name: data.get(#name, or: $value.name),
      department: data.get(#department, or: $value.department),
      description: data.get(#description, or: $value.description),
      referenceId: data.get(#referenceId, or: $value.referenceId),
      projectHierarchy:
          data.get(#projectHierarchy, or: $value.projectHierarchy),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      address: data.get(#address, or: $value.address),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate));

  @override
  ProjectModelCopyWith<$R2, ProjectModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectModelCopyWithImpl($value, $cast, t);
}
