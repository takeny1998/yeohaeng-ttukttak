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
    required String name,
    required DateTime startedOn,
    required DateTime endedOn,
    required String memberId,
    required List<TravelCompanionType> companionTypes,
    required List<TravelMotivationType> motivationTypes,
  }) = _TravelModel;

  factory TravelModel.fromJson(Map<String, dynamic> json) =>
      _$TravelModelFromJson(json);

  String get formattedDate =>
      DateUtil.formatRange(DateTimeRange(start: startedOn, end: endedOn));

}

@freezed
class TravelParticipantModel with _$TravelParticipantModel {
  const factory TravelParticipantModel({
    required int id,
    required int travelId,
    required String inviteeId,
    required String inviterId,
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
