import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/individual/individual.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';
import 'package:new_digit_app/repositories/attendence/attendenceRegistersRepo.dart';
import 'package:new_digit_app/utils/constants.dart';

class IndividualSearchRemoteRepository {
  final entityName = 'Individual';
  IndividualSearchRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<IndividualModel>> searchIndividual(IndividualSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.individual]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"Individual": body.toMap()},
      );

      final responseMap = (response.data);

      if (responseMap is! Map<String, dynamic>) {
        throw InvalidApiResponseException(
          data: body.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      // if (!responseMap.containsKey(
      //   EntityPlurals.getPluralForEntityName(entityName),
      // )) {
      //   throw InvalidApiResponseException(
      //     data: body.toMap(),
      //     path: searchPath,
      //     response: responseMap,
      //   );
      // }

      // final entityResponse =
      //     await responseMap[EntityPlurals.getPluralForEntityName(entityName)];

      final entityResponse = await responseMap[entityName];

      if (entityResponse is! List) {
        throw InvalidApiResponseException(
          data: body.toMap(),
          path: searchPath,
          response: responseMap,
        );
      }

      final entityList = entityResponse.whereType<Map<String, dynamic>>();

      return entityList
          .map((e) => IndividualModelMapper.fromMap(e)
              // attendanceRegister: AttendanceRegisterModelMapper.fromMap(e),
              )
          .toList();
    } catch (err) {
      log("${err}error is in individual repo");
      rethrow;
    }
  }
}
