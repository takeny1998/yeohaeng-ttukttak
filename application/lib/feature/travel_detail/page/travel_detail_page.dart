import 'package:application_new/common/component/custom_header_delegate.dart';
import 'package:application_new/common/component/custom_sliver_app_bar.dart';
import 'package:application_new/common/component/filled_chip.dart';
import 'package:application_new/common/component/filled_choice_chip.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/travel_detail/components/companion_item.dart';
import 'package:application_new/feature/travel_detail/components/visit_item.dart';
import 'package:application_new/feature/travel_detail/model/travel_detail_model.dart';
import 'package:application_new/feature/travel_detail/provider/travel_detail_provider.dart';
import 'package:application_new/shared/travel/model/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelDetailPage extends ConsumerWidget {
  final int _travelId;

  final MapController _mapController = MapController();

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

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                extent: 380,
                widget: Container(
                  decoration: BoxDecoration(color: colorScheme.surface),
                  child: Column(
                    children: [
                      Expanded(
                        child:
                            FlutterMap(mapController: _mapController, children: [
                          TileLayer(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png"),
                        ]),
                      ),
                      const SizedBox(height: 24.0),
                      SizedBox(
                          height: 40,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Row(
                              children: [
                                for (var day = 0; day < travelDays; day++) ...[
                                  FilledChoiceChip(
                                      isSelected: state.selectedDay == day,
                                      onSelected: (_) => ref
                                          .read(travelDetailProvider(_travelId)
                                              .notifier)
                                          .selectDay(day),
                                      labelText: DateFormat.yMMMEd().format(travel
                                          .startedOn
                                          .add(Duration(days: day)))),
                                  const SizedBox(width: 12.0)
                                ]
                              ],
                            ),
                          )),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(height: 24.0),
              for (int i = 0; i < visits.length; i++)
                if (visits[i].visitedOn == selectedDay)
                  VisitItem(index: i, travelId: _travelId),
              const SizedBox(height: 48.0),
            ]))
          ],
        ),
      ),
    );
  }
}
