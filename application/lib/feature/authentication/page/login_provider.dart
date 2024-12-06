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
    return;
  }

  Future<void> login({required AuthProvider provider}) async {
    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    loadingNotifier.guard(() async {
      final member = await ref.read(authServiceProvider).register(
          provider: provider.getName(),
          authorizationCode: await provider.authorize());

      ref.read(sessionProvider.notifier).updateLoginMember(member);
    });
  }

  Future<void> logout() async {
    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    loadingNotifier.guard(() async {
      await ref.read(authRepositoryProvider).delete();
      ref.read(sessionProvider.notifier).updateLoginMember(null);
    });
  }
}
