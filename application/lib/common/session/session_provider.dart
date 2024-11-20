import 'package:application_new/common/session/session_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

@riverpod
class Session extends _$Session {
  @override
  SessionModel build() {
    return const SessionModel();
  }

  void update({required bool isAuthenticated}) {
    if (state.isAuthenticated == isAuthenticated) {
      return;
    }

    state = state.copyWith(
      isAuthenticated: isAuthenticated,
    );
  }

  void omitError(String message) {
    state = state.copyWith(errorMessage: message);
  }

  void consumeError(Error error) {
    state = state.copyWith(errorMessage: null);
  }
}
