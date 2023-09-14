import 'dart:convert';

import 'package:dio/dio.dart';

// ignore: camel_case_types
class api {
  Future<dynamic> get({required String url, String? token}) async {
    final dio = Dio();
    Map<String, String> headers = {};

    if (token == null) {
      headers['Authorization'] = "Bearer $token";
    }
    final response = await dio.get(url, options: Options(headers: headers));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          "there is a problem with status code: ${response.statusCode}");
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    final dio = Dio();
    Map<String, String> headers = {};

    if (token == null) {
      headers['Authorization'] = "Bearer $token";
    }
    final response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      throw Exception(
          "there is a problem with status code: ${response.statusCode}");
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    final dio = Dio();
    Map<String, String> headers = {};
    headers["Content-Length"] = "application/x-www-form-urlencoded";
    if (token == null) {
      headers['Authorization'] = "Bearer $token";
    }
    final response = await dio.put(
      url,
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      throw Exception(
          "there is a problem with status code: ${response.statusCode}");
    }
  }
}
