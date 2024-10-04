import 'package:application_new/shared/member/model/age_group.dart';
import 'package:application_new/shared/member/model/gender.dart';
import 'package:application_new/shared/travel/model/travel_companion.dart';
import 'package:application_new/shared/travel/model/travel_motivation.dart';
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