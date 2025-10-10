// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data_model.freezed.dart';
part 'login_data_model.g.dart';

@freezed
class LoginDataModel with _$LoginDataModel {
  const factory LoginDataModel({
    required String access_token,
    required UserRequestModel UserRequest,
  }) = _LoginDataModel;
  
  factory LoginDataModel.fromJson(Map<String, dynamic> json) => _$LoginDataModelFromJson(json);
}

@freezed
class UserRequestModel with _$UserRequestModel {
  const factory UserRequestModel({
    required String uuid,
    required String tenantId,
    required String name,
    required String mobileNumber,
  }) = _UserRequestModel;

  factory UserRequestModel.fromJson(Map<String, dynamic> json) => _$UserRequestModelFromJson(json);
}
