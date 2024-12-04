import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/domain/travel_visit/travel_visit_repository.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_date_range_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/component/travel_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanAddView extends ConsumerStatefulWidget {
  final TravelModel travel;
  final PlaceModel place;

  const TravelPlanAddView._({required this.travel, required this.place});

  static Future<void> showSheet(
    BuildContext context, {
    required TravelModel travel,
    required PlaceModel place,
  }) async =>
      showModalBottomSheet<List<TravelVisitEditModel>>(
          isScrollControlled: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          useSafeArea: true,
          enableDrag: false,
          context: context,
          builder: (context) =>
              TravelPlanAddView._(travel: travel, place: place));

  @override
  ConsumerState createState() => _TravelPlanAddViewState();
}

class _TravelPlanAddViewState extends ConsumerState<TravelPlanAddView> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.travel.startedOn;
  }

  @override
  Widget build(BuildContext context) {
    final (travel, place) = (widget.travel, widget.place);

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TravelInfoItem(travel: travel),
              ),
              const SizedBox(height: 24.0),
              TravelDateRangeView(
                  travel: travel,
                  selectedDate: selectedDate,
                  onChangeDate: (date) => setState(() => selectedDate = date)),
              const SizedBox(height: 24.0),
            ],
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                  top: BorderSide(color: colorScheme.surfaceContainerHigh)),
            ),
            child: FilledButton(
                onPressed: () async {
                  final dayOfTravel =
                      selectedDate.difference(travel.startedOn).inDays;

                  final navigator = Navigator.of(context);

                  await ref.read(travelVisitRepositoryProvider).create(
                      travel.id,
                      TravelVisitForm(
                          placeId: place.id, dayOfTravel: dayOfTravel));

                  ref.invalidate(travelPlanManageProvider(travel.id));

                  final message = ref
                      .read(translationServiceProvider)
                      .from('place_has_been_added_to_plan', args: [place.name]);

                  eventController.add(MessageEvent(message));
                  navigator.pop();
                },
                child: const Text('완료')),
          ),
        ],
      ),
    );
  }
}
