import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ricky_and_mory_app/app_export.dart';

abstract class HttpMethods {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
  static const String put = 'PUT';
}

class HttpManager {
  final Dio _dio;
  HttpManager(this._dio);

  Future<HttpResponse<T>> request<T>({
    required String path,
    String method = 'GET',
    Map? headers,
    String? baseUrl,
    String? contentType,
    Map? body,
    Map<String, dynamic>? formData,
    T Function(dynamic data)? parser,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-type': 'application/json',
      });

    log('${AppConstants.apiUrl}$path');
    try {
      final response = await _dio.request(
        '${AppConstants.apiUrl}$path',
        options: Options(
          method: method,
          contentType: contentType,
          headers: defaultHeaders,
        ),
        data: formData != null ? FormData.fromMap(formData) : body,
      );
      if (parser != null) {
        return HttpResponse.success<T>(parser(response.data));
      }
      return HttpResponse.success<T>(response.data);
    } catch (e) {
      var statusCode = 0;
      var message = 'Falha.';
      dynamic data;
      ResultError? resultError;
      if (e is DioException) {
        statusCode = -1;
        message = e.message!;
        try {
          resultError = ResultError.fromJson(e.response!.data!);
        } catch (ef0) {
          debugPrint(ef0.toString());
        }
        if (e.response != null) {
          if (resultError != null) {
            message = resultError.error;
          } else {
            statusCode = e.response!.statusCode!;
            message = e.response!.statusMessage!;
          }
          data = e.response!.data;
        }
      }

      return HttpResponse.fail<T>(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }
}
