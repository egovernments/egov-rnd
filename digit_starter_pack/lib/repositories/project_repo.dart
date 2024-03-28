import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:new_digit_app/data/remote_client.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/model/projects/project.dart';
import 'package:new_digit_app/repositories/app_init_Repo.dart';

class ProjectRemoteRepository {
  ProjectRemoteRepository();

  final dio = DioClient().dio;

  FutureOr<List<ProjectModel>> search(List<ProjectSearchModel> body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.project]![ApiOperation.search]!;

      response = await dio.post(searchPath, queryParameters: {
        'tenantId': envConfig.variables.tenantId,
        'limit': 100,
        'offset': 0
      }, data: {
        'Projects': body.map((e) => e.toMap()).toList()
      });

      final responseMap = response.data['Project'];

      List<ProjectModel> projectsList = [];
      for (final project in responseMap) {
        projectsList.add(ProjectModelMapper.fromMap(project));
      }

      return projectsList;
    } catch (err) {
      rethrow;
    }
  }
}
