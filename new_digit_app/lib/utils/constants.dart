import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:new_digit_app/data/nosql/localization.dart';
import 'package:path_provider/path_provider.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class Constants {
  late Future<Isar> _isar;
  late String _version;
  static final Constants _instance = Constants._();

  Constants._() {
    _isar = openIsar();
  }
  factory Constants() {
    return _instance;
  }

  // Future initialize(version) async {
  //   await _initializeIsar(version);
  // }

  // Future<void> _initializeIsar(version) async {
  //   _isar = Constants().isar;
  //   final isar = await _isar;
  //   _version = version;
  // }

  Future<Isar> get isar {
    return _isar;
  }

  String get version {
    return _version;
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final directory = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          LocalizationWrapperSchema,
        ],
        name: 'HCM',
        inspector: true,
        directory: directory.path,
      );
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  static const String localizationApiPath = 'localization/messages/v1/_search';
}

class RequestInfoData {
  static const String apiId = 'hcm';
  static const String ver = '.01';
  static num ts = DateTime.now().millisecondsSinceEpoch;
  static const did = "1";
  static const key = "1";
  static String? authToken;
}

class EntityPlurals {
  static String getPluralForEntityName(String entity) {
    switch (entity) {
      case 'Beneficiary':
        return 'Beneficiaries';
      case 'ProjectBeneficiary':
        return 'ProjectBeneficiaries';
      case 'Address':
        return 'Addresses';
      case 'Facility':
        return 'Facilities';
      case 'ProjectFacility':
        return 'ProjectFacilities';
      case 'Project':
        return 'Projects';
      case 'Stock':
        return 'Stock';
      case 'StockReconciliation':
        return 'StockReconciliation';
      case 'User':
        return 'user';
      case 'AttendanceRegister':
        return 'attendanceRegister';
      case 'Attendance':
        return 'attendance';
      default:
        return '${entity}s';
    }
  }
}
