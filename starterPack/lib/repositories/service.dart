import 'package:referral_reconciliation/models/entities/referral_recon_service.dart';
import 'package:referral_reconciliation/referral_reconciliation.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/dataModel.dart';

class ServiceRemoteRepository {
  Future<List<ReferralReconServiceModel>> fetchServices(
      Map<DataModelType, Map<ApiOperation, String>> actionMap,
      ReferralReconServiceSearchModel body) async {
    final client = DioClient().dio;
    // Fetch data from API

    final searchPath = actionMap[DataModelType.service]![ApiOperation.search];
    final response = await client.post(
      searchPath!,
      data: {
        'Service': body.toMap(),
      },
      queryParameters: {
        'tenantId': 'mz',
        'limit': 100,
        'offset': 0,
      },
    );
    final responseMap = response.data['Service'];

    List<ReferralReconServiceModel> serviceList = [];
    for (final service in responseMap) {
      serviceList.add(ReferralReconServiceModelMapper.fromMap(service));
    }

    return serviceList;
  }

  Future<List<ReferralReconServiceDefinitionModel>> fetchServiceDefinitions(
      Map<DataModelType, Map<ApiOperation, String>> actionMap,
      ReferralReconServiceDefinitionSearchModel body) async {
    final client = DioClient().dio;
    // Fetch data from API
    final searchPath =
        actionMap[DataModelType.serviceDefinition]![ApiOperation.search];
    final response = await client.post(
      searchPath!,
      data: {
        'ServiceDefinitionCriteria': body.toMap(),
      },
      queryParameters: {
        'tenantId': 'mz',
        'limit': 100,
        'offset': 0,
      },
    );
    final responseMap = response.data['ServiceDefinitions'];

    List<ReferralReconServiceDefinitionModel> serviceDefinitionList = [];
    for (final serviceDefinition in responseMap) {
      serviceDefinitionList.add(
          ReferralReconServiceDefinitionModelMapper.fromMap(serviceDefinition));
    }

    return serviceDefinitionList;
  }

  Future<void> create(Map<DataModelType, Map<ApiOperation, String>> actionMap,
      ReferralReconServiceModel body) async {
    final client = DioClient().dio;

    final createPath =
        actionMap[DataModelType.serviceDefinition]![ApiOperation.create];

    await client.post(
      createPath!,
      data: {
        'ServiceDefinition': body.toMap(),
      },
      queryParameters: {
        'tenantId': 'mz',
      },
    );
  }
}
