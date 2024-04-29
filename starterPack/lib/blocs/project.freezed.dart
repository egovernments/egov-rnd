// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)
        fetchProjects,
    required TResult Function(ProjectModel project) selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)?
        fetchProjects,
    TResult? Function(ProjectModel project)? selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)?
        fetchProjects,
    TResult Function(ProjectModel project)? selectProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectsFetchEvent value) fetchProjects,
    required TResult Function(ProjectSelectEvent value) selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsFetchEvent value)? fetchProjects,
    TResult? Function(ProjectSelectEvent value)? selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsFetchEvent value)? fetchProjects,
    TResult Function(ProjectSelectEvent value)? selectProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEventCopyWith<$Res> {
  factory $ProjectEventCopyWith(
          ProjectEvent value, $Res Function(ProjectEvent) then) =
      _$ProjectEventCopyWithImpl<$Res, ProjectEvent>;
}

/// @nodoc
class _$ProjectEventCopyWithImpl<$Res, $Val extends ProjectEvent>
    implements $ProjectEventCopyWith<$Res> {
  _$ProjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProjectsFetchEventImplCopyWith<$Res> {
  factory _$$ProjectsFetchEventImplCopyWith(_$ProjectsFetchEventImpl value,
          $Res Function(_$ProjectsFetchEventImpl) then) =
      __$$ProjectsFetchEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String uuid, Map<DataModelType, Map<ApiOperation, String>> actionMap});
}

/// @nodoc
class __$$ProjectsFetchEventImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectsFetchEventImpl>
    implements _$$ProjectsFetchEventImplCopyWith<$Res> {
  __$$ProjectsFetchEventImplCopyWithImpl(_$ProjectsFetchEventImpl _value,
      $Res Function(_$ProjectsFetchEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? actionMap = null,
  }) {
    return _then(_$ProjectsFetchEventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      actionMap: null == actionMap
          ? _value._actionMap
          : actionMap // ignore: cast_nullable_to_non_nullable
              as Map<DataModelType, Map<ApiOperation, String>>,
    ));
  }
}

/// @nodoc

class _$ProjectsFetchEventImpl implements ProjectsFetchEvent {
  const _$ProjectsFetchEventImpl(
      {required this.uuid,
      required final Map<DataModelType, Map<ApiOperation, String>> actionMap})
      : _actionMap = actionMap;

  @override
  final String uuid;
  final Map<DataModelType, Map<ApiOperation, String>> _actionMap;
  @override
  Map<DataModelType, Map<ApiOperation, String>> get actionMap {
    if (_actionMap is EqualUnmodifiableMapView) return _actionMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_actionMap);
  }

  @override
  String toString() {
    return 'ProjectEvent.fetchProjects(uuid: $uuid, actionMap: $actionMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsFetchEventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality()
                .equals(other._actionMap, _actionMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, const DeepCollectionEquality().hash(_actionMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsFetchEventImplCopyWith<_$ProjectsFetchEventImpl> get copyWith =>
      __$$ProjectsFetchEventImplCopyWithImpl<_$ProjectsFetchEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)
        fetchProjects,
    required TResult Function(ProjectModel project) selectProject,
  }) {
    return fetchProjects(uuid, actionMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)?
        fetchProjects,
    TResult? Function(ProjectModel project)? selectProject,
  }) {
    return fetchProjects?.call(uuid, actionMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)?
        fetchProjects,
    TResult Function(ProjectModel project)? selectProject,
    required TResult orElse(),
  }) {
    if (fetchProjects != null) {
      return fetchProjects(uuid, actionMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectsFetchEvent value) fetchProjects,
    required TResult Function(ProjectSelectEvent value) selectProject,
  }) {
    return fetchProjects(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsFetchEvent value)? fetchProjects,
    TResult? Function(ProjectSelectEvent value)? selectProject,
  }) {
    return fetchProjects?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsFetchEvent value)? fetchProjects,
    TResult Function(ProjectSelectEvent value)? selectProject,
    required TResult orElse(),
  }) {
    if (fetchProjects != null) {
      return fetchProjects(this);
    }
    return orElse();
  }
}

abstract class ProjectsFetchEvent implements ProjectEvent {
  const factory ProjectsFetchEvent(
      {required final String uuid,
      required final Map<DataModelType, Map<ApiOperation, String>>
          actionMap}) = _$ProjectsFetchEventImpl;

  String get uuid;
  Map<DataModelType, Map<ApiOperation, String>> get actionMap;
  @JsonKey(ignore: true)
  _$$ProjectsFetchEventImplCopyWith<_$ProjectsFetchEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectSelectEventImplCopyWith<$Res> {
  factory _$$ProjectSelectEventImplCopyWith(_$ProjectSelectEventImpl value,
          $Res Function(_$ProjectSelectEventImpl) then) =
      __$$ProjectSelectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel project});
}

/// @nodoc
class __$$ProjectSelectEventImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectSelectEventImpl>
    implements _$$ProjectSelectEventImplCopyWith<$Res> {
  __$$ProjectSelectEventImplCopyWithImpl(_$ProjectSelectEventImpl _value,
      $Res Function(_$ProjectSelectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$ProjectSelectEventImpl(
      null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ));
  }
}

