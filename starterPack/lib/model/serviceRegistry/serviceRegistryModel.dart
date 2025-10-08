import 'package:freezed_annotation/freezed_annotation.dart';

part 'serviceRegistryModel.freezed.dart';
part 'serviceRegistryModel.g.dart';

@freezed
class ServiceRegistryModel with _$ServiceRegistryModel {
  const factory ServiceRegistryModel(
          {@JsonKey(name: 'HCM-SERVICE-REGISTRY')
              required ServiceRegistryWrapper? serviceRegistryWrapper}) =
      _ServiceRegistryModel;

  factory ServiceRegistryModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ServiceRegistryModelFromJson(json);
}

@freezed
class ServiceRegistryWrapper with _$ServiceRegistryWrapper {
  const factory ServiceRegistryWrapper(
          {required List<ServiceRegistry>? serviceRegistry}) =
      _ServiceRegistryWrapper;

  factory ServiceRegistryWrapper.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ServiceRegistryWrapperFromJson(json);
}

@freezed
class ServiceRegistry with _$ServiceRegistry {
  const factory ServiceRegistry(
      final String? service, final List<Action>? actions) = _ServiceRegistry;

  factory ServiceRegistry.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ServiceRegistryFromJson(json);
}

@freezed
class Action with _$Action {
  const factory Action(
      {required String action,
      required String entityName,
      required String path}) = _Action;

  factory Action.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ActionFromJson(json);
}
