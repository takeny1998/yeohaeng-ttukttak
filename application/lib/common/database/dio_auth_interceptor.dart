import 'dart:io';

import 'package:application/authentication/client/dto/token_renew/token_renew_request.dart';
import 'package:application/authentication/domain/auth_credentials_state_provider.dart';
import 'package:application/authentication/repository/auth_credentials_repository_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/client/token_client.dart';
import '../../authentication/domain/auth_credentials.dart';

final class DioAuthInterceptor extends Interceptor {
  final AutoDisposeRef _ref;

  final Dio _dio;

  final TokenClient _tokenClient;

  DioAuthInterceptor({required AutoDisposeRef ref, required Dio dio})
      : _ref = ref,
        _dio = dio,
        _tokenClient = TokenClient(dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final credentials =
        await _ref.watch(authCredentialsRepositoryProvider).find();

    if (credentials != null) {
      final AuthCredentials(accessToken: accessToken) = credentials;
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    debugPrint('[DioAuthInterceptor.onRequest] options=${options.headers}');

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;

    final credentialsRepository = _ref.watch(authCredentialsRepositoryProvider);
    final credentials = await credentialsRepository.find();

    if (response == null || credentials == null) return handler.next(err);

    final Response(statusCode: statusCode, data: {'code': errorCode}) =
        response;

    if (statusCode == HttpStatus.unauthorized &&
        errorCode == "AUTHORIZATION_EXPIRED") {

      debugPrint('[DioAuthInterceptor.onError] Expired, try renewing token.');
      await credentialsRepository.delete();

      Response? retriedResponse;

      await _tokenClient.renew(
          TokenRenewRequest(refreshToken: credentials.refreshToken))
      .then((renewedCredentials) async {

        final AuthCredentials(accessToken: accessToken) = renewedCredentials;
        await credentialsRepository.save(renewedCredentials);

        err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
        debugPrint(
            '[DioAuthInterceptor.onError] Renewing token Successfully, options=${err.requestOptions.headers}');

        retriedResponse = await _dio.fetch(err.requestOptions);
      })
      .catchError((err) async {
        debugPrint('[DioAuthInterceptor.onError] Renewing token Failed.');
      });

      _ref.invalidate(authCredentialsStateProvider);

      if (retriedResponse != null) {
        return handler.resolve(retriedResponse!);
      }

    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
