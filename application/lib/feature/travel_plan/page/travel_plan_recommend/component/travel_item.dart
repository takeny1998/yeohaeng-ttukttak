import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/component/travel_info_item.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class TravelItem extends ConsumerWidget {
  final TravelModel travel;

  const TravelItem({super.key, required this.travel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    final tr = ref.watch(translationServiceProvider);
    
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
                    child: Text(tr.from('Read travelogues')))),
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
                label: Text(tr.from('Save')),
              ),
            ),
          ]),
        ]);
  }
}
