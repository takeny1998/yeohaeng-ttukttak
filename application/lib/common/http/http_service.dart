import 'dart:ui';

import 'package:application_new/common/exception/business_exception.dart';
import 'package:application_new/common/exception/dto/server_fail_model.dart';
import 'package:application_new/common/exception/server_exception.dart';
import 'package:application_new/common/http/dto/http_method.dart';
import 'package:application_new/common/http/dto/server_response.dart';
import 'package:application_new/common/http/http_communicable.dart';
import 'package:application_new/feature/authentication/model/auth_model.dart';
import 'package:application_new/feature/authentication/repository/auth_repository.dart';
import 'package:application_new/feature/authentication/service/auth_service.dart';

final class HttpService {
  final Locale locale;
  final String? baseUrl;

  final HttpCommunicable httpClient;
  final AuthRepository authRepository;

  HttpService({
    required this.httpClient,
    required this.locale,
    required this.authRepository,
    this.baseUrl,
  });

  Future<Map<String, dynamic>> request(
    HttpMethod method,
    String uri, {
    ServerRequestOptions? options,
  }) async {
    final Map<String, String> headers = {
      'Accept-Language': locale.languageCode,
    };

    if (options == null || options.authorize == true) {
      final authModel = await authRepository.find();

      if (authModel == null) {
        throw AuthorizationException();
      }

      final isExpired = authModel.expiresAt.isBefore(DateTime.now());

      final accessToken = isExpired
          ? await _renewAuth(authModel.refreshToken)
          : authModel.accessToken;

      headers['Authorization'] = 'Bearer $accessToken';
    }

    final requestFn = switch (method) {
      HttpMethod.get => httpClient.get,
      HttpMethod.post => httpClient.post,
      HttpMethod.patch => httpClient.patch,
      HttpMethod.put => httpClient.put,
      HttpMethod.delete => httpClient.delete,
    };

    final data = await requestFn(
      baseUrl != null ? baseUrl! + uri : uri,
      options: HttpRequestOptions(
        headers: headers,
        data: options?.data,
        queryParameters: options?.queryParameters,
      ),
    );

    final serverResponse = ServerResponse.fromJson(data);

    return serverResponse.when(
        success: (data) => data,
        fail: (data) {
          final errors = List.of(data['errors'])
              .map((json) => ServerFailModel.fromJson(json))
              .toList();

          // 인증 관련 에러인 경우 비즈니스 예외로 변환한다.
          for (final error in errors) {
            if (error.code == 'AUTHORIZATION_FAIL') {
              throw AuthorizationException();
            }
          }

          throw ServerFailException(errors: errors);
        },
        error: (code, message) {
          throw ServerErrorException(code: code, message: message);
        });
  }

  Future<String> _renewAuth(String refreshToken) async {
    final authResponse = await request(HttpMethod.post, '/auth/renew',
        options: ServerRequestOptions(
          data: {'refreshToken': refreshToken},
          authorize: false,
        ));

    final renewedAuthModel = AuthModel.fromResponse(authResponse);
    await authRepository.save(renewedAuthModel);

    return renewedAuthModel.accessToken;
  }

  Future<Map<String, dynamic>> get(
    String uri, {
    ServerRequestOptions? options,
  }) =>
      request(HttpMethod.get, uri, options: options);

  Future<Map<String, dynamic>> post(
    String uri, {
    ServerRequestOptions? options,
  }) =>
      request(HttpMethod.post, uri, options: options);

  Future<Map<String, dynamic>> patch(
    String uri, {
    ServerRequestOptions? options,
  }) =>
      request(HttpMethod.patch, uri, options: options);

  Future<Map<String, dynamic>> put(
    String uri, {
    ServerRequestOptions? options,
  }) =>
      request(HttpMethod.put, uri, options: options);

  Future<Map<String, dynamic>> delete(
    String uri, {
    ServerRequestOptions? options,
  }) =>
      request(HttpMethod.delete, uri, options: options);
}

final class ServerRequestOptions {
  final Map<String, dynamic>? data;

  final Map<String, dynamic>? queryParameters;

  final bool authorize;

  ServerRequestOptions(
      {this.data, this.queryParameters, this.authorize = true});
}
