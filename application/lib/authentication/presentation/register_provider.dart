import 'package:application/authentication/client/dto/token_renew_request.dart';
import 'package:application/authentication/client/oauth_client_provider.dart';
import 'package:application/authentication/client/token_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/auth_credentials.dart';
import '../repository/auth_credentials_repository_provider.dart';
import '../service/auth_service_provider.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {
  @override
  FutureOr<AuthCredentials?> build() async {
    final authCredentialsRepository =
        ref.read(authCredentialsRepositoryProvider);

    final authCredentials = await authCredentialsRepository.find();
    if (authCredentials == null) return null;

    return ref.read(tokenClientProvider)
        .renew(TokenRenewRequest(refreshToken: authCredentials.refreshToken))
        .then((value) {
          authCredentialsRepository.save(value);
          return value;
        });
  }

  Future<void> register() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final response = await ref.read(oauthClientProvider).apple('register');
      final auth =
          await ref.read(authServiceProvider).register(response.redirectUri);

      ref.read(authCredentialsRepositoryProvider).save(auth);
      return auth;
    });
  }

  Future<void> revoke() async {
    state = const AsyncLoading();
    await ref.read(authServiceProvider).revoke();
    state = const AsyncData(null);
  }

  Future<void> logout() async {
    state = const AsyncLoading();

    state.whenOrNull(data: (auth) {
      if (auth == null) return;
      ref.read(authCredentialsRepositoryProvider).delete(auth);
    });

    state = const AsyncData(null);
  }
}
