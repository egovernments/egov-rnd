import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_log.dart';
import 'package:attendance_management/models/attendance_register.dart';
import 'package:flutter/material.dart';
import 'package:new_digit_app/data/secure_storage/secureStore.dart';
import 'package:new_digit_app/model/attendance/hcm_attendance_log_model.dart';
import 'package:new_digit_app/model/attendance/hcm_attendance_model.dart';
import 'package:new_digit_app/model/individual/individual.dart';
import 'package:new_digit_app/model/dataModel.dart';
import 'package:new_digit_app/repositories/attendence/attendenceLogsRepo.dart';
import 'package:new_digit_app/repositories/attendence/attendenceRegistersRepo.dart';
import 'package:new_digit_app/repositories/individualSearchRepo.dart';
import 'package:new_digit_app/utils/utils.dart';
import 'package:collection/collection.dart';

class HCMAttendanceBloc extends AttendanceListeners {
  final String? userId;
  final String? individualId;
  final String? projectId;

  //pass the actionMap here so that we can use it for API calls everywhere
  final Map<DataModelType, Map<ApiOperation, String>>? actionMap;

  BuildContext context;

  HCMAttendanceBloc({
    this.actionMap,
    this.individualId,
    this.userId,
    this.projectId,
    required this.context,
  });

  late Function(List<AttendanceRegisterModel> registers) _registersLoaded;

  @override
  void getAttendanceRegisters(
    Function(List<AttendanceRegisterModel> registers) attendanceRegisters,
  ) {
    _registersLoaded = attendanceRegisters;

    return onRegistersLoaded();
  }

  void onRegistersLoaded() async {
    final individualRepository = IndividualSearchRemoteRepository();
    final attendanceLogRepository = AttendanceLogRemoteRepository();

    //fetch individualId from secureStore
    final secureStore = SecureStore();
    final individualId = await secureStore.getSelectedIndividual();

    // _registersLoaded([AttendanceRegisterModel(id: '', name: 'Attendance')]);
    final registers = await AttendenceRemoteRepository().searchRegisters(
        HCMAttendanceSearchModel(staffId: individualId, referenceId: projectId),
        actionMap);

    //create another list attendenceRegister from the list register
    final List<AttendanceRegisterModel> attendanceRegisters =
        await Future.wait(registers.map((e) async {
      ///////////////////////////////optional//////////////////////////////////
      final registerCompletedLogs = await attendanceLogRepository.searchLogs(
        actionMap,
        HCMAttendanceLogSearchModel(
          registerId: e.attendanceRegister.id,
          // uploadToServer: true,
        ),
      );

      var list = generateDateList(
        e.attendanceRegister.startDate!,
        e.attendanceRegister.endDate!,
        registerCompletedLogs ?? [],
        e.attendanceRegister.additionalDetails?["sessions"] != 2,
      );
      ///////////////////////////////////////////////////////////////////////////

      var completedDaysCount =
          e.attendanceRegister.additionalDetails?["sessions"] == 2 ? 0 : 0;

      final individualList = await individualRepository.searchIndividual(
          IndividualSearchModel(
            id: e.attendanceRegister.attendees
                ?.where((att) => (att.denrollmentDate == null ||
                    (att.denrollmentDate ??
                            DateTime.now().millisecondsSinceEpoch) >=
                        DateTime.now().millisecondsSinceEpoch))
                .map((a) => a.individualId!)
                .toList(),
          ),
          actionMap);

      final attendeeList = e.attendanceRegister.attendees
          //filtering the attendees to reduce number of comparisions made with individualList
          ?.where((att) => (att.denrollmentDate == null ||
              (att.denrollmentDate ?? DateTime.now().millisecondsSinceEpoch) >=
                  DateTime.now().millisecondsSinceEpoch))
          .map(
            //only pick those individuals from the individual list who are still enrolled
            (a) => a.copyWith(
              name: individualList
                  .where((i) => i.id == a.individualId)
                  .first
                  .name
                  ?.givenName,
              individualNumber: individualList
                  .where((i) => i.id == a.individualId)
                  .first
                  .individualId,
            ),
          )
          .toList();

      return e.attendanceRegister.copyWith(
        attendees: attendeeList,
        attendanceLog: list,
        // attendanceLog: [],
        completedDays: completedDaysCount,
      );
    }));

    _registersLoaded(
      attendanceRegisters,
    );
  }

  @override
  void searchAttendanceLog(
    SearchAttendanceLog searchAttendanceLog,
  ) async {
    final attendanceLogRemoteRepository = AttendanceLogRemoteRepository();

    final attendanceLogs = await attendanceLogRemoteRepository.searchLogs(
      actionMap,
      HCMAttendanceLogSearchModel(
        registerId: searchAttendanceLog.registerId,
      ),
    );

    final filteredLogs = attendanceLogs
        ?.where((log) {
          final logTime =
              DateTime.fromMillisecondsSinceEpoch(log.attendance!.time!);
          final logDay = DateTime(logTime.year, logTime.month, logTime.day)
              .millisecondsSinceEpoch;
          final currentTime = DateTime.fromMillisecondsSinceEpoch(
            searchAttendanceLog.currentDate,
          );
          final currentDay =
              DateTime(currentTime.year, currentTime.month, currentTime.day)
                  .millisecondsSinceEpoch;

          return logDay == currentDay;
        })
        .map((a) => AttendanceLogModel(
              registerId: a.attendance?.registerId,
              tenantId: a.attendance?.tenantId,
              status: a.attendance?.status,
              time: a.attendance?.time,
              individualId: a.attendance?.individualId,
              id: a.attendance?.id,
              type: a.attendance?.type,
              uploadToServer: a.attendance?.uploadToServer,
            ))
        .toList();
    searchAttendanceLog.onLogLoaded(filteredLogs ?? []);
  }

