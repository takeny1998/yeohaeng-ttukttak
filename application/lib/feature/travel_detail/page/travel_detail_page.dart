
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_detail/components/companion_item.dart';
import 'package:application_new/feature/travel_detail/components/visit_item.dart';
import 'package:application_new/feature/travel_detail/components/visits_map_item.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/model/travel_visit_model.dart';
import 'package:application_new/feature/travel_detail/provider/travel_detail_provider.dart';
import 'package:application_new/shared/component/custom_header_delegate.dart';
import 'package:application_new/shared/component/filled_chip.dart';
import 'package:application_new/shared/component/filled_choice_chip.dart';
import 'package:application_new/shared/model/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelDetailPage extends ConsumerStatefulWidget {
  final int _travelId;

  const TravelDetailPage({super.key, required int travelId})
      : _travelId = travelId;

  @override
  ConsumerState createState() => _TravelDetailPageState();
}

class _TravelDetailPageState extends ConsumerState<TravelDetailPage> {
  final ScrollController scrollController = ScrollController();
  final List<double> itemOffsets = List.generate(100, (_) => 0);

  double initOffset = 0.0;

  final GlobalKey key = GlobalKey();

  String _formatTravelDate(TravelModel? travel) {
    if (travel == null) return '';

    final startedOn = travel.startedOn;
    final endedOn = travel.endedOn;

    String formatDate(DateTime date) => DateFormat.yMMMd().format(date);

    if (DateUtils.isSameMonth(startedOn, endedOn)) {
      return '${formatDate(startedOn)} ~ ${DateFormat.d().format(endedOn)}';
    } else if (startedOn.year == endedOn.year) {
      return '${formatDate(startedOn)} ~ ${DateFormat.MMMd().format(endedOn)}';
    } else {
      return '${formatDate(startedOn)} ~ ${formatDate(endedOn)}';
    }
  }

  @override
  void initState() {
    Future.microtask(() {
      scrollController.addListener(() {
        final result = getTargetState<TravelVisitModel?>(const Offset(0, 340.0));

        if (result == null) return;

        ref
            .read(travelDetailProvider(widget._travelId).notifier)
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
    final state = ref.watch(travelDetailProvider(widget._travelId));

    final TravelDetailModel(:travel, :cities, :visits, :places) = state.data;
    final TravelModel(:motivations, :companions) = travel;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final travelName =
        '${cities.map((city) => city.name).join(' · ')} ${'word.travel'.tr()}';

    final travelDateText = _formatTravelDate(travel);

    final travelDays =
        DateTimeRange(start: travel.startedOn, end: travel.endedOn)
            .duration
            .inDays;

    final selectedDay = travel.startedOn.add(Duration(days: state.selectedDay));

    final filteredVisits =
        visits.where((visit) => visit.visitedOn == selectedDay).toList();

    ref.listen(travelDetailProvider(widget._travelId), (prev, next) {
      if (prev?.selectedDay == next.selectedDay) return;
      scrollController.animateTo(initOffset,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24.0, 6.0, 24.0, 16.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              ListTile(
                contentPadding: EdgeInsets.zero,
                titleTextStyle: titleStyle,
                title: Text(travelName),
                subtitle: Text(travelDateText),
              ),
              Wrap(spacing: 8.0, children: [
                for (final motivation in motivations)
                  FilledChip(label: '#${enumKey(motivation).tr()}')
              ]),
              const SizedBox(height: 24.0),
              Wrap(spacing: 16.0, children: [
                CompanionItem(
                  id: travel.id,
                  gender: travel.gender,
                  title: 'me'.tr(),
                  subTitle: enumKey(travel.ageGroup).tr(),
                ),
                for (final companion in companions)
                  CompanionItem(
                    id: companion.id,
                    gender: companion.gender,
                    title: enumKey(companion.type).tr(),
                    subTitle: enumKey(companion.ageGroup).tr(),
                  ),
              ]),
              const SizedBox(height: 12.0),
            ])),
          ),
          SliverLayoutBuilder(builder: (context, constraints) {
            initOffset = constraints.precedingScrollExtent;
            return SliverPersistentHeader(
              pinned: true,
              delegate: CustomHeaderDelegate(
                extent: MediaQuery.of(context).size.height * 0.4,
                widget: Column(
                  children: [
                    Expanded(
                      child: VisitsMapItem(
                          places: places,
                          visits: filteredVisits,
                          selectedPlaceId: state.selectedPlaceId),
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
                            for (var day = 0; day < travelDays; day++) ...[
                              FilledChoiceChip(
                                  isSelected: state.selectedDay == day,
                                  onSelected: (_) => ref
                                      .read(travelDetailProvider(
                                              widget._travelId)
                                          .notifier)
                                      .selectDay(day),
                                  labelText: DateFormat.MMMEd().format(
                                      travel.startedOn
                                          .add(Duration(days: day)))),
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
                for (final visit in filteredVisits)
                  MetaData(
                      behavior: HitTestBehavior.translucent,
                      metaData: visit,
                      child: VisitItem(places: places, visit: visit)),
                const SizedBox(height: 24.0),
              ])),
        ],
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
