// GENERATED using mason_cli

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:inventory_management/models/entities/project_resource.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/repositories/product_variants_repo.dart';
import 'package:starterPack/repositories/project_resource_repo.dart';

part 'product_variants_composite.freezed.dart';

// Type definition for emitter used in ProductVariantCompositeBloc
typedef ProductVariantCompositeEmitter = Emitter<ProductVariantCompositeState>;

// Bloc responsible for handling composite operations related to product variants
class ProductVariantCompositeBloc
    extends Bloc<ProductVariantCompositeEvent, ProductVariantCompositeState> {
  // Constructor for ProductVariantCompositeBloc
  ProductVariantCompositeBloc(super.initialState) {
    on(_handleLoad);
  }

  // Handler for loading product variants
  FutureOr<void> _handleLoad(
    ProductVariantCompositeLoadEvent event,
    ProductVariantCompositeEmitter emit,
  ) async {
    // Emit loading state
    emit(const ProductVariantCompositeLoadingState());

    // Fetch project resources
    final projectResources = await ProjectResourceRemoteRepository()
        .search(event.query, event.actionMap);

    // Fetch product variants based on project resources
    final variants = await ProductVariantRemoteRepository().search(
      ProductVariantSearchModel(
        id: projectResources.map((e) {
          return e.resource.productVariantId;
        }).toList(),
      ),
      event.actionMap,
    );

    // Check if variants are empty and emit corresponding state
    if (variants.isEmpty) {
      emit(const ProductVariantCompositeEmptyState());
    } else {
      emit(ProductVariantCompositeFetchedState(productVariants: variants));
    }
  }
}

// Freezed union for product variant composite events
@freezed
class ProductVariantCompositeEvent with _$ProductVariantCompositeEvent {
  const factory ProductVariantCompositeEvent.load(
          {required ProjectResourceSearchModel query,
          required Map<DataModelType, Map<ApiOperation, String>>? actionMap}) =
      ProductVariantCompositeLoadEvent;
}

// Freezed union for product variant composite states
@freezed
class ProductVariantCompositeState with _$ProductVariantCompositeState {
  const factory ProductVariantCompositeState.loading() =
      ProductVariantCompositeLoadingState;

  const factory ProductVariantCompositeState.empty() =
      ProductVariantCompositeEmptyState;

  const factory ProductVariantCompositeState.fetched({
    required List<ProductVariantModel> productVariants,
  }) = ProductVariantCompositeFetchedState;
}
