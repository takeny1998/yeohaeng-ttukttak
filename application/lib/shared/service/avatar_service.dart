import 'package:application_new/shared/model/member_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'avatar_service.g.dart';


abstract interface class AvatarService {
  String getPathByUniqueId(
    int id, {
    required Gender gender,
    required AgeGroup ageGroup,
  });
}

final class NotionStyleAvatarService extends AvatarService {
  @override
  String getPathByUniqueId(int id,
      {required Gender gender, required AgeGroup ageGroup}) {
    final lifePhaseGroup = LifePhaseGroup.byAgeGroup(ageGroup);
    final avatarCount = _getAvatarCount(gender, lifePhaseGroup);

    final prefix = switch (gender) {
      Gender.male => 'M',
      Gender.female => 'F',
      _ => throw UnimplementedError(),
    };

    final suffix = switch (lifePhaseGroup) {
      LifePhaseGroup.kid => 'K',
      LifePhaseGroup.young => 'Y',
      LifePhaseGroup.middle => 'M',
      LifePhaseGroup.old => 'O',
    };

    final avatarId = (id % avatarCount) + 1;

    return 'avatars/$prefix$suffix$avatarId.png';
  }

  int _getAvatarCount(Gender gender, LifePhaseGroup lifePhaseGroup) {
    int buildGenderCase(int maleCount, int femaleCount) {
      return switch (gender) {
        Gender.male => maleCount,
        Gender.female => femaleCount,
        _ => throw UnimplementedError(),
      };
    }

    return switch (lifePhaseGroup) {
      LifePhaseGroup.kid => buildGenderCase(2, 1),
      LifePhaseGroup.young => buildGenderCase(16, 18),
      LifePhaseGroup.middle => buildGenderCase(16, 21),
      LifePhaseGroup.old => buildGenderCase(2, 1),
    };
  }
}

@riverpod
AvatarService avatarService(AvatarServiceRef ref) {
  return NotionStyleAvatarService();
}