import 'dart:ui';

import 'package:application_new/common/exception/exception.dart';
import 'package:application_new/common/http/dto/server_response.dart';
import 'package:application_new/common/log/logger.dart';
import 'package:dio/dio.dart';

final class HttpService {
  final Dio _dio;
  final Locale _locale;
  final String? _baseUrl;

  HttpService({required Dio dio, required Locale locale, String? baseUrl})
      : _dio = dio,
        _locale = locale,
        _baseUrl = baseUrl;

  Future<Map<String, dynamic>> request(
    String method,
    String uri, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? data,
    String? authorization,
  }) async {
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Language': _locale.languageCode
    };

    if (authorization != null) {
      header['Authorization'] = 'Bearer $authorization';
    }

    try {
      final response = await _dio.request(
        _baseUrl != null ? _baseUrl + uri : uri,
        queryParameters: queryParams,
        data: data,
        options: Options(
          method: method,
          headers: header,
        ),
      );

      final serverResponse = ServerResponse.fromJson(response.data);

      return serverResponse.when(
          success: (data) => data,
          fail: (data) {
            throw ServerFailException(data: data);
          },
          error: (message, statusCode) {
            if (statusCode == 401) {
              throw AuthorizationException(message: message);
            }

            throw ServerErrorException(message: message, code: statusCode);
          });
    } on DioException catch (e) {
      final response = e.response;
      logger.e('[HttpService.request] exception = $e');

      if (response == null) {

        throw NetworkException(
            statusMessage: e.message,
            requestUri: e.requestOptions.uri, requestMethod: e.requestOptions.method);
      }

      throw NetworkException.fromResponse(response);
    }
  }
}
