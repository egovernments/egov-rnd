import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiUrl = dotenv.env["API_URL"] ?? "";
final String localizationUrl = dotenv.env["LOCALIZATION_API_URL"] ?? "";
final String mdmsUrl = dotenv.env["MDMS_URL"] ?? "";

const Map<String, String> cities = {
  "City A": "pg.citya",
  "City B": "pg.cityb",
  "City C": "pg.cityc",
};

final List<String> cityNames = cities.keys.toList();

const String testUserId = "ccf4998c-e7af-4e4d-a97f-59c51bbf45e5";
const String token = "token";
const String uuid = "uuid";
const String tenantId = "tenantId";
