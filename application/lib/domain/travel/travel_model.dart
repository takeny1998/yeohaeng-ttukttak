import 'package:application_new/common/util/date_util.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
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
    AgeGroup? ageGroup,
    Gender? gender,
    required List<TravelCompanionModel> companions,
    required List<TravelMotivationType> motivationTypes,
    required List<CityModel> cities,
  }) = _TravelModel;

  factory TravelModel.fromJson(Map<String, dynamic> json) =>
      _$TravelModelFromJson(json);

  String get formattedDate =>
      DateUtil.formatRange(DateTimeRange(start: startedOn, end: endedOn));

  String get formattedName {
    return '${cities.map((city) => city.name).join(' · ')} ${TranslationUtil.word('travel')}';
  }
}

@freezed
class TravelFormModel with _$TravelFormModel {
  const TravelFormModel._();

  const factory TravelFormModel({
    required DateTime? startedOn,
    required DateTime? endedOn,
    required Iterable<TravelMotivationType> motivationTypes,
    required Iterable<TravelCompanionType> companionTypes,
    required Iterable<CityModel> cities,
  }) = _TravelFormModel;

  factory TravelFormModel.fromState(TravelCreateState state) => TravelFormModel(
      startedOn: state.startedOn,
      endedOn: state.endedOn,
      motivationTypes: state.motivationTypes,
      companionTypes: state.companionTypes,
      cities: state.cities);

  Map<String, dynamic> toMap() => {
        'date': {
          'startedOn': startedOn?.toIso8601String(),
          'endedOn': endedOn?.toIso8601String(),
        },
        'companionTypes': companionTypes.map((e) => e.name).toList(),
        'motivationTypes': motivationTypes.map((e) => e.name).toList(),
        'cities': cities,
      };
}

@freezed
class TravelCompanionModel with _$TravelCompanionModel {
  const factory TravelCompanionModel({
    required int id,
    required TravelCompanionType type,
    AgeGroup? ageGroup,
    Gender? gender,
  }) = _TravelCompanion;

  factory TravelCompanionModel.fromJson(Map<String, dynamic> json) =>
      _$TravelCompanionModelFromJson(json);
}

@freezed
class TravelParticipantModel with _$TravelParticipantModel {
  const factory TravelParticipantModel({
    required int id,
    required int travelId,
    required String inviteeId,
    required String invitorId,
  }) = _TravelParticipantModel;

  factory TravelParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$TravelParticipantModelFromJson(json);

  static List<TravelParticipantModel> listFromJson(Map<String, dynamic> json) {
    return List.of(json['participants'])
        .map((e) => TravelParticipantModel.fromJson(e))
        .toList();
  }
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
  others;

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
