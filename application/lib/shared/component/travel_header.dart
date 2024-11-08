import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/shared/component/travel_companion_item.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TravelHeader extends StatelessWidget {
  final TravelModel _travel;

  const TravelHeader({
    super.key,
    required TravelModel travel,
  }) : _travel = travel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          titleTextStyle: titleStyle,
          title: Text(
            _travel.formattedName,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(_travel.formattedDate),
        ),
        Wrap(spacing: 8.0, children: [
          for (final motivationType in _travel.motivationTypes)
            Chip(label: Text(TranslationUtil.enumValue(motivationType)))
        ]),
        const SizedBox(height: 24.0),
        Wrap(spacing: 16.0, children: [
          TravelerItem(
            id: _travel.id,
            gender: _travel.gender,
            ageGroup: _travel.ageGroup,
            relationShip: 'me'.tr(),
          ),
          for (final companion in _travel.companions)
            TravelerItem.companion(travelCompanion: companion),
        ]),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
