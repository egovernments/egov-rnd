import 'package:freezed_annotation/freezed_annotation.dart';

part 'loginModel.freezed.dart';

part 'loginModel.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const factory LoginModel({
    required String? username,
    required String? password,
    required String? tenantId,
    required String? userType,
    required String? grant_type,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?> json) =>
      _$LoginModelFromJson(json);
}
