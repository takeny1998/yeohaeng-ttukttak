import 'package:dio/dio.dart';

import '../exception/network_exception.dart';
import '../log/logger.dart';
import 'http_communicable.dart';

final class DioHttpClient implements HttpCommunicable {
  final Dio dio;

  static final Map<String, String> baseHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  DioHttpClient(this.dio);

  Future<Map<String, dynamic>> _request(
      String method, String uri, HttpRequestOptions? options) async {
    try {
      final response = await dio.request(
        uri,
        queryParameters: options?.queryParameters,
        data: options?.data,
        options: Options(
            headers: {...baseHeaders, ...?options?.headers}, method: method),
      );
      return response.data;
    } on DioException catch (e) {
      final response = e.response;
      logger.e('[DioHttpClient._request] exception = $e');

      if (response == null) {
        throw NetworkException(
            statusMessage: e.message,
            requestUri: e.requestOptions.uri,
            requestMethod: e.requestOptions.method);
      }

      throw NetworkException.fromResponse(response);
    }
  }

  @override
  Future<Map<String, dynamic>> delete(
    String uri, {
    HttpRequestOptions? options,
  }) {
    return _request('DELETE', uri, options);
  }

  @override
  Future<Map<String, dynamic>> get(
    String uri, {
    HttpRequestOptions? options,
  }) {
    return _request('GET', uri, options);
  }

  @override
  Future<Map<String, dynamic>> patch(
    String uri, {
    HttpRequestOptions? options,
  }) {
    return _request('PATCH', uri, options);
  }

  @override
  Future<Map<String, dynamic>> post(
    String uri, {
    HttpRequestOptions? options,
  }) {
    return _request('POST', uri, options);
  }

  @override
  Future<Map<String, dynamic>> put(String uri, {HttpRequestOptions? options}) {
    return _request('PUT', uri, options);
  }
}
