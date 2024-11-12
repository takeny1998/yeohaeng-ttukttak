enum AgeGroup {
  underNine,
  teens,
  twenties,
  thirties,
  forties,
  fifties,
  sixties,
  seventiesPlus,
  none,
}

enum Gender {
  male,
  female,
  none,
}

enum LifePhaseGroup {
  kid,
  young,
  middle,
  old;

  static LifePhaseGroup byAgeGroup(AgeGroup ageGroup) => switch (ageGroup) {
    AgeGroup.underNine || AgeGroup.teens => LifePhaseGroup.kid,
    AgeGroup.twenties || AgeGroup.thirties => LifePhaseGroup.young,
    AgeGroup.forties || AgeGroup.fifties => LifePhaseGroup.middle,
    AgeGroup.sixties || AgeGroup.seventiesPlus => LifePhaseGroup.old,
    _ => throw UnimplementedError(),
  };
}
