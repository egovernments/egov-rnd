// ignore_for_file: constant_identifier_names

import 'dart:ui';

import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiUrl = dotenv.env["API_URL"] ?? "";
final String mdmsUrl = dotenv.env["MDMS_URL"] ?? "";
final int periodicTrackingFrequency = int.parse(dotenv.env["PERIODIC_TRACKING_FREQUENCY"] ?? "10");
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
const String NAME = "name";
const String MOBILE_NUMBER = "mobileNumber";

const List<String> hiveBoxes = ["en_IN", "or_IN", "mdms", "tracker", "user"];

const ENG_LOCALE = Locale("en", "IN");
const ORI_LOCALE = Locale("or", "IN");