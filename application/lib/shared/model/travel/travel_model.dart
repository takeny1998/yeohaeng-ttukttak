import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:easy_localization/easy_localization.dart';
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
    @Default(TravelCompanionType.none) TravelCompanionType companionType,
    @Default(AgeGroup.none) AgeGroup ageGroup,
    @Default(Gender.none) Gender gender,
    @Default([]) List<TravelCompanion> companions,
    @Default([]) List<TravelMotivation> motivations,
    @Default([]) List<CityModel> cities,
  }) = _TravelModel;

  factory TravelModel.empty() =>
      TravelModel(id: 0, startedOn: DateTime.now(), endedOn: DateTime.now());

  factory TravelModel.fromJson(Map<String, dynamic> json) =>
      _$TravelModelFromJson(json);

  String get formattedDate {
    String formatDate(DateTime date) => DateFormat.yMMMd().format(date);

    if (DateUtils.isSameMonth(startedOn, endedOn)) {
      return '${formatDate(startedOn)} ~ ${DateFormat.d().format(endedOn)}';
    } else if (startedOn.year == endedOn.year) {
      return '${formatDate(startedOn)} ~ ${DateFormat.MMMd().format(endedOn)}';
    } else {
      return '${formatDate(startedOn)} ~ ${formatDate(endedOn)}';
    }
  }

  String get formattedName {
    return '${cities.map((city) => city.name).join(' · ')} ${'word.travel'.tr()}';
  }
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
  others,
  none
}
