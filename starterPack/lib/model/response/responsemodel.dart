import 'package:freezed_annotation/freezed_annotation.dart';

part 'responsemodel.freezed.dart';

part 'responsemodel.g.dart';

@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel(
          {required String access_token,
          required String? token_type,
          required String? refresh_token,
          required String? scope,
          @JsonKey(name: 'UserRequest') required UserRequest? userRequest}) =
      _ResponseModel;

  factory ResponseModel.fromJson(Map<String, Object?> json) =>
      _$ResponseModelFromJson(json);
}

@freezed
class UserRequest with _$UserRequest {
  const factory UserRequest(
      {required int id,
      required String uuid,
      required String? userName,
      required String? name,
      required String? mobileNumber,
      required String? emailId,
      required String? type,
      required bool? active,
      required List<Roles> roles,
      required String tenantId}) = _UserRequest;

  factory UserRequest.fromJson(Map<String, Object?> json) =>
      _$UserRequestFromJson(json);
}

@freezed
class Roles with _$Roles {
  const factory Roles(
      {required String? name,
      required String? code,
      required String? tenantId}) = _Roles;

  factory Roles.fromJson(Map<String, Object?> json) => _$RolesFromJson(json);
}
