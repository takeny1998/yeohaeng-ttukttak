import 'dart:io';

import 'package:dio/dio.dart';

sealed class ServerException extends Error {}

final class ServerErrorException extends ServerException {
  final int code;
  final String message;

  ServerErrorException({required this.message, required this.code});
}

final class ServerFailException extends ServerException {
  final Map<String, String> data;

  ServerFailException({required this.data});
}

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

sealed class BusinessException extends Error {}

final class AuthorizationException extends BusinessException {
  final String? message;

  AuthorizationException({this.message});
}
