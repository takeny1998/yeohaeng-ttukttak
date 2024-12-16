
import 'package:dio/dio.dart';

final class NetworkException extends Error {
  final int? statusCode;
  final String? statusMessage;

  final Uri requestUri;
  final String requestMethod;

  NetworkException(
      {this.statusCode,
        this.statusMessage,
        required this.requestUri,
        required this.requestMethod});

  static NetworkException fromResponse(Response response) {
    return NetworkException(
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        requestUri: response.requestOptions.uri,
        requestMethod: response.requestOptions.method);
  }
}