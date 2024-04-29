import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/individual/individual.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';
import 'package:starterPack/repositories/attendence/attendenceRegistersRepo.dart';

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
