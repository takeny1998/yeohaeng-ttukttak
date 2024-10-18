import 'package:application_new/common/util/translation.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TravelPlanHomeHeader extends StatelessWidget {
  final TravelModel travel;
  final void Function(bool isExpanded) onScroll;

  const TravelPlanHomeHeader(
      {super.key, required this.travel, required this.onScroll});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final nameStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final dateStyle = textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: colorScheme.secondary,
    );

    const appBarHeight = 180.0 + kToolbarHeight;
    final topPadding = MediaQuery.of(context).padding.top + kToolbarHeight;

    return SliverAppBar(
      scrolledUnderElevation: 0.0,
      pinned: true,
      floating: true,
      snap: true,
      expandedHeight: appBarHeight,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        )
      ],
      backgroundColor: colorScheme.primaryContainer,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final isExpanded = topPadding == constraints.biggest.height;
        onScroll(isExpanded);

        return FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.fromLTRB(
                24.0, topPadding, 24.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(travel.formattedDate, style: dateStyle),
                const SizedBox(height: 2.0),
                Text(travel.formattedName, style: nameStyle),
                const SizedBox(height: 16.0),
                Text('여행 설명이 없습니다.', style: dateStyle),
                const SizedBox(height: 16.0),
                Wrap(spacing: 8.0, children: [
                  Chip(
                      backgroundColor: colorScheme.primary,
                      labelStyle: TextStyle(color: colorScheme.onPrimary),
                      label: Text(enumKey(travel.companionType).tr())),
                  for (final motivation in travel.motivations)
                    Chip(
                        backgroundColor: colorScheme.primaryFixedDim,
                        label: Text(enumKey(motivation).tr())),
                ]),
              ],
            ),
          ),
        );
      }),
    );
  }
}
