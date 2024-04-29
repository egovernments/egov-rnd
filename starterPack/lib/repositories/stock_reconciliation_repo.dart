import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/stock_reconciliation.dart'; // Importing stock reconciliation model.
import 'package:starterPack/data/remote_client.dart'; // Importing remote client for making HTTP requests.
import 'package:starterPack/model/dataModel.dart'; // Importing data models.
import 'package:starterPack/model/inventory/stock_reconciliation.dart'; // Importing inventory stock reconciliation model.
import 'package:starterPack/repositories/app_init_Repo.dart'; // Importing app initialization repository.

// Repository class for handling remote operations related to stock reconciliations.
class StockReconciliationRemoteRepository {
  StockReconciliationRemoteRepository(); // Constructor.

  final dio = DioClient()
      .dio; // Creating an instance of Dio client for making HTTP requests.

  // Method for searching stock reconciliations based on provided parameters.
  FutureOr<List<HcmStockReconciliationModel>> search(
    StockReconciliationSearchModel
        body, // Stock reconciliation search model to be sent in the request body.
    Map<DataModelType, Map<ApiOperation, String>>?
        actionMap, // Action map for determining API endpoints.
  ) async {
    try {
      Response response; // Response object to store HTTP response.

      // Getting the search path from the action map based on data model type and operation.
      String searchPath =
          actionMap![DataModelType.stockReconciliation]![ApiOperation.search]!;

      // Making a POST request to the search path with query parameters and request body.
      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig
              .variables.tenantId, // Adding tenant ID to query parameters.
          'limit': 100, // Limiting the number of results.
          'offset': 0, // Setting the offset for pagination.
        },
        data: {
          "StockReconciliation": body
              .toMap(), // Converting stock reconciliation search model to map.
        },
      );

      final responseMap = response.data[
          'StockReconciliation']; // Extracting stock reconciliation data from response.

      List<HcmStockReconciliationModel> stockReconciliationList =
          []; // List to store stock reconciliation models.

      // Iterating through response data and mapping it to stock reconciliation models.
      for (final staff in responseMap) {
        stockReconciliationList.add(HcmStockReconciliationModelMapper.fromMap(
            staff)); // Mapping stock reconciliation data to stock reconciliation model.
      }

      return stockReconciliationList; // Returning the list of stock reconciliation models.
    } catch (err) {
      rethrow; // Rethrowing the error for handling at a higher level.
    }
  }

  // Method for creating a stock reconciliation.
  FutureOr<void> create(
    HcmStockReconciliationModel
        body, // Stock reconciliation model to be created.
    Map<DataModelType, Map<ApiOperation, String>>?
        actionMap, // Action map for determining API endpoints.
  ) async {
    try {
      String? searchPath = actionMap![DataModelType.stockReconciliation]![
          ApiOperation.create]; // Getting the create path from the action map.

      // Making a POST request to the create path with query parameters and request body.
      await dio.post(
        searchPath!,
        queryParameters: {
          "tenantId": envConfig.variables.tenantId
        }, // Adding tenant ID to query parameters.
        data: {
          "StockReconciliation": body.toMap()
        }, // Converting stock reconciliation model to map.
      );
    } catch (err) {
      rethrow; // Rethrowing the error for handling at a higher level.
    }
  }
}
