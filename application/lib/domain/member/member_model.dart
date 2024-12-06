import 'package:application_new/shared/model/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
class MemberModel with _$MemberModel {
  const factory MemberModel({
    required String uuid,
    required String nickname,
    AgeGroup? ageGroup,
    Gender? gender,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, dynamic> json) =>
      _$MemberModelFromJson(json);

  factory MemberModel.fromAccessToken(String accessToken) {
    final claims = JwtDecoder.decode(accessToken);

    return MemberModel(
        uuid: claims['sub'] as String,
        nickname: claims['nickname'] as String,
        gender: claims.containsKey('gender')
            ? Gender.values.byName(claims['gender'])
            : null);
  }
}
