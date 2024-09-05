import 'package:application/common/data/model/response.dart';
import 'package:application/features/authentication/data/dao/auth_client.dart';
import 'package:application/features/authentication/data/model/auth_model.dart';
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

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final authRepository = _ref.watch(authRepositoryProvider);
    final authEntity = await authRepository.find();

    if (authEntity == null) {
      return handler.next(response);
    }

    print('[DioAuthInterceptor.onResponse()] Expired, try renewing token.');

    final renewResponse = await _client
        .renewToken(AuthRenewRequest(refreshToken: authEntity.refreshToken));

    print('[DioAuthInterceptor.onResponse()] renewed = $renewResponse');

    Response? retiredResponse = null;

    switch (renewResponse) {
      case ServerSuccessResponse<AuthModel>(:final data):
        final entity = AuthEntity.fromModel(data);
        await authRepository.save(entity);

        final options = response.requestOptions;
        options.headers['Authorization'] = 'Bearer ${entity.accessToken}';

        print(
            '[DioAuthInterceptor.onResponse()] Renewing token Successfully, options=$options');
        retiredResponse = await _dio.fetch(options);

      case ServerFailResponse<AuthModel>():
        print('[DioAuthInterceptor.onResponse()] Renewing auth failed');
        await authRepository.delete();

      case ServerErrorResponse<AuthModel>():
    }

    _ref.invalidate(authStateNotifierProvider);

    if (retiredResponse != null) {
      return handler.next(retiredResponse);
    }

    return handler.next(response);
  }
}
