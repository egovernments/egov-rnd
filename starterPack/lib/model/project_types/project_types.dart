import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_types.freezed.dart';
part 'project_types.g.dart';

@freezed
class ProjectTypePrimaryWrapper with _$ProjectTypePrimaryWrapper {
  const factory ProjectTypePrimaryWrapper({
    @JsonKey(name: "HCM-PROJECT-TYPES")
    final ProjectTypesSecondaryModel? projectTypeWrapper,
  }) = _ProjectTypePrimaryWrapper;

  factory ProjectTypePrimaryWrapper.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypePrimaryWrapperFromJson(json);
}

@freezed
class ProjectTypesSecondaryModel with _$ProjectTypesSecondaryModel {
  const factory ProjectTypesSecondaryModel({
    @JsonKey(name: 'projectTypes') @Default([]) List<ProjectType> projectTypes,
  }) = _ProjectTypesSecondaryModel;

  factory ProjectTypesSecondaryModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypesSecondaryModelFromJson(json);
}

@freezed
class ProjectType with _$ProjectType {
  const factory ProjectType({
    required String id,
    required String code,
    required String name,
    required String group,
    required String beneficiaryType,
    String? observationStrategy,
    List<Cycle>? cycles,
    List<ProductVariantsModel>? resources,
    int? validMinAge,
    int? validMaxAge,
  }) = _ProjectType;

  factory ProjectType.fromJson(Map<String, dynamic> json) =>
      _$ProjectTypeFromJson(json);
}

@freezed
class Cycle with _$Cycle {
  const factory Cycle({
    String? mandatoryWaitSinceLastCycleInDays,
    int? startDate,
    int? endDate,
    @Default(0) int id,
    @JsonKey(name: 'deliveries') List<DeliveryModel>? deliveries,
  }) = _Cycle;
  factory Cycle.fromJson(Map<String, dynamic> json) => _$CycleFromJson(json);
}

@freezed
class DeliveryModel with _$DeliveryModel {
  const factory DeliveryModel({
    List<DoseCriteriaModel>? doseCriteria,
    @JsonKey(name: 'mandatoryWaitSinceLastDeliveryInDays')
    String? mandatoryWaitSinceLastDeliveryInDays,
    @JsonKey(name: 'deliveryStrategy') String? deliveryStrategy,
    @Default(0) int id,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, dynamic> json) =>
      _$DeliveryModelFromJson(json);
}

@freezed
class DoseCriteriaModel with _$DoseCriteriaModel {
  const factory DoseCriteriaModel({
    @JsonKey(name: 'condition') String? condition,
    @JsonKey(name: 'ProductVariants')
    List<ProductVariantsModel>? productVariants,
  }) = _DoseCriteriaModel;

  factory DoseCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$DoseCriteriaModelFromJson(json);
}

@freezed
class ProductVariantsModel with _$ProductVariantsModel {
  const factory ProductVariantsModel({
    String? productVariantId,
    int? quantity,
  }) = _ProductVariantsModel;
  factory ProductVariantsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductVariantsModelFromJson(json);
}
