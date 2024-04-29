import 'dart:async';

import 'package:attendance_management/models/attendance_register.dart';
import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/attendance/hcm_attendance_model.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';
import 'package:starterPack/utils/constants.dart';

class AttendenceRemoteRepository {
  final entityName = 'AttendanceRegister';
  AttendenceRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<HCMAttendanceRegisterModel>> searchRegisters(
      HCMAttendanceSearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    Response response;
    String searchPath =
        actionMap![DataModelType.attendanceRegister]![ApiOperation.search]!;
    response = await dio.post(
      searchPath,
      queryParameters: {
        'tenantId': envConfig.variables.tenantId,
        // ...body.toMap(),
        'staffId': body.staffId
      },
      data: {},
    );

    final responseMap = (response.data);

    if (responseMap is! Map<String, dynamic>) {
      throw InvalidApiResponseException(
        data: body.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    if (!responseMap.containsKey(
      EntityPlurals.getPluralForEntityName(entityName),
    )) {
      throw InvalidApiResponseException(
        data: body.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityResponse =
        await responseMap[EntityPlurals.getPluralForEntityName(entityName)];

    if (entityResponse is! List) {
      throw InvalidApiResponseException(
        data: body.toMap(),
        path: searchPath,
        response: responseMap,
      );
    }

    final entityList = entityResponse.whereType<Map<String, dynamic>>();

    return entityList.map((e) {
      final attendanceRegister = AttendanceRegisterModelMapper.fromMap(e);

      return HCMAttendanceRegisterModel(
        attendanceRegister: attendanceRegister,
      );
    }).toList();
  }
}

class InvalidApiResponseException implements Exception {
  final String path;
  final Map<String, dynamic> data;
  final dynamic response;

  const InvalidApiResponseException({
    required this.path,
    required this.data,
    required this.response,
  });
}
