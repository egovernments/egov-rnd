import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/product_variant.dart';
import 'package:starterPack/data/remote_client.dart'; // Importing remote client for making API requests
import 'package:starterPack/model/dataModel.dart'; // Importing data models
import 'package:starterPack/repositories/app_init_Repo.dart'; // Importing repository for app initialization

// Repository class for handling remote operations related to product variants
class ProductVariantRemoteRepository {
  ProductVariantRemoteRepository();

  final dio = DioClient().dio; // Using DioClient for making HTTP requests

  // Method for searching product variants based on the provided search parameters
  FutureOr<List<ProductVariantModel>> search(ProductVariantSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath = actionMap![DataModelType.productVariant]![
          ApiOperation.search]!; // Getting the search path from actionMap

      // Making a POST request to the search path
      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId, // Adding query parameters
          'limit': 100,
          'offset': 0
        },
        data: {
          "ProductVariant": body.toMap()
        }, // Sending search parameters in the request body
      );

      final responseMap =
          response.data['ProductVariant']; // Extracting response data

      final List<ProductVariantModel> projectResourcesList = [];
      for (final pr in responseMap) {
        projectResourcesList.add(ProductVariantModelMapper.fromMap(
            pr)); // Mapping response data to ProductVariantModel objects
      }

      return projectResourcesList; // Returning list of product variants
    } catch (err) {
      rethrow; // Rethrowing the error
    }
  }
}
