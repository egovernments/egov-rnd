import 'dart:async';
import 'package:dio/dio.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/entities/project_facility.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class ProjectFacilityRemoteRepository {
  ProjectFacilityRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<ProjectFacilityModel>> searchStaff(
      ProjectFacilitySearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.projectFacility]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"projectFacility": body.toMap()},
      );

      final responseMap = (response.data);

      return responseMap;
    } catch (err) {
      rethrow;
    }
  }
}
