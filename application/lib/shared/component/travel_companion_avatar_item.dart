import 'package:application_new/common/util/iterable_utils.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:flutter/material.dart';

class TravelerAvatarItem extends StatelessWidget {
  final int id;
  final Gender? gender;
  final double? radius;

  const TravelerAvatarItem({
    super.key,
    required this.id,
    required this.gender,
    this.radius,
  });

  factory TravelerAvatarItem.companion(
    TravelCompanionModel travelCompanion, {
    double? radius,
  }) {
    return TravelerAvatarItem(
        id: travelCompanion.id, gender: travelCompanion.gender, radius: radius);
  }

  @override
  Widget build(BuildContext context) {
    final gender = switch (this.gender) {
      Gender.male => 'boy',
      Gender.female => 'girl',
      _ => IterableUtil.random(['boy', 'girl']),
    };

    return CircleAvatar(
      radius: radius ?? 24.0,
      backgroundImage: NetworkImage(
          'https://avatar.iran.liara.run/public/$gender?username=$id'),
    );
  }
}
