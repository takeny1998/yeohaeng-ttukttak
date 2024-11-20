import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_date_view.dart';
import 'package:flutter/material.dart';

import 'travel_info_item.dart';

class TravelPlanAddListItem extends StatelessWidget {

  final TravelModel travel;
  final bool isSelected;

  const TravelPlanAddListItem({super.key, required this.travel, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(8.0),
          border: isSelected ? Border.all(color: colorScheme.primaryFixedDim) : null
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TravelInfoItem(travel: travel),
            const SizedBox(height: 24.0),
            TravelPlanDateView(
                travel: travel,
                selectedDate: isSelected ? travel.startedOn : null,
                onChangeDate: (date) {}),
          ],
        ));
  }
}