/// @nodoc

class _$ProjectSelectEventImpl implements ProjectSelectEvent {
  const _$ProjectSelectEventImpl(this.project);

  @override
  final ProjectModel project;

  @override
  String toString() {
    return 'ProjectEvent.selectProject(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSelectEventImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSelectEventImplCopyWith<_$ProjectSelectEventImpl> get copyWith =>
      __$$ProjectSelectEventImplCopyWithImpl<_$ProjectSelectEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)
        fetchProjects,
    required TResult Function(ProjectModel project) selectProject,
  }) {
    return selectProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)?
        fetchProjects,
    TResult? Function(ProjectModel project)? selectProject,
  }) {
    return selectProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uuid,
            Map<DataModelType, Map<ApiOperation, String>> actionMap)?
        fetchProjects,
    TResult Function(ProjectModel project)? selectProject,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectsFetchEvent value) fetchProjects,
    required TResult Function(ProjectSelectEvent value) selectProject,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectsFetchEvent value)? fetchProjects,
    TResult? Function(ProjectSelectEvent value)? selectProject,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectsFetchEvent value)? fetchProjects,
    TResult Function(ProjectSelectEvent value)? selectProject,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(this);
    }
    return orElse();
  }
}

abstract class ProjectSelectEvent implements ProjectEvent {
  const factory ProjectSelectEvent(final ProjectModel project) =
      _$ProjectSelectEventImpl;

  ProjectModel get project;
  @JsonKey(ignore: true)
  _$$ProjectSelectEventImplCopyWith<_$ProjectSelectEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProjectModel> projectsList) fetched,
    required TResult Function(
            ProjectModel project, ProjectType relevantProjectType)
        selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProjectModel> projectsList)? fetched,
    TResult? Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProjectModel> projectsList)? fetched,
    TResult Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProjectInitialState value) initial,
    required TResult Function(ProjectFetchedState value) fetched,
    required TResult Function(ProjectSelectedState value) selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProjectInitialState value)? initial,
    TResult? Function(ProjectFetchedState value)? fetched,
    TResult? Function(ProjectSelectedState value)? selected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProjectInitialState value)? initial,
    TResult Function(ProjectFetchedState value)? fetched,
    TResult Function(ProjectSelectedState value)? selected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res, ProjectState>;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res, $Val extends ProjectState>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProjectInitialStateImplCopyWith<$Res> {
  factory _$$ProjectInitialStateImplCopyWith(_$ProjectInitialStateImpl value,
          $Res Function(_$ProjectInitialStateImpl) then) =
      __$$ProjectInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectInitialStateImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectInitialStateImpl>
    implements _$$ProjectInitialStateImplCopyWith<$Res> {
  __$$ProjectInitialStateImplCopyWithImpl(_$ProjectInitialStateImpl _value,
      $Res Function(_$ProjectInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProjectInitialStateImpl implements _ProjectInitialState {
  const _$ProjectInitialStateImpl();

  @override
  String toString() {
    return 'ProjectState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProjectModel> projectsList) fetched,
    required TResult Function(
            ProjectModel project, ProjectType relevantProjectType)
        selected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProjectModel> projectsList)? fetched,
    TResult? Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProjectModel> projectsList)? fetched,
    TResult Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProjectInitialState value) initial,
    required TResult Function(ProjectFetchedState value) fetched,
    required TResult Function(ProjectSelectedState value) selected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProjectInitialState value)? initial,
    TResult? Function(ProjectFetchedState value)? fetched,
    TResult? Function(ProjectSelectedState value)? selected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProjectInitialState value)? initial,
    TResult Function(ProjectFetchedState value)? fetched,
    TResult Function(ProjectSelectedState value)? selected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ProjectInitialState implements ProjectState {
  const factory _ProjectInitialState() = _$ProjectInitialStateImpl;
}

/// @nodoc
abstract class _$$ProjectFetchedStateImplCopyWith<$Res> {
  factory _$$ProjectFetchedStateImplCopyWith(_$ProjectFetchedStateImpl value,
          $Res Function(_$ProjectFetchedStateImpl) then) =
      __$$ProjectFetchedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProjectModel> projectsList});
}

/// @nodoc
class __$$ProjectFetchedStateImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectFetchedStateImpl>
    implements _$$ProjectFetchedStateImplCopyWith<$Res> {
  __$$ProjectFetchedStateImplCopyWithImpl(_$ProjectFetchedStateImpl _value,
      $Res Function(_$ProjectFetchedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectsList = null,
  }) {
    return _then(_$ProjectFetchedStateImpl(
      null == projectsList
          ? _value._projectsList
          : projectsList // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
    ));
  }
}

/// @nodoc

class _$ProjectFetchedStateImpl implements ProjectFetchedState {
  const _$ProjectFetchedStateImpl(final List<ProjectModel> projectsList)
      : _projectsList = projectsList;

