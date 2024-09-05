import 'package:application/main.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dio_auth_interceptor.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final baseDeviceInfo = ref.watch(baseDeviceInfoProvider);

  final {'identifierForVendor': deviceId, 'name': deviceName} =
      baseDeviceInfo.data;

  final dio = Dio(BaseOptions(
      baseUrl: 'https://bug-steady-reliably.ngrok-free.app',
      headers: {
        'Device-Id': deviceId,
        'Device-Name': deviceName,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }));

  return Dio(BaseOptions(
      baseUrl: 'https://bug-steady-reliably.ngrok-free.app',
      headers: {
        'Device-Id': deviceId,
        'Device-Name': deviceName,
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }))
    ..interceptors.addAll([DioAuthInterceptor(ref: ref, dio: dio)]);
}
