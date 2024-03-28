// // Generated using mason. Do not modify by hand

// import 'dart:async';
// import 'package:attendance_management/models/attendance_log.dart';
// import 'package:dio/dio.dart';
// import 'package:new_digit_app/data/remote_client.dart';
// import 'package:new_digit_app/model/attendance/hcm_attendance_log_model.dart';
// import 'package:new_digit_app/model/dataModel.dart';
// import 'package:new_digit_app/repositories/app_init_Repo.dart';
// import 'package:new_digit_app/repositories/attendence/attendenceRegistersRepo.dart';
// import '../../../utils/constants.dart';

// class AttendanceLogRemoteRepository {
//   String entityName = 'Attendance';

//   AttendanceLogRemoteRepository();

//   FutureOr<List<HCMAttendanceLogModel>> searchLogs(
//     Map<DataModelType, Map<ApiOperation, String>>? actionMap,
//     HCMAttendanceLogSearchModel query, {
//     int? offSet,
//     int? limit,
//   }) async {
//     Response response;
//     final dio = DioClient().dio;
//     final searchPath =
//         actionMap![DataModelType.attendance]![ApiOperation.search];

//     response = await dio.post(
//       searchPath!,
//       queryParameters: query.clientReferenceId != null &&
//               (query.clientReferenceId ?? []).isNotEmpty
//           ? {
//               'tenantId': envConfig.variables.tenantId,
//             }
//           : {
//               'tenantId': envConfig.variables.tenantId,
//               ...query.toMap(),
//             },
//       data: query.clientReferenceId != null &&
//               (query.clientReferenceId ?? []).isNotEmpty
//           ? {
//               EntityPlurals.getPluralForEntityName(entityName): query.toMap(),
//             }
//           : {},
//     );

//     final responseMap = (response.data);

//     if (responseMap is! Map<String, dynamic>) {
//       throw InvalidApiResponseException(
//         data: query.toMap(),
//         path: searchPath,
//         response: responseMap,
//       );
//     }

//     if (!responseMap.containsKey(
//       EntityPlurals.getPluralForEntityName(entityName),
//     )) {
//       throw InvalidApiResponseException(
//         data: query.toMap(),
//         path: searchPath,
//         response: responseMap,
//       );
//     }

//     final entityResponse =
//         await responseMap[EntityPlurals.getPluralForEntityName(entityName)];

//     if (entityResponse is! List) {
//       throw InvalidApiResponseException(
//         data: query.toMap(),
//         path: searchPath,
//         response: responseMap,
//       );
//     }

//     final entityList = entityResponse.whereType<Map<String, dynamic>>();

//     return entityList
//         .map((e) => HCMAttendanceLogModel(
//               attendance: AttendanceLogModelMapper.fromMap(e),
//               auditDetails: AuditDetailsMapper.fromMap(e['auditDetails']),
//               clientAuditDetails:
//                   ClientAuditDetailsMapper.fromMap(e['clientAuditDetails']),
//             ))
//         .toList();
//   }
// }
