import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/authentication/repository/auth_repository_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_service_provider.g.dart';

@riverpod
AuthService authService(AuthServiceRef ref) {
  return AuthService(
    authRepository: ref.watch(authRepositoryProvider),
    httpService: ref.watch(httpServiceProvider),
  );
}
