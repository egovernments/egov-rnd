import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vehicle_tracker_app/constants.dart';
import 'package:vehicle_tracker_app/util/logout.dart';

import 'secure_storage_service.dart';

class HttpService {
  static Future<Response> postWithFormData(String url, Map<String, dynamic> formData) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'authorization': "Basic ZWdvdi11c2VyLWNsaWVudDo=",
        },
        body: formData,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Response(body: body, statusCode: response.statusCode);
      } else {
        return Response(body: null, statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      log("Error: No internet connection. : ${e.toString()}");
      return const Response(body: null, statusCode: 503);
    } on HttpException catch (e) {
      log("Error: Could not send data to the server. : ${e.toString()}");
      return const Response(body: null, statusCode: 500);
    } on FormatException catch (e) {
      log("Error: Bad response format. : ${e.toString()}");
      return const Response(body: null, statusCode: 400);
    } on Exception catch (e) {
      log(e.toString());
      return const Response(body: null, statusCode: 500);
    }
  }

  static Future<Response> postRequest(String url, Map<String, dynamic> jsonMap) async {
    final token = await SecureStorageService.read("token");
    if (token != null) {
      jsonMap["X-authToken"] = token;
    }

    String body = json.encode(jsonMap);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'X-authToken': await SecureStorageService.read("token") ?? 'null',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Response(body: body, statusCode: response.statusCode);
      } else if (response.statusCode == 401) {
        logout();
        return const Response(body: null, statusCode: 401);
      } else {
        return Response(body: null, statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      log("Error: No internet connection. : ${e.toString()}");
      return const Response(body: null, statusCode: 503);
    } on HttpException catch (e) {
      log("Error: Could not send data to the server. : ${e.toString()}");
      return const Response(body: null, statusCode: 500);
    } on FormatException catch (e) {
      log("Error: Bad response format. : ${e.toString()}");
      return const Response(body: null, statusCode: 400);
    } on Exception catch (e) {
      log(e.toString());
      return const Response(body: null, statusCode: 500);
    }
  }

  static Future<Response> getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'accept': 'application/json',
        'X-authToken': await SecureStorageService.read(TOKEN) ?? 'null',
      });
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Response(body: body, statusCode: response.statusCode);
      } else if (response.statusCode == 401) {
        logout();
        return const Response(body: null, statusCode: 401);
      } else {
        return Response(body: null, statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      log("Error: No internet connection. : ${e.toString()}");
      return const Response(body: null, statusCode: 503);
    } on HttpException catch (e) {
      log("Error: Could not send data to the server. : ${e.toString()}");
      return const Response(body: null, statusCode: 500);
    } on FormatException catch (e) {
      log("Error: Bad response format. : ${e.toString()}");
      return const Response(body: null, statusCode: 400);
    } on Exception catch (e) {
      log(e.toString());
      return const Response(body: null, statusCode: 500);
    }
  }

  static Future<Response> getRequestWithoutToken(String url) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Response(body: body, statusCode: response.statusCode);
      } else {
        return Response(body: null, statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      log("Error: No internet connection. : ${e.toString()}");
      return const Response(body: null, statusCode: 503);
    } on HttpException catch (e) {
      log("Error: Could not send data to the server. : ${e.toString()}");
      return const Response(body: null, statusCode: 500);
    } on FormatException catch (e) {
      log("Error: Bad response format. : ${e.toString()}");
      return const Response(body: null, statusCode: 400);
    } on Exception catch (e) {
      log(e.toString());
      return const Response(body: null, statusCode: 500);
    }
  }

  static Future<Response> putRequest(String url, Map<String, dynamic> jsonMap) async {
    jsonMap["X-authToken"] = await SecureStorageService.read(TOKEN) ?? 'null';
    String body = json.encode(jsonMap);

    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'X-authToken': await SecureStorageService.read("token") ?? 'null',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Response(body: body, statusCode: response.statusCode);
      } else if (response.statusCode == 401) {
        logout();
        return const Response(body: null, statusCode: 401);
      } else {
        return Response(body: null, statusCode: response.statusCode);
      }
    } on SocketException catch (e) {
      log("Error: No internet connection. : ${e.toString()}");
      return const Response(body: null, statusCode: 503);
    } on HttpException catch (e) {
      log("Error: Could not send data to the server. : ${e.toString()}");
      return const Response(body: null, statusCode: 500);
    } on FormatException catch (e) {
      log("Error: Bad response format. : ${e.toString()}");
      return const Response(body: null, statusCode: 400);
    } on Exception catch (e) {
      log(e.toString());
      return const Response(body: null, statusCode: 500);
    }
  }
}
