import 'dart:async';

import 'package:referral_reconciliation/models/entities/h_f_referral.dart';
import 'package:starterPack/data/remote_client.dart';
import 'package:starterPack/model/dataModel.dart';
import 'package:starterPack/model/referral/referral.dart';

class ReferralReconciliationRemoteRepository {
  ReferralReconciliationRemoteRepository();

  final client = DioClient().dio;

  FutureOr<List<HcmHFReferralModel>> search(
    HFReferralSearchModel body,
    Map<DataModelType, Map<ApiOperation, String>>? actionMap,
  ) async {
    final searchPath =
        actionMap![DataModelType.hFReferral]![ApiOperation.search];
    try {
      final response = await client.post(
        searchPath!,
        queryParameters: {
          'tenantId': 'mz',
          'limit': 100,
          'offset': 0,
        },
        data: {
          "HFReferral": body.toMap(),
        },
      );

      final responseMap = response.data['HFReferrals'];

      final referralList = <HcmHFReferralModel>[];

      for (final referral in responseMap) {
        referralList.add(HcmHFReferralModelMapper.fromMap(referral));
      }

      return referralList;
    } catch (err) {
      rethrow;
    }
  }

  FutureOr<void> create(
    HcmHFReferralModel body,
    Map<DataModelType, Map<ApiOperation, String>>? actionMap,
  ) async {
    final createPath =
        actionMap![DataModelType.hFReferral]![ApiOperation.create];
    try {
      await client.post(
        createPath!,
        queryParameters: {
          'tenantId': 'mz',
        },
        data: {
          "HFReferral": body.toMap(),
        },
      );
    } catch (err) {
      rethrow;
    }
  }
}
