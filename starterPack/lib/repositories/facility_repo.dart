import 'dart:async';
import 'package:dio/dio.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/facilities/facility.dart';
import 'package:starterPack/repositories/app_init_Repo.dart';

/// Repository handling remote operations related to facilities.
class FacilityRemoteRepository {
  FacilityRemoteRepository();

  final dio = DioClient().dio;

  /// Searches for facilities based on the provided [body] and [actionMap].
  FutureOr<List<FacilityModel>> search(FacilitySearchModel body,
      Map<DataModelType, Map<ApiOperation, String>>? actionMap) async {
    try {
      Response response;
      String searchPath =
          actionMap![DataModelType.facility]![ApiOperation.search]!;

      response = await dio.post(
        searchPath,
        queryParameters: {
          'tenantId': envConfig.variables.tenantId,
          'limit': 100,
          'offset': 0
        },
        data: {"Facility": body.toMap()},
      );

      final responseMap = response.data['Facilities'];

      List<FacilityModel> facilityList = [];
      for (final facility in responseMap) {
        facilityList.add(FacilityModelMapper.fromMap(facility));
      }

      return facilityList;
    } catch (err) {
      rethrow;
    }
  }
}
