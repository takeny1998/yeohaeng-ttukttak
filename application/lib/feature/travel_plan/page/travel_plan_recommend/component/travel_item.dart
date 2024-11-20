import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/component/travel_info_item.dart';
import 'package:application_new/shared/component/small_chip.dart';
import 'package:application_new/shared/component/travel_companion_avatar_item.dart';
import 'package:application_new/domain/travel/travel_model.dart';
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
          TravelInfoItem(travel: travel),
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
