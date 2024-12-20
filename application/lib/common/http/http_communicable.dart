import 'package:application_new/common/http/dio_http_client.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_communicable.g.dart';

final class HttpRequestOptions {
  final Object? data;
  final Map<String, dynamic>? queryParameters;
  final Map<String, String>? headers;

  HttpRequestOptions({this.data, this.queryParameters, this.headers});
}


abstract interface class HttpCommunicable {
  Future<Map<String, dynamic>> post(
    String uri, {
    HttpRequestOptions? options,
  });

  Future<Map<String, dynamic>> get(
    String uri, {
    HttpRequestOptions? options,
  });

  Future<Map<String, dynamic>> patch(
    String uri, {
    HttpRequestOptions? options,
  });

  Future<Map<String, dynamic>> put(
    String uri, {
    HttpRequestOptions? options,
  });

  Future<Map<String, dynamic>> delete(
    String uri, {
    HttpRequestOptions? options,
  });
}

@Riverpod(keepAlive: true)
HttpCommunicable httpCommunicable(HttpCommunicableRef ref) {
  return DioHttpClient(Dio());
}