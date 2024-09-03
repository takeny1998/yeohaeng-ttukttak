import 'dart:async';

import 'package:application/features/authentication/domain/entity/auth_entity.dart';
import 'package:application/features/authentication/domain/provider/auth_provider.dart';
import 'package:application/features/authentication/domain/use_case/oauth_use_case.dart';
import 'package:application/features/authentication/domain/entity/oauth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@riverpod
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  FutureOr<AuthEntity?> build() async {
    return ref.read(authUseCaseProvider).find();
  }

  Future<void> signIn(OAuthProvider provider) async {
    state = const AsyncLoading();

    final useCase = _getProvider(provider);
    state = await AsyncValue.guard(useCase.signIn);
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    final useCase = ref.read(authUseCaseProvider);
    await useCase.signOut();
    state = const AsyncValue.data(null);
  }

  OAuthUseCase _getProvider(OAuthProvider provider) =>
      switch (provider) {
        Apple() => ref.read(appleOAuthUseCaseProvider),
        Google() => ref.read(googleOAuthUseCaseProvider),
      };

}