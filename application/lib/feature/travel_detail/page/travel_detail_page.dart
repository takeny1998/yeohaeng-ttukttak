import 'package:application_new/common/component/custom_header_delegate.dart';
import 'package:application_new/common/component/custom_sliver_app_bar.dart';
import 'package:application_new/common/component/filled_chip.dart';
import 'package:application_new/common/component/filled_choice_chip.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_detail/components/companion_item.dart';
import 'package:application_new/feature/travel_detail/components/visit_item.dart';
import 'package:application_new/feature/travel_detail/components/visits_map_item.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/provider/travel_detail_provider.dart';
import 'package:application_new/shared/travel/model/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelDetailPage extends ConsumerWidget {
  final int _travelId;

  TravelDetailPage({super.key, required int travelId}) : _travelId = travelId;

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
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelDetailProvider(_travelId));

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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
              title: Text(travelName, style: titleStyle), headerHeight: 80),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24.0, 6.0, 24.0, 16.0),
            sliver: SliverList(
                delegate: SliverChildListDelegate(
              [
                Text(travelDateText),
                const SizedBox(height: 16.0),
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
              ],
            )),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomHeaderDelegate(
              extent: 140,
              widget: Stack(
                children: [
                  VisitsMapItem(
                      places: places,
                      visits: filteredVisits,
                      travelId: _travelId),
                  Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
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
                                        .read(travelDetailProvider(_travelId)
                                            .notifier)
                                        .selectDay(day),
                                    labelText: DateFormat.MMMEd().format(travel
                                        .startedOn
                                        .add(Duration(days: day)))),
                                const SizedBox(width: 12.0)
                              ]
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(height: 24.0),
            for (final visit in filteredVisits)
              VisitItem(places: places, visit: visit),
            const SizedBox(height: 48.0),
          ]))
        ],
      ),
      // bottomNavigationBar: BottomAppBar(child:
      //   ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       for (var day = 0; day < travelDays; day++) ...[
      //         FilledChoiceChip(
      //             isSelected: state.selectedDay == day,
      //             onSelected: (_) => ref
      //                 .read(travelDetailProvider(_travelId)
      //                 .notifier)
      //                 .selectDay(day),
      //             labelText: DateFormat.MMMEd().format(travel
      //                 .startedOn
      //                 .add(Duration(days: day)))),
      //         const SizedBox(width: 12.0)
      //       ]
      //     ],
      //   ),),
    );
  }
}
