import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/shared/component/travel_companion_avatar_item.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:flutter/material.dart';

class TravelerItem extends StatelessWidget {

  final int id;
  final String relationShip;

  final Gender? gender;
  final AgeGroup? ageGroup;

  const TravelerItem({
    super.key,
    required this.id,
    required this.gender,
    required this.relationShip,
    required this.ageGroup,
  });

  factory TravelerItem.companion(
      {required TravelCompanionModel travelCompanion}) {
    return TravelerItem(
      id: travelCompanion.id,
        relationShip: TranslationUtil.enumValue(travelCompanion.type),
        gender: travelCompanion.gender,
        ageGroup: travelCompanion.ageGroup);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const titleStyle =
        TextStyle(fontSize: 16.0, height: 1.4, fontWeight: FontWeight.w600);

    final subTitleStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
      height: 1.2,
      color: colorScheme.secondary,
    );

    return Column(
      children: [
        TravelerAvatarItem(id: id, gender: gender, ageGroup: ageGroup),
        const SizedBox(height: 12.0),
        Text(relationShip, style: titleStyle),
        Text(TranslationUtil.enumValue(ageGroup), style: subTitleStyle),
      ],
    );
  }
}