  @override
  Future<void> submitAttendanceDetails(
    SubmitAttendanceDetails attendanceLogs,
  ) async {
    //////////////////////////////optional/////////////////////////////////
    final attendanceLogRemoteRepository = AttendanceLogRemoteRepository();
    final existingLogs = await attendanceLogRemoteRepository.searchLogs(
      actionMap,
      HCMAttendanceLogSearchModel(
        registerId: attendanceLogs.attendanceLogs.first.registerId,
      ),
    );
    final hcmAttendanceLogs = attendanceLogs.attendanceLogs.map(
      (e) {
        final existingLog = existingLogs?.where(
          (ele) {
            return attendanceLogs.isSingleSession == true
                ? ele.attendance?.individualId == e.individualId &&
                    ele.attendance?.registerId == e.registerId &&
                    ((ele.attendance?.type == 'ENTRY' &&
                            e.type == 'ENTRY' &&
                            ele.attendance?.time == e.time) ||
                        (ele.attendance?.type == 'EXIT' &&
                            e.type == 'EXIT' &&
                            ele.attendance?.time == e.time))
                : ele.attendance?.individualId == e.individualId &&
                        ele.attendance?.registerId == e.registerId &&
                        ele.attendance?.time == e.time &&
                        ele.attendance?.type == e.type &&
                        ele.attendance?.clientReferenceId != null
                    ? true
                    : false;
          },
        ).toList();

        return HCMAttendanceLogModel(
          rowVersion: 1,
          attendance: e.copyWith(
            clientReferenceId: (existingLog ?? []).isNotEmpty
                ? existingLog?.last.attendance?.clientReferenceId
                : IdGen.i.identifier,
          ),
          clientAuditDetails: ClientAuditDetails(
            createdBy: userId.toString(),
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: userId.toString(),
          ),
          auditDetails: AuditDetails(
            createdBy: userId.toString(),
            createdTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedTime: DateTime.now().millisecondsSinceEpoch,
            lastModifiedBy: userId.toString(),
          ),
        );
      },
    ).toList();
    final groupedIndividuals =
        hcmAttendanceLogs.groupListsBy((ele) => ele.attendance?.individualId);

    // for (final log in groupedIndividuals.entries) {
    //   await attendanceLogRemoteRepository.create(
    //     log.value.where((l) => l.attendance?.type == 'ENTRY').last,
    //   );
    //   await attendanceLogRemoteRepository.create(
    //     log.value.where((l) => l.attendance?.type == 'EXIT').last,
    //   );
    // }
    //////////////////////////////////////////////////////////////////////
  }

  @override
  void callSyncMethod() {}

  List<Map<DateTime, bool>> generateDateList(
    int startMillis,
    int endMillis,
    List<HCMAttendanceLogModel> completedLogs,
    bool isSingleSession,
  ) {
    List<Map<DateTime, bool>> dateList = [];

    // Convert milliseconds to DateTime objects
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(startMillis);

    DateTime startDate = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
    );

    DateTime nowTime = DateTime.now();
    DateTime today = DateTime(
      nowTime.year,
      nowTime.month,
      nowTime.day,
      23,
      59,
    );
    endMillis = endMillis < today.millisecondsSinceEpoch
        ? today.millisecondsSinceEpoch
        : endMillis;
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(endMillis);

    DateTime endDateStartTime = DateTime(
      endTime.year,
      endTime.month,
      endTime.day,
    );
    // Iterate over each date and add to the list with value set to true
    for (DateTime date = startDate;
        date.isBefore(endDateStartTime);
        date = date.add(const Duration(days: 1))) {
      bool hasMorningLog = hasLogWithType(completedLogs, date, "ENTRY");
      bool hasEveningLog = hasLogWithType(completedLogs, date, "EXIT");
      dateList.add({
        date: isSingleSession ? hasMorningLog : hasMorningLog && hasEveningLog,
      });
    }

    return dateList;
  }

  bool hasLogWithType(
    List<HCMAttendanceLogModel> logs,
    DateTime date,
    String type,
  ) {
    final elementTime =
        DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

    final logTime = type == 'ENTRY'
        ? DateTime(
            elementTime.year,
            elementTime.month,
            elementTime.day,
            9,
          ).millisecondsSinceEpoch
        : DateTime(
            elementTime.year,
            elementTime.month,
            elementTime.day,
            18,
          ).millisecondsSinceEpoch;

    return logs.any((element) =>
        element.attendance?.time == logTime &&
        element.attendance?.type == type);
  }
}
