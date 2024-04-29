import 'dart:async';
import 'package:dio/dio.dart';
import 'package:inventory_management/models/entities/project_resource.dart'; // Importing project resource model.
import 'package:starterPack/data/remote_client.dart'; // Importing remote client for making HTTP requests.
import 'package:starterPack/model/dataModel.dart'; // Importing data models.
import 'package:starterPack/repositories/app_init_Repo.dart'; // Importing app initialization repository.

// Repository class for handling remote operations related to project resources.
class ProjectResourceRemoteRepository {
  ProjectResourceRemoteRepository(); // Constructor.

  final dio = DioClient()
      .dio; // Creating an instance of Dio client for making HTTP requests.

  // Method for searching project resources based on provided parameters.
  FutureOr<List<ProjectResourceModel>> search(
    ProjectResourceSearchModel
        body, // Project resource search model to be sent in the request body.
    Map<DataModelType, Map<ApiOperation, String>>?
        actionMap, // Action map for determining API endpoints.
  ) async {
    try {
      Response response; // Response object to store HTTP response.

      // Getting the search path from the action map based on data model type and operation.
      String searchPath =
          actionMap![DataModelType.projectResource]![ApiOperation.search]!;

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
          "ProjectResource":
              body.toMap(), // Converting project resource search model to map.
        },
      );

      final responseMap = response.data[
          'ProjectResources']; // Extracting project resource data from response.

      List<ProjectResourceModel> projectResourcesList =
          []; // List to store project resource models.

      // Iterating through response data and mapping it to project resource models.
      for (final pr in responseMap) {
        projectResourcesList.add(ProjectResourceModelMapper.fromMap(
            pr)); // Mapping project resource data to project resource model.
      }

      return projectResourcesList; // Returning the list of project resource models.
    } catch (err) {
      print(err); // Printing the error for debugging purposes.
      rethrow; // Rethrowing the error for handling at a higher level.
    }
  }
}
