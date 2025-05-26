import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'sharedpreference.dart';

class ApiService {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);
  }

  Future<Map<String, dynamic>> _request(
    String method,
    String endPoint, {
    dynamic data,
    Map<String, String>? extraHeaders,
    bool fullURL = false,
    bool isMultipart = false,
  }) async {
    final String url =
        Uri.parse(endPoint).isAbsolute ? endPoint : '$baseUrl$endPoint';

    String lang = await Sharedpreference.getData(key: 'lang') ?? 'ar';

    final headers = {
      'Lang': lang,
      'Accept': 'application/json',
      ...?extraHeaders,
    };

    final Options options = Options(
      method: method,
      headers: headers,
      contentType:
          isMultipart ? 'multipart/form-data' : Headers.jsonContentType,
    );

    try {
      Response response;
      if (method == 'GET') {
        response = await _dio.get(url, options: options);
      } else {
        response = await _dio.request(url, data: data, options: options);
      }

      _printSuccess(method, url, response);
      return response.data;
    } on DioException catch (e) {
      _printError(method, url, e);
      rethrow;
    }
  }

  void _printSuccess(String method, String url, Response response) {
    debugPrint('\x1B[32m✅ [$method] $url');
    debugPrint('\x1B[32m📦 Status: ${response.statusCode}');
    debugPrint('\x1B[32m📄 Data: ${response.data}');
  }

  void _printError(String method, String url, DioException e) {
    debugPrint('\x1B[31m❌ [$method] $url');
    debugPrint('\x1B[31m📦 Status: ${e.response?.statusCode ?? 'Unknown'}');
    debugPrint('\x1B[31m📄 Error: ${e.response?.data ?? e.message}');
  }

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, String>? headers,
  }) =>
      _request('GET', endPoint, extraHeaders: headers);

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic body,
    Map<String, String>? headers,
    bool fullURL = false,
  }) =>
      _request('POST', endPoint,
          data: body, extraHeaders: headers, fullURL: fullURL);

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required dynamic body,
    Map<String, String>? headers,
  }) =>
      _request('PUT', endPoint, data: body, extraHeaders: headers);

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    Map<String, String>? headers,
  }) =>
      _request('DELETE', endPoint, extraHeaders: headers);

  Future<Map<String, dynamic>> postWithFile({
    required String endPoint,
    required Map<String, String> body,
    required File file,
    required String fileFieldName,
    required String token,
    Map<String, String>? headers,
    bool fullURL = false,
  }) async {
    final formData = FormData.fromMap({
      ...body,
      fileFieldName: await MultipartFile.fromFile(file.path),
    });

    return _request(
      'POST',
      endPoint,
      data: formData,
      extraHeaders: {
        'Authorization': 'Bearer $token',
        ...?headers,
      },
      fullURL: fullURL,
      isMultipart: true,
    );
  }
}
