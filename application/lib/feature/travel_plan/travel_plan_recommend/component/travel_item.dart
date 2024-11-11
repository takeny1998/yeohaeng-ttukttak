import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/component/travel_companion_avatar_item.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class TravelItem extends StatelessWidget {
  final TravelModel travel;

  const TravelItem({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    const travelNameStyle =
        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
    final travelDateStyle =
        TextStyle(fontSize: 13.0, color: colorScheme.onSurfaceVariant);

    final translator = TranslationUtil.widget(context);


    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: GridView.custom(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    pattern: [
                      const QuiltedGridTile(2, 2),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                      const QuiltedGridTile(1, 1),
                    ],
                  ),
                  childrenDelegate: SliverChildListDelegate([
                    for (int i = 0; i < 5; i++)
                      Container(color: colorScheme.surfaceContainer)
                  ]))),
          const SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(travel.formattedName,
                    style: travelNameStyle, overflow: TextOverflow.ellipsis),
                Text(travel.formattedDate, style: travelDateStyle),
              ]),
              Expanded(
                child: ExtendedWrap(
                    alignment: WrapAlignment.end,
                    maxLines: 1, spacing: -21.0, children: [
                  for (final companion in travel.companions)
                    CircleAvatar(
                        radius: 25.0,
                        backgroundColor: colorScheme.surfaceContainer,
                        child: TravelerAvatarItem.companion(companion, radius: 24.0))
                ]),
              )
            ],
          ),
          const SizedBox(height: 8.0),
          ExtendedWrap(maxLines: 1, spacing: 8.0, children: [
            for (final motivationType in travel.motivationTypes)
              SmallChip(label: TranslationUtil.enumValue(motivationType))
          ]),
          const SizedBox(height: 16.0),
          Row(children: [
            Expanded(
                flex: 2,
                child: OutlinedButton(
                    onPressed: () =>
                        context.push('/travels/${travel.id}/detail'),
                    style: OutlinedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w600),
                        backgroundColor: colorScheme.surface),
                    child: Text(translator.key('view_detail')))),
            const SizedBox(width: 8.0),
            Expanded(
              flex: 1,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.w600),
                    backgroundColor: colorScheme.surface),
                onPressed: () {},
                icon: const Icon(Icons.bookmark_outline, size: 18.0),
                label: Text(translator.key('save')),
              ),
            ),
          ]),
        ]);
  }
}
