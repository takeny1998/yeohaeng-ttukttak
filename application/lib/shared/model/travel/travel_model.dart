import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:flutter/material.dart';
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
    @Default(AgeGroup.none) AgeGroup ageGroup,
    @Default(Gender.none) Gender gender,
    @Default([]) List<TravelCompanionModel> companions,
    @Default([]) List<TravelMotivationType> motivationTypes,
    @Default([]) List<CityModel> cities,
  }) = _TravelModel;

  factory TravelModel.empty() =>
      TravelModel(id: 0, startedOn: DateTime.now(), endedOn: DateTime.now());

  factory TravelModel.fromJson(Map<String, dynamic> json) =>
      _$TravelModelFromJson(json);

  String get formattedDate =>
      DateUtil.formatRange(DateTimeRange(start: startedOn, end: endedOn));

  String get formattedName {
    return '${cities.map((city) => city.name).join(' · ')} ${TranslationUtil.word('travel')}';
  }
}

@freezed
class TravelCompanionModel with _$TravelCompanion {
  const factory TravelCompanionModel({
    required int id,
    required TravelCompanionType type,
    AgeGroup? ageGroup,
    Gender? gender,
  }) = _TravelCompanion;

  factory TravelCompanionModel.fromJson(Map<String, dynamic> json) =>
      _$TravelCompanionFromJson(json);
}

enum TravelMotivationType {
  adventure,
  rest,
  friendship,
  selfReflection,
  socialNetwork,
  fitness,
  newExperiences,
  education,
  special,
  other;

  static Iterable<TravelMotivationType> active() => [
        adventure,
        rest,
        friendship,
        selfReflection,
        socialNetwork,
        fitness,
        newExperiences,
        education,
        special
      ];
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
  others,
  none;

  static Iterable<TravelCompanionType> active() => [
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
      ];
}
