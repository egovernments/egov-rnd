// ignore_for_file: constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiUrl = dotenv.env["API_URL"] ?? "";
final String localizationUrl = dotenv.env["LOCALIZATION_API_URL"] ?? "";
final String mdmsUrl = dotenv.env["MDMS_URL"] ?? "";
final String loginUrl = dotenv.env["LOGIN_URL"] ?? "";
final int periodicTrackingFrequency = int.parse(dotenv.env["PERIODIC_TRACKING_FREQUENCY"] ?? "10");
final String operatorIdUrl = dotenv.env["OPERATOR_ID_URL"] ?? "";
final String unifiedDevApiUrl = dotenv.env["UNIFIED_DEV_API_URL"] ?? "";

const Map<String, String> cities = {
  "PG": "pg",
  "Amritsar": "pb.amritsar",
  "City A": "pg.citya",
};

final List<String> cityNames = cities.keys.toList();

const String TOKEN = "token";
const String UUID = "uuid";
const String TENANT_ID = "tenantId";
const String OPERATOR_ID = "operatorId";

const List<String> hiveBoxes = ["en_IN", "or_IN", "mdms", "tracker"];
