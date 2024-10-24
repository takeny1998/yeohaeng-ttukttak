import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/provider/travel_plan_recommend_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecommendItem extends StatelessWidget {
  final RecommendModel recommend;

  const RecommendItem({super.key, required this.recommend});

  @override
  Widget build(BuildContext context) {

    if (recommend.places.isEmpty) return const SizedBox();

    final trKey = baseKey('travel_plan_recommend');

    final labelText = switch (recommend.target) {
      MotivationTarget(:final motivation) =>
        trKey('label_motivation').tr(namedArgs: {
          'motivation': enumKey(motivation).tr(),
          'category': enumKey(recommend.category).tr()
        }),
      CompanionTypeTarget(:final companionType) =>
        trKey('label_companion_type').tr(namedArgs: {
          'companionType': enumKey(companionType).tr(),
          'category': enumKey(recommend.category).tr()
        }),
    };

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final labelStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final placeNameStyle =
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

    final placeAddrStyle = textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600);

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(labelText.lineBreakByWord(),
              style: labelStyle, softWrap: true)),
      const SizedBox(height: 16.0),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(width: 24.0),
            for (final place in recommend.places) ...[
              SizedBox(
                width: 192.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            width: double.maxFinite,
                            height: 160.0,
                            color: colorScheme.surfaceContainer,
                          )),
                      const SizedBox(height: 8.0),
                      Text(place.name,
                          style: placeNameStyle,
                          overflow: TextOverflow.ellipsis),
                      Text(place.address.value ?? '',
                          style: placeAddrStyle,
                          overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.maxFinite,
                        child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.add_location_alt_outlined, size: 18.0),
                            label: Text(trKey('add_to_plan')).tr()),
                      )
                    ]),
              ),
              const SizedBox(width: 16.0),
            ],
            const SizedBox(width: 24.0),
          ])),
      const SizedBox(height: 64.0),
    ]);
  }
}
