import 'package:application_new/shared/member/model/age_group.dart';
import 'package:application_new/shared/member/model/gender.dart';
import 'package:application_new/shared/travel/model/travel_companion_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_companion.freezed.dart';
part 'travel_companion.g.dart';

@freezed
class TravelCompanion with _$TravelCompanion {
  const factory TravelCompanion({
    required int id,
    required TravelCompanionType type,
    required AgeGroup ageGroup,
    required Gender gender
}) = _TravelCompanion;

  factory TravelCompanion.fromJson(Map<String, dynamic> json) =>
      _$TravelCompanionFromJson(json);
}