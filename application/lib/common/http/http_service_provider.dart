import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/feature/locale/locale_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_service_provider.g.dart';

@Riverpod(keepAlive: true)
HttpService httpService(HttpServiceRef ref) {
  final locale = ref.watch(localeStateProvider);

  return HttpService(
      dio: Dio(),
      baseUrl: 'https://bug-steady-reliably.ngrok-free.app',
      locale: locale);
}
