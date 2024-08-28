
import 'package:application/authentication/repository/auth_credentials_repository.dart';
import 'package:application/authentication/repository/secure_storage_auth_credentials_repository.dart';
import 'package:application/common/database/secure_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_credentials_repository_provider.g.dart';

@riverpod
AuthCredentialsRepository authCredentialsRepository(AuthCredentialsRepositoryRef ref) {

  final secureStorage = ref.watch(secureStorageProvider);

  return SecureStorageAuthCredentialsRepository(secureStorage);
}