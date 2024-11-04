import 'package:application_new/common/util/string_extension.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecommendPlaceItem extends StatelessWidget {
  final RecommendPlaceModel recommendPlaceModel;

  const RecommendPlaceItem({super.key, required this.recommendPlaceModel});

  @override
  Widget build(BuildContext context) {
    // 외부 Indicator 크기 변동을 위해 높이를 부여
    if (recommendPlaceModel.places.isEmpty) {
      return const SizedBox(height: 1.0);
    }

    final trKey = baseKey('travel_plan_recommend');

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final labelStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final nameStyle =
        textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

    final subTitleStyle = textTheme.labelMedium?.copyWith(
        color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600);

    final labelText = trKey('label_place.${recommendPlaceModel.category.name}')
                        .tr()
    .lineBreakByWord();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                    labelText,
                    style: labelStyle,
                    softWrap: true)),
            const SizedBox(height: 16.0),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const SizedBox(width: 24.0),
                  for (final place in recommendPlaceModel.places) ...[
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
                                style: nameStyle,
                                overflow: TextOverflow.ellipsis),
                            Text(place.address.value ?? '',
                                style: subTitleStyle,
                                overflow: TextOverflow.ellipsis),
                            SmallChip(
                                label:
                                    enumKey(place.categories.firstOrNull).tr()),
                            const SizedBox(height: 8.0),
                            SizedBox(
                                width: double.maxFinite,
                                child: OutlinedButton.icon(
                                    onPressed: () {},
                                    style: OutlinedButton.styleFrom(
                                        textStyle: subTitleStyle),
                                    icon: const Icon(
                                        Icons.add_location_outlined,
                                        size: 18.0),
                                    label: Text(trKey('add_to_plan')).tr()))
                          ]),
                    ),
                    const SizedBox(width: 24.0),
                  ],
                  const SizedBox(width: 24.0),
                ])),
          ]),
    );
  }
}
