import 'dart:ffi';

import 'package:application_new/common/exception/exception.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/model/auth_provider.dart';
import 'package:application_new/feature/authentication/repository/auth_repository_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';


@riverpod
class Login extends _$Login {
  @override
  void build() {
    return ;
  }

  Future<void> login({required AuthProvider provider}) async {
    final authService = ref.read(authServiceProvider);
    final sessionNotifier = ref.read(sessionProvider.notifier);
    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    loadingNotifier.guard(() async {
        await authService.login(
          provider: provider.getName(),
          authorizationCode: await provider.authorize(),
        );
        sessionNotifier.update(isAuthenticated: true);
    });
  }

  Future<void> logout() async {
    final authRepository = ref.read(authRepositoryProvider);
    final sessionNotifier = ref.read(sessionProvider.notifier);
    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    loadingNotifier.guard(() async {
      await authRepository.delete();
      sessionNotifier.update(isAuthenticated: false);
    });
  }
}