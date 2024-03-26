// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_staff.dart';

class ProjectStaffSearchModelMapper
    extends ClassMapperBase<ProjectStaffSearchModel> {
  ProjectStaffSearchModelMapper._();

  static ProjectStaffSearchModelMapper? _instance;
  static ProjectStaffSearchModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = ProjectStaffSearchModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectStaffSearchModel';

  static String? _$id(ProjectStaffSearchModel v) => v.id;
  static const Field<ProjectStaffSearchModel, String> _f$id =
      Field('id', _$id, opt: true);
  static List<String>? _$staffId(ProjectStaffSearchModel v) => v.staffId;
  static const Field<ProjectStaffSearchModel, List<String>> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$userId(ProjectStaffSearchModel v) => v.userId;
  static const Field<ProjectStaffSearchModel, String> _f$userId =
      Field('userId', _$userId, opt: true);
  static String? _$projectId(ProjectStaffSearchModel v) => v.projectId;
  static const Field<ProjectStaffSearchModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$tenantId(ProjectStaffSearchModel v) => v.tenantId;
  static const Field<ProjectStaffSearchModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$startDate(ProjectStaffSearchModel v) => v.startDate;
  static const Field<ProjectStaffSearchModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectStaffSearchModel v) => v.endDate;
  static const Field<ProjectStaffSearchModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static DateTime? _$startDateTime(ProjectStaffSearchModel v) =>
      v.startDateTime;
  static const Field<ProjectStaffSearchModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectStaffSearchModel v) => v.endDateTime;
  static const Field<ProjectStaffSearchModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectStaffSearchModel> fields = const {
    #id: _f$id,
    #staffId: _f$staffId,
    #userId: _f$userId,
    #projectId: _f$projectId,
    #tenantId: _f$tenantId,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
  };
  @override
  final bool ignoreNull = true;

  static ProjectStaffSearchModel _instantiate(DecodingData data) {
    return ProjectStaffSearchModel.ignoreDeleted(
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        userId: data.dec(_f$userId),
        projectId: data.dec(_f$projectId),
        tenantId: data.dec(_f$tenantId),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectStaffSearchModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectStaffSearchModel>(map);
  }

  static ProjectStaffSearchModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectStaffSearchModel>(json);
  }
}

mixin ProjectStaffSearchModelMappable {
  String toJson() {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .encodeJson<ProjectStaffSearchModel>(this as ProjectStaffSearchModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .encodeMap<ProjectStaffSearchModel>(this as ProjectStaffSearchModel);
  }

  ProjectStaffSearchModelCopyWith<ProjectStaffSearchModel,
          ProjectStaffSearchModel, ProjectStaffSearchModel>
      get copyWith => _ProjectStaffSearchModelCopyWithImpl(
          this as ProjectStaffSearchModel, $identity, $identity);
  @override
  String toString() {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectStaffSearchModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectStaffSearchModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectStaffSearchModel, other));
  }

  @override
  int get hashCode {
    return ProjectStaffSearchModelMapper.ensureInitialized()
        .hashValue(this as ProjectStaffSearchModel);
  }
}

extension ProjectStaffSearchModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectStaffSearchModel, $Out> {
  ProjectStaffSearchModelCopyWith<$R, ProjectStaffSearchModel, $Out>
      get $asProjectStaffSearchModel => $base
          .as((v, t, t2) => _ProjectStaffSearchModelCopyWithImpl(v, t, t2));
}

