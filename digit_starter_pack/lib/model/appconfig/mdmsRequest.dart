import 'package:freezed_annotation/freezed_annotation.dart';

part 'mdmsRequest.freezed.dart';

part 'mdmsRequest.g.dart';

@freezed
class MdmsRequestModel with _$MdmsRequestModel {
  const factory MdmsRequestModel(
      {@JsonKey(name: 'MdmsCriteria')
          required MdmsCriteriaModel? mdmsCriteria}) = _MdmsRequestModel;

  factory MdmsRequestModel.fromJson(Map<String, Object?> json) =>
      _$MdmsRequestModelFromJson(json);
}

@freezed
class MdmsCriteriaModel with _$MdmsCriteriaModel {
  const factory MdmsCriteriaModel(
          {required String? tenantId,
          required List<MdmsModuleDetailsModel?> moduleDetails}) =
      _MdmsCriteriaModel;

  factory MdmsCriteriaModel.fromJson(Map<String, Object?> json) =>
      _$MdmsCriteriaModelFromJson(json);
}

@freezed
class MdmsModuleDetailsModel with _$MdmsModuleDetailsModel {
  const factory MdmsModuleDetailsModel(
          {required String? moduleName,
          required List<MdmsMasterDetailsModel>? masterDetails}) =
      _MdmsModuleDetailsModel;

  factory MdmsModuleDetailsModel.fromJson(Map<String, Object?> json) =>
      _$MdmsModuleDetailsModelFromJson(json);
}

@freezed
class MdmsMasterDetailsModel with _$MdmsMasterDetailsModel {
  const factory MdmsMasterDetailsModel(String name) = _MdmsMasterDetailsModel;

  factory MdmsMasterDetailsModel.fromJson(Map<String, Object?> json) =>
      _$MdmsMasterDetailsModelFromJson(json);
}
