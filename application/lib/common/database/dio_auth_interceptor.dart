import 'dart:io';

import 'package:application/authentication/domain/auth_credentials_state_provider.dart';
import 'package:application/authentication/repository/auth_credentials_repository_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../authentication/domain/auth_credentials.dart';

final class DioAuthInterceptor extends Interceptor {
  final AutoDisposeRef _ref;

  final Dio _dio;

  DioAuthInterceptor({required AutoDisposeRef ref, required Dio dio})
      : _ref = ref,
        _dio = dio;

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
      debugPrint('[DioAuthInterceptor.onRequest] Expired, try renewing token.');
      await credentialsRepository.delete();

      final response = await _dio.post('/api/v2/tokens/renew',
          data: {'refreshToken': credentials.refreshToken}).catchError((err) {
        final Response(statusCode: statusCode, data: {'code': errorCode}) =
            err.response;

        if (statusCode == HttpStatus.unauthorized) {
          debugPrint('[DioAuthInterceptor.onRequest] Renewing token Failed.');
          _ref.invalidate(authCredentialsStateProvider);
        }
      });

      final Response(statusCode: statusCode) = response;

      if (statusCode == 200) {
        await credentialsRepository.save(AuthCredentials(
            accessToken: response.data['accessToken'],
            refreshToken: response.data['refreshToken']));
        _ref.invalidate(authCredentialsStateProvider);

        err.requestOptions.headers['Authorization'] =
            'Bearer ${response.data['accessToken']}';

        debugPrint(
            '[DioAuthInterceptor.onRequest] Renewing token Successfully, options=${err.requestOptions.headers}');

        final retriedResponse = await _dio.fetch(err.requestOptions);

        return handler.resolve(retriedResponse);
      }
    }

    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
