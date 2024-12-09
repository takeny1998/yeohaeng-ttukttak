import 'package:application_new/shared/model/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_state.freezed.dart';

@freezed
class ProfileEditState with _$ProfileEditState {

  const factory ProfileEditState({
    required String nickname,
    @Default({}) Map<String, String?> errorMessages,
    Gender? gender,
    AgeGroup? ageGroup,
  }) = _ProfileEditState;

}