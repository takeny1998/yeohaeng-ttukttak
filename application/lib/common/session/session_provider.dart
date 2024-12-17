import 'package:application_new/common/session/error_model.dart';
import 'package:application_new/common/session/session_model.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_provider.g.dart';

@riverpod
class Session extends _$Session {
  @override
  SessionModel build() {
    return const SessionModel();
  }

  void updateLoginMember(MemberModel? member) {
    if (state.member == member) return;

    state = state.copyWith(
      member: member,
    );
  }

  void omitError(String code, String message) {
    state = state.copyWith(error: ErrorModel(code: code, message: message));
  }

  void consumeError(Error error) {
    state = state.copyWith(error: null);
  }
}
