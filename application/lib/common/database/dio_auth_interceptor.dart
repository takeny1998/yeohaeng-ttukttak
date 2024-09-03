import 'package:application/features/authentication/data/dao/auth_client.dart';
import 'package:application/features/authentication/domain/provider/auth_provider.dart';
import 'package:application/features/authentication/presentation/provider/auth_state_notifier.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/authentication/domain/entity/auth_entity.dart';

final class DioAuthInterceptor extends Interceptor {
  final AutoDisposeRef _ref;

  final Dio _dio;

  final AuthClient _client;

  DioAuthInterceptor({required AutoDisposeRef ref, required Dio dio})
      : _ref = ref,
        _dio = dio,
        _client = AuthClient(dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final auth = await _ref.watch(authRepositoryProvider).find();

    if (auth != null) {
      final AuthEntity(accessToken: accessToken) = auth;
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    debugPrint('[DioAuthInterceptor.onRequest] options=${options.headers}');

    return handler.next(options);
  }

  bool _check(Response response, int statusCode, String errorCode) {
    return response.statusCode == statusCode &&
        response.data['code'] == errorCode;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final response = err.response;

    final authRepository = _ref.watch(authRepositoryProvider);
    final authEntity = await authRepository.find();

    if (response == null ||
        authEntity == null ||
        !_check(response, 401, "AUTHORIZATION_EXPIRED")) {
      return handler.next(err);
    }

    final AuthEntity(:refreshToken) = authEntity;

    print('[DioAuthInterceptor.onError] Expired, try renewing token.');
    try {
      final authModel =
          await _client.renew(AuthRenewRequest(refreshToken: refreshToken));
      final authEntity = AuthEntity.fromModel(authModel);

      await authRepository.save(authEntity);

      final AuthEntity(accessToken: accessToken) = authEntity;

      err.requestOptions.headers['Authorization'] = 'Bearer $accessToken';
      print(
          '[DioAuthInterceptor.onError()] Renewing token Successfully, options=${err.requestOptions.headers}');

      return handler.resolve(await _dio.fetch(err.requestOptions));
    } on DioException catch (e) {
      print(
          '[DioAuthInterceptor.onError()] Renewing auth failed: ${e.response}');

      if (e.response == null || !_check(e.response!, 401, 'AUTHORIZE_FAILED')) {
        rethrow;
      }

      await authRepository.delete();
    } finally {
      _ref.invalidate(authStateNotifierProvider);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