  final List<ProjectModel> _projectsList;
  @override
  List<ProjectModel> get projectsList {
    if (_projectsList is EqualUnmodifiableListView) return _projectsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectsList);
  }

  @override
  String toString() {
    return 'ProjectState.fetched(projectsList: $projectsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectFetchedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._projectsList, _projectsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_projectsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectFetchedStateImplCopyWith<_$ProjectFetchedStateImpl> get copyWith =>
      __$$ProjectFetchedStateImplCopyWithImpl<_$ProjectFetchedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProjectModel> projectsList) fetched,
    required TResult Function(
            ProjectModel project, ProjectType relevantProjectType)
        selected,
  }) {
    return fetched(projectsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProjectModel> projectsList)? fetched,
    TResult? Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
  }) {
    return fetched?.call(projectsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProjectModel> projectsList)? fetched,
    TResult Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(projectsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProjectInitialState value) initial,
    required TResult Function(ProjectFetchedState value) fetched,
    required TResult Function(ProjectSelectedState value) selected,
  }) {
    return fetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProjectInitialState value)? initial,
    TResult? Function(ProjectFetchedState value)? fetched,
    TResult? Function(ProjectSelectedState value)? selected,
  }) {
    return fetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProjectInitialState value)? initial,
    TResult Function(ProjectFetchedState value)? fetched,
    TResult Function(ProjectSelectedState value)? selected,
    required TResult orElse(),
  }) {
    if (fetched != null) {
      return fetched(this);
    }
    return orElse();
  }
}

abstract class ProjectFetchedState implements ProjectState {
  const factory ProjectFetchedState(final List<ProjectModel> projectsList) =
      _$ProjectFetchedStateImpl;

  List<ProjectModel> get projectsList;
  @JsonKey(ignore: true)
  _$$ProjectFetchedStateImplCopyWith<_$ProjectFetchedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectSelectedStateImplCopyWith<$Res> {
  factory _$$ProjectSelectedStateImplCopyWith(_$ProjectSelectedStateImpl value,
          $Res Function(_$ProjectSelectedStateImpl) then) =
      __$$ProjectSelectedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel project, ProjectType relevantProjectType});

  $ProjectTypeCopyWith<$Res> get relevantProjectType;
}

/// @nodoc
class __$$ProjectSelectedStateImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectSelectedStateImpl>
    implements _$$ProjectSelectedStateImplCopyWith<$Res> {
  __$$ProjectSelectedStateImplCopyWithImpl(_$ProjectSelectedStateImpl _value,
      $Res Function(_$ProjectSelectedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
    Object? relevantProjectType = null,
  }) {
    return _then(_$ProjectSelectedStateImpl(
      null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
      null == relevantProjectType
          ? _value.relevantProjectType
          : relevantProjectType // ignore: cast_nullable_to_non_nullable
              as ProjectType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectTypeCopyWith<$Res> get relevantProjectType {
    return $ProjectTypeCopyWith<$Res>(_value.relevantProjectType, (value) {
      return _then(_value.copyWith(relevantProjectType: value));
    });
  }
}

/// @nodoc

class _$ProjectSelectedStateImpl implements ProjectSelectedState {
  const _$ProjectSelectedStateImpl(this.project, this.relevantProjectType);

  @override
  final ProjectModel project;
  @override
  final ProjectType relevantProjectType;

  @override
  String toString() {
    return 'ProjectState.selected(project: $project, relevantProjectType: $relevantProjectType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectSelectedStateImpl &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.relevantProjectType, relevantProjectType) ||
                other.relevantProjectType == relevantProjectType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project, relevantProjectType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectSelectedStateImplCopyWith<_$ProjectSelectedStateImpl>
      get copyWith =>
          __$$ProjectSelectedStateImplCopyWithImpl<_$ProjectSelectedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ProjectModel> projectsList) fetched,
    required TResult Function(
            ProjectModel project, ProjectType relevantProjectType)
        selected,
  }) {
    return selected(project, relevantProjectType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ProjectModel> projectsList)? fetched,
    TResult? Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
  }) {
    return selected?.call(project, relevantProjectType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ProjectModel> projectsList)? fetched,
    TResult Function(ProjectModel project, ProjectType relevantProjectType)?
        selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(project, relevantProjectType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ProjectInitialState value) initial,
    required TResult Function(ProjectFetchedState value) fetched,
    required TResult Function(ProjectSelectedState value) selected,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ProjectInitialState value)? initial,
    TResult? Function(ProjectFetchedState value)? fetched,
    TResult? Function(ProjectSelectedState value)? selected,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ProjectInitialState value)? initial,
    TResult Function(ProjectFetchedState value)? fetched,
    TResult Function(ProjectSelectedState value)? selected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class ProjectSelectedState implements ProjectState {
  const factory ProjectSelectedState(
          final ProjectModel project, final ProjectType relevantProjectType) =
      _$ProjectSelectedStateImpl;

  ProjectModel get project;
  ProjectType get relevantProjectType;
  @JsonKey(ignore: true)
  _$$ProjectSelectedStateImplCopyWith<_$ProjectSelectedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
