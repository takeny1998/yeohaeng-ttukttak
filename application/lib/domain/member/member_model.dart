import 'package:application_new/shared/model/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
class MemberModel with _$MemberModel {
  const factory MemberModel({
    required String uuid,
    required String nickname,
    required AvatarModel avatar,
    AgeGroup? ageGroup,
    Gender? gender,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

}

@freezed
class AvatarModel with _$AvatarModel {

  const factory AvatarModel({
    required String host,
    required String path,
    required String ext
  }) = _AvatarModel;

  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      _$AvatarModelFromJson(json);
}
