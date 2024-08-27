import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/auth_service_provider.dart';

part 'register_provider.g.dart';

@riverpod
class Register extends _$Register {

  @override
  FutureOr<void> build() async {}

  Future<void> call() async {
    state = const AsyncLoading();
    final authService = ref.read(authServiceProvider);

    state = await AsyncValue.guard(() => authService.register());
  }

}
