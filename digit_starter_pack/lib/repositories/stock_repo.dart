import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/stock.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/stock/stock_model.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class StockRemoteRepository {
  StockRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<void> create(HcmStockModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.stock]![ApiOperation.create]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          // 'limit': 100,
          // 'offset': 0
        },
        data: {"Stock": body.toMap()},
      );
    } catch (err) {
      rethrow;
    }
  }
}
