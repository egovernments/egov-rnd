// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectTypePrimaryWrapperImpl _$$ProjectTypePrimaryWrapperImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTypePrimaryWrapperImpl(
      projectTypeWrapper: json['HCM-PROJECT-TYPES'] == null
          ? null
          : ProjectTypesSecondaryModel.fromJson(
              json['HCM-PROJECT-TYPES'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectTypePrimaryWrapperImplToJson(
        _$ProjectTypePrimaryWrapperImpl instance) =>
    <String, dynamic>{
      'HCM-PROJECT-TYPES': instance.projectTypeWrapper,
    };

_$ProjectTypesSecondaryModelImpl _$$ProjectTypesSecondaryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectTypesSecondaryModelImpl(
      projectTypes: (json['projectTypes'] as List<dynamic>?)
              ?.map((e) => ProjectType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProjectTypesSecondaryModelImplToJson(
        _$ProjectTypesSecondaryModelImpl instance) =>
    <String, dynamic>{
      'projectTypes': instance.projectTypes,
    };

_$ProjectTypeImpl _$$ProjectTypeImplFromJson(Map<String, dynamic> json) =>
    _$ProjectTypeImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      group: json['group'] as String,
      beneficiaryType: json['beneficiaryType'] as String,
      observationStrategy: json['observationStrategy'] as String?,
      cycles: (json['cycles'] as List<dynamic>?)
          ?.map((e) => Cycle.fromJson(e as Map<String, dynamic>))
          .toList(),
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => ProductVariantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      validMinAge: (json['validMinAge'] as num?)?.toInt(),
      validMaxAge: (json['validMaxAge'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectTypeImplToJson(_$ProjectTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'group': instance.group,
      'beneficiaryType': instance.beneficiaryType,
      'observationStrategy': instance.observationStrategy,
      'cycles': instance.cycles,
      'resources': instance.resources,
      'validMinAge': instance.validMinAge,
      'validMaxAge': instance.validMaxAge,
    };

_$CycleImpl _$$CycleImplFromJson(Map<String, dynamic> json) => _$CycleImpl(
      mandatoryWaitSinceLastCycleInDays:
          json['mandatoryWaitSinceLastCycleInDays'] as String?,
      startDate: (json['startDate'] as num?)?.toInt(),
      endDate: (json['endDate'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt() ?? 0,
      deliveries: (json['deliveries'] as List<dynamic>?)
          ?.map((e) => DeliveryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CycleImplToJson(_$CycleImpl instance) =>
    <String, dynamic>{
      'mandatoryWaitSinceLastCycleInDays':
          instance.mandatoryWaitSinceLastCycleInDays,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'id': instance.id,
      'deliveries': instance.deliveries,
    };

_$DeliveryModelImpl _$$DeliveryModelImplFromJson(Map<String, dynamic> json) =>
    _$DeliveryModelImpl(
      doseCriteria: (json['doseCriteria'] as List<dynamic>?)
          ?.map((e) => DoseCriteriaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      mandatoryWaitSinceLastDeliveryInDays:
          json['mandatoryWaitSinceLastDeliveryInDays'] as String?,
      deliveryStrategy: json['deliveryStrategy'] as String?,
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$DeliveryModelImplToJson(_$DeliveryModelImpl instance) =>
    <String, dynamic>{
      'doseCriteria': instance.doseCriteria,
      'mandatoryWaitSinceLastDeliveryInDays':
          instance.mandatoryWaitSinceLastDeliveryInDays,
      'deliveryStrategy': instance.deliveryStrategy,
      'id': instance.id,
    };

_$DoseCriteriaModelImpl _$$DoseCriteriaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DoseCriteriaModelImpl(
      condition: json['condition'] as String?,
      productVariants: (json['ProductVariants'] as List<dynamic>?)
          ?.map((e) => ProductVariantsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DoseCriteriaModelImplToJson(
        _$DoseCriteriaModelImpl instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'ProductVariants': instance.productVariants,
    };

_$ProductVariantsModelImpl _$$ProductVariantsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductVariantsModelImpl(
      productVariantId: json['productVariantId'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProductVariantsModelImplToJson(
        _$ProductVariantsModelImpl instance) =>
    <String, dynamic>{
      'productVariantId': instance.productVariantId,
      'quantity': instance.quantity,
    };
