import 'package:application_new/common/http/http_service.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_service_provider.g.dart';

@riverpod
HttpService httpService(HttpServiceRef ref) {
  return HttpService(
      dio: Dio(), baseUrl: 'https://bug-steady-reliably.ngrok-free.app');
}
