import 'dart:async';

import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/projects/project.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';

/// Repository handling remote operations related to projects.
class ProjectRemoteRepository {
  ProjectRemoteRepository();

  final dio = DioClient().dio;

  /// Searches for projects based on the provided [body] and [actionMap].
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
