import 'package:application_new/feature/travel_read/components/visit_item.dart';
import 'package:application_new/feature/travel_read/components/visits_map_item.dart';
import 'package:application_new/shared/model/travel/travel_detail_model.dart';
import 'package:application_new/feature/travel_read/model/travel_visit_model.dart';
import 'package:application_new/feature/travel_read/provider/travel_read_provider.dart';
import 'package:application_new/shared/component/fixed_header_delegate.dart';
import 'package:application_new/shared/component/filled_chip_theme.dart';
import 'package:application_new/shared/component/travel_header.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelReadPage extends ConsumerStatefulWidget {
  final int _travelId;

  const TravelReadPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  ConsumerState createState() => _TravelDetailPageState();
}

class _TravelDetailPageState extends ConsumerState<TravelReadPage> {
  final ScrollController scrollController = ScrollController();
  final List<double> itemOffsets = List.generate(100, (_) => 0);

  double initOffset = 0.0;

  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    Future.microtask(() {
      scrollController.addListener(() {
        final result =
            getTargetState<TravelVisitModel?>(const Offset(0, 340.0));

        if (result == null) return;

        ref
            .read(travelReadProvider(widget._travelId).notifier)
            .selectPlace(result.placeId);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(travelReadProvider(widget._travelId));

    final TravelDetailModel(:travel, :visits, :places) = state.detail;

    final colorScheme = Theme.of(context).colorScheme;

    final travelDays =
        DateTimeRange(start: travel.startedOn, end: travel.endedOn)
            .duration
            .inDays;

    ref.listen(travelReadProvider(widget._travelId), (prev, next) {
      if (prev?.selectedDate == next.selectedDate) return;
      scrollController.animateTo(initOffset,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });

    return FilledChipTheme(
      child: Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24.0, 6.0, 24.0, 16.0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                TravelHeader(travel: travel)
              ])),
            ),
            SliverLayoutBuilder(builder: (context, constraints) {
              initOffset = constraints.precedingScrollExtent;
              return SliverPersistentHeader(
                pinned: true,
                delegate: FixedHeaderDelegate(
                  extent: MediaQuery.of(context).size.height * 0.4,
                  widget: Column(
                    children: [
                      Expanded(
                        child: VisitsMapItem(travelId: widget._travelId),
                      ),
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: colorScheme.surface,
                            border: Border(
                                bottom: BorderSide(
                                    color: colorScheme.secondaryFixed))),
                        child: SingleChildScrollView(
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 16.0),
                          child: Row(
                            children: [
                              for (var i = 0; i < travelDays; i++) ...[
                                Builder(builder: (context) {
                                  final day =
                                      travel.startedOn.add(Duration(days: i));

                                  return ChoiceChip(
                                      onSelected: (_) => ref
                                          .read(travelReadProvider(
                                                  widget._travelId)
                                              .notifier)
                                          .selectDate(day),
                                      selected: state.selectedDate == day,
                                      label: Text(DateFormat.MMMEd().format(day)));
                                }),
                                const SizedBox(width: 12.0)
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            SliverList(
                key: key,
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 24.0),
                  for (final visit in state.selectedVisits)
                    MetaData(
                        behavior: HitTestBehavior.translucent,
                        metaData: visit,
                        child: VisitItem(places: places, visit: visit)),
                  const SizedBox(height: 24.0),
                ])),
          ],
        ),
      ),
    );
  }

  T? getTargetState<T>(Offset globalPosition) {
    final result = SliverHitTestResult();

    (key.currentContext?.findRenderObject() as RenderSliver).hitTest(result,
        mainAxisPosition: globalPosition.dy,
        crossAxisPosition: globalPosition.dx);

    // Look for the RenderBoxes that corresponds to the hit target (the hit target
    // widgets build RenderMetaData boxes for us for this purpose).
    for (HitTestEntry entry in result.path) {
      if (entry.target is RenderMetaData) {
        final renderMetaData = entry.target as RenderMetaData;
        if (renderMetaData.metaData is T) {
          return renderMetaData.metaData as T;
        }
      }
    }

    return null;
  }
}
