import 'dart:async';

import 'package:application/authentication/client/token_client_provider.dart';
import 'package:application/authentication/domain/auth_credentials.dart';
import 'package:application/authentication/service/auth_service.dart';
import 'package:application/authentication/service/auth_service_provider.dart';
import 'package:application/features/authentication/presentation/provider/dto/oauth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  FutureOr<AuthCredentials?> build() async {
    return null;
  }

  Future<void> signIn(OAuthProvider provider) async {
    state = const AsyncLoading();

    final authService = _getProvider(provider);
    state = await AsyncValue.guard(authService.login);
  }

  Future<void> signOut(OAuthProvider provider) async {
    state = const AsyncLoading();

    final authService = _getProvider(provider);
    authService.logout();

    state = const AsyncValue.data(null);
  }

  // Future<void> renew() async {
  //   state = const AsyncLoading();
  //   ref.read(tokenClientProvider).renew(request);
  // }


  AuthService _getProvider(OAuthProvider provider) =>
      switch (provider) {
        Apple() => ref.read(appleAuthServiceProvider),
        Google() => ref.read(googleAuthServiceProvider),
      };

}