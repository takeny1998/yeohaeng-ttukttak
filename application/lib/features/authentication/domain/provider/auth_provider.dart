import 'package:application/common/database/dio_provider.dart';
import 'package:application/common/database/secure_storage_provider.dart';
import 'package:application/features/authentication/data/dao/auth_client.dart';
import 'package:application/features/authentication/data/dao/secure_storage_auth_repository.dart';
import 'package:application/features/authentication/domain/dao/auth_repository.dart';
import 'package:application/features/authentication/domain/use_case/auth_use_case.dart';
import 'package:application/features/authentication/domain/use_case/oauth_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return SecureStorageAuthRepository(storage: ref.watch(secureStorageProvider));
}

@riverpod
AuthClient authClient(AuthClientRef ref) {
  return AuthClient(ref.watch(dioProvider));
}

@riverpod
OAuthUseCase appleOAuthUseCase(AppleOAuthUseCaseRef ref) {
  return AppleOAuthUseCase(
      repository: ref.watch(authRepositoryProvider),
      client: ref.watch(authClientProvider));
}

@riverpod
OAuthUseCase googleOAuthUseCase(GoogleOAuthUseCaseRef ref) {
  return GoogleOAuthUseCase(
      repository: ref.watch(authRepositoryProvider),
      client: ref.watch(authClientProvider));
}

@riverpod
AuthUseCase authUseCase(AuthUseCaseRef ref) {
  return AuthUseCase(
      repository: ref.watch(authRepositoryProvider),
      client: ref.watch(authClientProvider));
}