abstract class ProjectStaffSearchModelCopyWith<
    $R,
    $In extends ProjectStaffSearchModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get staffId;
  $R call(
      {String? id,
      List<String>? staffId,
      String? userId,
      String? projectId,
      String? tenantId,
      int? startDate,
      int? endDate});
  ProjectStaffSearchModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectStaffSearchModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectStaffSearchModel, $Out>
    implements
        ProjectStaffSearchModelCopyWith<$R, ProjectStaffSearchModel, $Out> {
  _ProjectStaffSearchModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectStaffSearchModel> $mapper =
      ProjectStaffSearchModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get staffId =>
      $value.staffId != null
          ? ListCopyWith(
              $value.staffId!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(staffId: v))
          : null;
  @override
  $R call(
          {Object? id = $none,
          Object? staffId = $none,
          Object? userId = $none,
          Object? projectId = $none,
          Object? tenantId = $none,
          Object? startDate = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (userId != $none) #userId: userId,
        if (projectId != $none) #projectId: projectId,
        if (tenantId != $none) #tenantId: tenantId,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  ProjectStaffSearchModel $make(CopyWithData data) =>
      ProjectStaffSearchModel.ignoreDeleted(
          id: data.get(#id, or: $value.id),
          staffId: data.get(#staffId, or: $value.staffId),
          userId: data.get(#userId, or: $value.userId),
          projectId: data.get(#projectId, or: $value.projectId),
          tenantId: data.get(#tenantId, or: $value.tenantId),
          startDate: data.get(#startDate, or: $value.startDate),
          endDate: data.get(#endDate, or: $value.endDate));

  @override
  ProjectStaffSearchModelCopyWith<$R2, ProjectStaffSearchModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _ProjectStaffSearchModelCopyWithImpl($value, $cast, t);
}

class ProjectStaffModelMapper extends ClassMapperBase<ProjectStaffModel> {
  ProjectStaffModelMapper._();

  static ProjectStaffModelMapper? _instance;
  static ProjectStaffModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectStaffModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectStaffModel';

  static String _$id(ProjectStaffModel v) => v.id;
  static const Field<ProjectStaffModel, String> _f$id = Field('id', _$id);
  static String? _$staffId(ProjectStaffModel v) => v.staffId;
  static const Field<ProjectStaffModel, String> _f$staffId =
      Field('staffId', _$staffId, opt: true);
  static String? _$userId(ProjectStaffModel v) => v.userId;
  static const Field<ProjectStaffModel, String> _f$userId =
      Field('userId', _$userId, opt: true);
  static String? _$projectId(ProjectStaffModel v) => v.projectId;
  static const Field<ProjectStaffModel, String> _f$projectId =
      Field('projectId', _$projectId, opt: true);
  static String? _$channel(ProjectStaffModel v) => v.channel;
  static const Field<ProjectStaffModel, String> _f$channel =
      Field('channel', _$channel, opt: true);
  static bool? _$nonRecoverableError(ProjectStaffModel v) =>
      v.nonRecoverableError;
  static const Field<ProjectStaffModel, bool> _f$nonRecoverableError = Field(
      'nonRecoverableError', _$nonRecoverableError,
      opt: true, def: false);
  static String? _$tenantId(ProjectStaffModel v) => v.tenantId;
  static const Field<ProjectStaffModel, String> _f$tenantId =
      Field('tenantId', _$tenantId, opt: true);
  static int? _$rowVersion(ProjectStaffModel v) => v.rowVersion;
  static const Field<ProjectStaffModel, int> _f$rowVersion =
      Field('rowVersion', _$rowVersion, opt: true);
  static int? _$startDate(ProjectStaffModel v) => v.startDate;
  static const Field<ProjectStaffModel, int> _f$startDate =
      Field('startDate', _$startDate, opt: true);
  static int? _$endDate(ProjectStaffModel v) => v.endDate;
  static const Field<ProjectStaffModel, int> _f$endDate =
      Field('endDate', _$endDate, opt: true);
  static DateTime? _$startDateTime(ProjectStaffModel v) => v.startDateTime;
  static const Field<ProjectStaffModel, DateTime> _f$startDateTime =
      Field('startDateTime', _$startDateTime, mode: FieldMode.member);
  static DateTime? _$endDateTime(ProjectStaffModel v) => v.endDateTime;
  static const Field<ProjectStaffModel, DateTime> _f$endDateTime =
      Field('endDateTime', _$endDateTime, mode: FieldMode.member);

  @override
  final MappableFields<ProjectStaffModel> fields = const {
    #id: _f$id,
    #staffId: _f$staffId,
    #userId: _f$userId,
    #projectId: _f$projectId,
    #channel: _f$channel,
    #nonRecoverableError: _f$nonRecoverableError,
    #tenantId: _f$tenantId,
    #rowVersion: _f$rowVersion,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
    #startDateTime: _f$startDateTime,
    #endDateTime: _f$endDateTime,
  };
  @override
  final bool ignoreNull = true;

  static ProjectStaffModel _instantiate(DecodingData data) {
    return ProjectStaffModel(
        id: data.dec(_f$id),
        staffId: data.dec(_f$staffId),
        userId: data.dec(_f$userId),
        projectId: data.dec(_f$projectId),
        channel: data.dec(_f$channel),
        nonRecoverableError: data.dec(_f$nonRecoverableError),
        tenantId: data.dec(_f$tenantId),
        rowVersion: data.dec(_f$rowVersion),
        startDate: data.dec(_f$startDate),
        endDate: data.dec(_f$endDate));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectStaffModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectStaffModel>(map);
  }

  static ProjectStaffModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectStaffModel>(json);
  }
}

mixin ProjectStaffModelMappable {
  String toJson() {
    return ProjectStaffModelMapper.ensureInitialized()
        .encodeJson<ProjectStaffModel>(this as ProjectStaffModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectStaffModelMapper.ensureInitialized()
        .encodeMap<ProjectStaffModel>(this as ProjectStaffModel);
  }

  ProjectStaffModelCopyWith<ProjectStaffModel, ProjectStaffModel,
          ProjectStaffModel>
      get copyWith => _ProjectStaffModelCopyWithImpl(
          this as ProjectStaffModel, $identity, $identity);
  @override
  String toString() {
    return ProjectStaffModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectStaffModel);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectStaffModelMapper.ensureInitialized()
                .isValueEqual(this as ProjectStaffModel, other));
  }

  @override
  int get hashCode {
    return ProjectStaffModelMapper.ensureInitialized()
        .hashValue(this as ProjectStaffModel);
  }
}

extension ProjectStaffModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectStaffModel, $Out> {
  ProjectStaffModelCopyWith<$R, ProjectStaffModel, $Out>
      get $asProjectStaffModel =>
          $base.as((v, t, t2) => _ProjectStaffModelCopyWithImpl(v, t, t2));
}

abstract class ProjectStaffModelCopyWith<$R, $In extends ProjectStaffModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      String? staffId,
      String? userId,
      String? projectId,
      String? channel,
      bool? nonRecoverableError,
      String? tenantId,
      int? rowVersion,
      int? startDate,
      int? endDate});
  ProjectStaffModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ProjectStaffModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectStaffModel, $Out>
    implements ProjectStaffModelCopyWith<$R, ProjectStaffModel, $Out> {
  _ProjectStaffModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectStaffModel> $mapper =
      ProjectStaffModelMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          Object? staffId = $none,
          Object? userId = $none,
          Object? projectId = $none,
          Object? channel = $none,
          Object? nonRecoverableError = $none,
          Object? tenantId = $none,
          Object? rowVersion = $none,
          Object? startDate = $none,
          Object? endDate = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (staffId != $none) #staffId: staffId,
        if (userId != $none) #userId: userId,
        if (projectId != $none) #projectId: projectId,
        if (channel != $none) #channel: channel,
        if (nonRecoverableError != $none)
          #nonRecoverableError: nonRecoverableError,
        if (tenantId != $none) #tenantId: tenantId,
        if (rowVersion != $none) #rowVersion: rowVersion,
        if (startDate != $none) #startDate: startDate,
        if (endDate != $none) #endDate: endDate
      }));
  @override
  ProjectStaffModel $make(CopyWithData data) => ProjectStaffModel(
      id: data.get(#id, or: $value.id),
      staffId: data.get(#staffId, or: $value.staffId),
      userId: data.get(#userId, or: $value.userId),
      projectId: data.get(#projectId, or: $value.projectId),
      channel: data.get(#channel, or: $value.channel),
      nonRecoverableError:
          data.get(#nonRecoverableError, or: $value.nonRecoverableError),
      tenantId: data.get(#tenantId, or: $value.tenantId),
      rowVersion: data.get(#rowVersion, or: $value.rowVersion),
      startDate: data.get(#startDate, or: $value.startDate),
      endDate: data.get(#endDate, or: $value.endDate));

  @override
  ProjectStaffModelCopyWith<$R2, ProjectStaffModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectStaffModelCopyWithImpl($value, $cast, t);
}
