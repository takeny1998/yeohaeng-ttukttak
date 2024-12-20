import 'package:application_new/common/http/http_communicable.dart';
import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/feature/authentication/repository/auth_repository_provider.dart';
import 'package:application_new/feature/locale/locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_service_provider.g.dart';

@Riverpod(keepAlive: true)
HttpService httpService(HttpServiceRef ref) {
  final locale = ref.watch(localeStateProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  final httpClient = ref.watch(httpCommunicableProvider);

  return HttpService(
      httpClient: httpClient,
      baseUrl: 'https://bug-steady-reliably.ngrok-free.app/api/v2',
      authRepository: authRepository,
      locale: locale);
}
