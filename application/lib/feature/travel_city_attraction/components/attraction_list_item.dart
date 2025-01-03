import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/travel_city_attraction/attraction_model.dart';
import 'package:application_new/shared/util/snap_scroll_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttractionListItem extends ConsumerStatefulWidget {
  final AttractionModel attraction;
  const AttractionListItem({super.key, required this.attraction});

  @override
  ConsumerState createState() => _AttractionListItemState();
}

class _AttractionListItemState extends ConsumerState<AttractionListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final attraction = widget.attraction;
    final tr = ref.watch(translationServiceProvider);

    final ColorScheme(:surfaceContainer, :primaryFixedDim, :surfaceContainerHigh) =
        Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 192.0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          physics: const SnapScrollPhysics(itemWidth: 256.0),
          itemBuilder: (context, index) {
            return Container(
                width: 240.0,
                height: 240.0,
                decoration: BoxDecoration(
                    color: surfaceContainer,
                    borderRadius: BorderRadius.circular(12.0)));
          },
          separatorBuilder: (context, index) => const SizedBox(width: 16.0),
        ),
      ),
      ListTile(
        contentPadding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
        title: Text(attraction.name,
            style:
                const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attraction.roadAddress ?? attraction.roadAddress ?? ''),
            if (attraction.categoryTypes.isNotEmpty) ...[
              const SizedBox(height: 10.0),
              Text(
                attraction.categoryTypes.map((e) => tr.fromEnum(e)).join(' · '),
                style: const TextStyle(fontSize: 13.0),
              ),
            ],
          ],
        ),
        titleAlignment: ListTileTitleAlignment.titleHeight,
        trailing: Column(
          children: [
            const Icon(Icons.star_outline_rounded),
            const SizedBox(height: 2.0),
            Text(attraction.rating.toString()),
          ],

        )
      ),
      const SizedBox(height: 8.0),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: StatefulBuilder(builder: (context, setState) {
              final List<AttractionVisitReasonModel> visitReasons = isExpanded
                  ? attraction.visitReasons
                  : attraction.visitReasons.isNotEmpty
                      ? [attraction.visitReasons.first]
                      : [];

              return Wrap(
                spacing: 8.0,
                children: [
                  for (final visitReason in visitReasons)
                    Chip(
                      backgroundColor: surfaceContainer,
                      side: BorderSide(color: surfaceContainer),
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 2),
                      visualDensity: VisualDensity.compact,
                      label: Row(
                        children: [
                          Text(tr.from(visitReason.reasonType.shortLabel), style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.normal)),
                          const SizedBox(width: 8.0),
                          Text('${visitReason.count}',
                              style: const TextStyle()),
                        ],
                      ),
                    ),
                  if (isExpanded == false && attraction.visitReasons.length > 1)
                    ChoiceChip(
                        visualDensity: VisualDensity.compact,
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 1.0),
                        label: Text(
                            '+ ${attraction.visitReasons.length - visitReasons.length}'),
                        selected: false,
                        onSelected: (_) => setState(() => isExpanded = true))
                ],
              );
            })),
      ),
      const SizedBox(height: 24.0),
      Row(
        children: [
          const SizedBox(width: 24.0),
          Expanded(
              flex: 6,
              child: OutlinedButton.icon(
                  onPressed: () {},
                  label: Text(tr.from('Add to plan')))),
          const SizedBox(width: 16.0),
          Expanded(
              flex: 4,
              child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_outline_rounded, size: 18.0),
                  label: Text(tr.from('Bookmark')))),
          const SizedBox(width: 24.0),
        ],
      ),
      const SizedBox(height: 64.0),
    ]);
  }
}
