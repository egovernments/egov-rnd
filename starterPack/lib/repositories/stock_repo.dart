import 'dart:async';
import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart'; // Importing remote client for making HTTP requests.
import 'package:starterPack/model/dataModel.dart'; // Importing data models.
import 'package:starterPack/model/stock/stock_model.dart'; // Importing stock model.
import 'package:starterPack/repositories/app_init_Repo.dart'; // Importing app initialization repository.

// Repository class for handling remote operations related to stock.
class StockRemoteRepository {
  StockRemoteRepository(); // Constructor.

  final dio = DioClient()
      .dio; // Creating an instance of Dio client for making HTTP requests.

  // Method for creating a stock entry.
  FutureOr<void> create(
    HcmStockModel body, // Stock model to be created.
    Map<DataModelType, Map<ApiOperation, String>>?
        actionMap, // Action map for determining API endpoints.
  ) async {
    try {
      // Getting the create path from the action map based on data model type and operation.
      String searchPath =
          actionMap![DataModelType.stock]![ApiOperation.create]!;

      // Making a POST request to the create path with query parameters and request body.
      await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig
              .variables.tenantId, // Adding tenant ID to query parameters.
        },
        data: {"Stock": body.toMap()}, // Converting stock model to map.
      );
    } catch (err) {
      rethrow; // Rethrowing the error for handling at a higher level.
    }
  }

  // Method for searching stocks based on provided parameters.
  FutureOr<List<HcmStockModel>> search(
    HcmStockSearchModel
        body, // Stock search model to be sent in the request body.
    Map<DataModelType, Map<ApiOperation, String>>?
        actionMap, // Action map for determining API endpoints.
  ) async {
    try {
      Response response; // Response object to store HTTP response.

      // Getting the search path from the action map based on data model type and operation.
      String searchPath =
          actionMap![DataModelType.stock]![ApiOperation.search]!;

      // Making a POST request to the search path with query parameters and request body.
      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig
              .variables.tenantId, // Adding tenant ID to query parameters.
          'limit': 100, // Limiting the number of results.
          'offset': 0, // Setting the offset for pagination.
        },
        data: {"Stock": body.toMap()}, // Converting stock search model to map.
      );

      final responseMap =
          response.data['Stock']; // Extracting stock data from response.

      List<HcmStockModel> stockList = []; // List to store stock models.

      // Iterating through response data and mapping it to stock models.
      for (final stock in responseMap) {
        stockList.add(HcmStockModelMapper.fromMap(
            stock)); // Mapping stock data to stock models.
      }
      print(stockList); // Printing the list of stock models.

      return stockList; // Returning the list of stock models.
    } catch (err) {
      rethrow; // Rethrowing the error for handling at a higher level.
    }
  }
}
