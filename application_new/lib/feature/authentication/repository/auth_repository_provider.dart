import 'package:application_new/feature/authentication/repository/auth_repository.dart';
import 'package:application_new/feature/authentication/repository/secure_storage_auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return SecureStorageAuthRepository(storage: const FlutterSecureStorage());
}
