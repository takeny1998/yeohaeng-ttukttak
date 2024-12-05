import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';

class TravelHeader extends StatelessWidget {
  final TravelModel _travel;

  const TravelHeader({
    super.key,
    required TravelModel travel,
  }) : _travel = travel;

  @override
  Widget build(BuildContext context) {
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
      ],
    );
  }
}
