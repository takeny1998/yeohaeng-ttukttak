import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/exception/exception.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:application_new/feature/authentication/model/auth_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/profile/profile_edit_state.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_edit_provider.g.dart';

@riverpod
class ProfileEdit extends _$ProfileEdit {
  late MemberModel member;

  @override
  ProfileEditState build() {
    final member = ref.watch(sessionProvider).member;

    if (member == null) {
      throw AuthorizationException();
    }

    this.member = member;

    return ProfileEditState(
      nickname: member.nickname,
      ageGroup: member.ageGroup,
      gender: member.gender,
    );
  }

  void editNickname(String? editNickname) {
    if (state.nickname == editNickname) return;
    final errorMessages = Map.of(state.errorMessages);

    if (editNickname == null || editNickname.isEmpty) {
      errorMessages['nickname'] =
          ref.read(translationServiceProvider).from('please_enter_nickname');

      state = state.copyWith(errorMessages: errorMessages);
      return;
    }

    errorMessages.remove('nickname');

    state = state.copyWith(
      errorMessages: errorMessages,
      nickname: editNickname,
    );
  }

  void selectGender(Gender gender) {
    if (state.gender == gender) return;
    state = state.copyWith(gender: gender);
  }

  void selectAgeGroup(AgeGroup ageGroup) {
    if (state.ageGroup == ageGroup) return;
    state = state.copyWith(ageGroup: ageGroup);
  }

  Future<void> submit() async {
    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    final updatedMember = await loadingNotifier.guard(() async {
      final AuthModel(:accessToken) =
          await ref.read(authServiceProvider).find();

      final Map<String, String> data = {};

      if (member.nickname != state.nickname) {
        data['nickname'] = state.nickname;
      }

      if (state.ageGroup != null) {
        data['ageGroup'] = state.ageGroup!.name;
      }

      if (state.gender != null) {
        data['gender'] = state.gender!.name;
      }

      final response = await ref.read(httpServiceProvider).request(
            'PATCH',
            '/api/v2/members/me/profile',
            authorization: accessToken,
            data: data,
          );

      return MemberModel.fromJson(response['member']);
    });
    eventController.add(MessageEvent(
        ref.read(translationServiceProvider).from('profile_has_been_edited')));
    ref.read(sessionProvider.notifier).updateLoginMember(updatedMember);

  }

  void updateErrorMessages(Map<String, String> errorMessages) {
    state = state.copyWith(errorMessages: errorMessages);
  }
}
