import 'package:application_new/shared/model/member_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_model.freezed.dart';
part 'travel_model.g.dart';

@freezed
class TravelModel with _$TravelModel {

  const TravelModel._();

  const factory TravelModel({
    required int id,
    required DateTime startedOn,
    required DateTime endedOn,
    required AgeGroup ageGroup,
    required Gender gender,
    required List<TravelCompanion> companions,
    required List<TravelMotivation> motivations,
  }) = _TravelModel;


  factory TravelModel.empty() => TravelModel(
      id: 0,
      startedOn: DateTime.now(),
      endedOn: DateTime.now(),
      ageGroup: AgeGroup.none,
      gender: Gender.none,
      companions: [],
      motivations: []);

  factory TravelModel.fromJson(Map<String, dynamic> json) =>
      _$TravelModelFromJson(json);

}

@freezed
class TravelCompanion with _$TravelCompanion {
  const factory TravelCompanion(
      {required int id,
        required TravelCompanionType type,
        required AgeGroup ageGroup,
        required Gender gender}) = _TravelCompanion;

  factory TravelCompanion.fromJson(Map<String, dynamic> json) =>
      _$TravelCompanionFromJson(json);
}

enum TravelMotivation {
  adventure,
  rest,
  friendship,
  selfReflection,
  socialNetwork,
  fitness,
  newExperiences,
  education,
}

enum TravelCompanionType {
  spouse,
  children,
  parents,
  grandparents,
  siblings,
  relatives,
  friends,
  lover,
  colleagues,
  members,
  others
}
