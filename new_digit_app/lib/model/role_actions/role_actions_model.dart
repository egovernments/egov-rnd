// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'role_actions_model.freezed.dart';
part 'role_actions_model.g.dart';

@freezed
class RoleActionsWrapperModel with _$RoleActionsWrapperModel {
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory RoleActionsWrapperModel({
    @JsonKey(name: 'actions') @Default([]) List<RoleActionsModel> actions,
  }) = _RoleActionsWrapperModel;

  factory RoleActionsWrapperModel.fromJson(Map<String, dynamic> json) =>
      _$RoleActionsWrapperModelFromJson(json);
}

@freezed
class RoleActionsModel with _$RoleActionsModel {
  @JsonSerializable(explicitToJson: true)
  const factory RoleActionsModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'orderNumber') num? orderNumber,
    @JsonKey(name: 'queryParams') String? queryParams,
    @JsonKey(name: 'parentModule') String? parentModule,
    @JsonKey(name: 'enabled') required bool enabled,
    @JsonKey(name: 'serviceCode') String? serviceCode,
    @JsonKey(name: 'tenantId') required String tenantId,
    @JsonKey(name: 'createdDate') String? createdDate,
    @JsonKey(name: 'createdBy') String? createdBy,
    @JsonKey(name: 'lastModifiedDate') String? lastModifiedDate,
    @JsonKey(name: 'lastModifiedBy') String? lastModifiedBy,
    @JsonKey(name: 'path') String? path,
    @JsonKey(name: 'navigationURL') String? navigationURL,
    @JsonKey(name: 'leftIcon') String? leftIcon,
    @JsonKey(name: 'rightIcon') String? rightIcon,
  }) = _RoleActionsModel;

  factory RoleActionsModel.fromJson(Map<String, dynamic> json) =>
      _$RoleActionsModelFromJson(json);
}
