import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:application/authentication/repository/auth_credentials_repository_provider.dart';
import 'package:application/authentication/service/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'auth_credentials_state_provider.g.dart';

@riverpod
class AuthCredentialsState extends _$AuthCredentialsState {

  @override
  FutureOr<AuthCredentials?> build() async {
    await ref.read(authServiceProvider).renew();
    return ref.read(authCredentialsRepositoryProvider).find();
  }

  Future<void> login() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(authServiceProvider).login());
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await ref.read(authServiceProvider).logout();
    state = const AsyncData(null);
  }

  Future<void> deleteAccount() async {
    state = const AsyncLoading();
    await ref.read(authServiceProvider).deleteAccount();
    state = const AsyncData(null);
  }

}
