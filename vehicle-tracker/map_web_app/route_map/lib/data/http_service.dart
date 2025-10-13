import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HttpService {
  static Future<Response> getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
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

  static Future<Response> postRequestWithoutToken(String url, Map<String, dynamic> jsonMap) async {
    String body = json.encode(jsonMap);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        return Response(body: body, statusCode: response.statusCode);
      } else {
        log("Error: ${response.statusCode}");
        log("Error: ${response.body}");
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

  static Future<Response> putRequestWithoutToken(String url, Map<String, dynamic> jsonMap) async {
    String body = json.encode(jsonMap);

    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
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
}
