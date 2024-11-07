import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/model/recommend_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

class RecommendTravelItem extends StatefulWidget {
  final RecommendTravelModel recommendTravelModel;

  const RecommendTravelItem({super.key, required this.recommendTravelModel});

  @override
  State<RecommendTravelItem> createState() => _RecommendTravelItemState();
}

class _RecommendTravelItemState extends State<RecommendTravelItem> {
  final pageController = PageController(viewportFraction: 1.0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    const travelNameStyle =
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);
    final travelDateStyle =
        textTheme.labelLarge?.copyWith(color: colorScheme.onSurfaceVariant);

    final trKey = baseKey('travel_plan_recommend');

    return Container(
      color: colorScheme.surfaceContainerLow,
        padding: const EdgeInsets.symmetric(vertical: 48.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text('여행 추천 목록', style: titleStyle)),
          const SizedBox(height: 24.0),
          SizedBox(
              height: 392.0,
              child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) {
                    final travel = widget.recommendTravelModel.travels[index];
                    return Container(
                        width: double.maxFinite,
                        constraints: const BoxConstraints(maxWidth: 480.0),
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(travel.formattedName,
                                  style: travelNameStyle,
                                  overflow: TextOverflow.ellipsis),
                              Text(travel.formattedDate,
                                  style: travelDateStyle),
                              const SizedBox(height: 16.0),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: GridView.custom(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                      childrenDelegate:
                                          SliverChildListDelegate([
                                        for (int i = 0; i < 5; i++)
                                          Container(
                                              color:
                                                  colorScheme.primaryContainer)
                                      ]))),
                              const SizedBox(height: 16.0),
                              Wrap(spacing: 8.0, children: [
                                for (final motivation in travel.motivationTypes)
                                  Chip(label: Text(enumKey(motivation).tr()))
                              ]),
                              const SizedBox(height: 24.0),
                              Row(children: [
                                Expanded(
                                    child: OutlinedButton(
                                        onPressed: () => context.push('/travels/${travel.id}/detail'),
                                        style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                colorScheme.surface,
                                            foregroundColor:
                                                colorScheme.onSurface),
                                        child:
                                            Text(trKey('view_detail')).tr())),
                                const SizedBox(width: 16.0),
                                OutlinedButton.icon(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: colorScheme.surface),
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmark_outline),
                                  label: Text(trKey('save').tr()),
                                ),
                              ]),
                            ]));
                  },
                  itemCount: widget.recommendTravelModel.travels.length)),
        ]));
  }
}
