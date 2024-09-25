import 'package:application_new/common/exception/exception.dart';
import 'package:application_new/common/http/dto/server_response.dart';
import 'package:application_new/common/log/logger.dart';
import 'package:dio/dio.dart';

final class HttpService {
  final Dio _dio;
  final String? _baseUrl;

  HttpService({required Dio dio, String? baseUrl})
      : _dio = dio,
        _baseUrl = baseUrl;

  Future<Map<String, dynamic>> request(
    String method,
    String uri, {
    Map<String, dynamic>? data,
    String? authorization,
  }) async {
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (authorization != null) {
      header['Authorization'] = 'Bearer $authorization';
    }

    try {
      final response = await _dio.request(
        _baseUrl != null ? _baseUrl + uri : uri,
        data: data,
        options: Options(
          method: method,
          headers: header,
        ),
      );

      if (response.data == null) {
        throw NetworkException(
          code: response.statusCode,
          message: response.statusMessage,
        );
      }

      final serverResponse = ServerResponse.fromJson(response.data);

      return serverResponse.when(
          success: (data) => data,
          fail: (message, data) {
            throw ServerException(message: message);
          },
          error: (message, statusCode) {
            throw NetworkException(code: statusCode, message: message);
          });
    } on DioException catch (e) {
      final res = e.response;

      logger.e('[HttpService.request] exception = $e');

      throw NetworkException(
          code: res?.statusCode, message: res?.statusMessage);
    }
  }
}
