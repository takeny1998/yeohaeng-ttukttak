import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/component/travel_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/provider/city_travels_provider.dart';
import 'package:application_new/shared/component/show_modal_content_sheet.dart';
import 'package:application_new/shared/component/sliver_infinite_list_indicator.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/city_travels_state.dart';

class CityTravelsPage extends ConsumerStatefulWidget {
  final int travelId;
  final int cityId;

  const CityTravelsPage({super.key, required this.travelId, required this.cityId});

  @override
  ConsumerState createState() => _CityTravelsPageState();
}

class _CityTravelsPageState extends ConsumerState<CityTravelsPage> {
  Set<TravelMotivationType> selectedMotivationTypes = {};
  Set<TravelCompanionType> selectedCompanionTypes = {};

  bool isMatchedTravel(TravelModel travel) {

    final motivationTypes = travel.motivationTypes;
    final companionTypes = travel.companions.map((e) => e.type).toSet();

    return IterableUtil.anyMatched(selectedMotivationTypes, motivationTypes) &&
        IterableUtil.anyMatched(selectedCompanionTypes, companionTypes);
  }

  @override
  Widget build(BuildContext context) {


    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    final state =
        ref.watch(cityTravelsProvider(widget.travelId, widget.cityId));

    if (state == null) return const LoadingPage();

    final CityTravelsState(:travels, :hasNextPage) = state;

    final isMotivationTypeSelected = selectedMotivationTypes.isNotEmpty;
    final isCompanionTypeSelected = selectedCompanionTypes.isNotEmpty;

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const SizedBox(width: 24.0),
                buildFilterOptionChip(
                    isSelected: isMotivationTypeSelected,
                    values: TravelMotivationType.active(),
                    selectedValues: selectedMotivationTypes,
                    onUpdate: (selectedItems) => setState(
                        () => selectedMotivationTypes = selectedItems)),
                const SizedBox(width: 8.0),
                buildFilterOptionChip(
                    isSelected: isCompanionTypeSelected,
                    values: TravelCompanionType.active(),
                    selectedValues: selectedCompanionTypes,
                    onUpdate: (selectedItems) =>
                        setState(() => selectedCompanionTypes = selectedItems)),
                const SizedBox(width: 24.0),
              ])),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        SliverToBoxAdapter(child: Divider(color: colorScheme.surfaceContainerHigh)),
        const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
        SliverList.builder(
            itemCount: travels.length,
            itemBuilder: (context, index) {
              // 무한 스크롤 인디케이터 크기 변화를 위해 높이 부여
              if (!isMatchedTravel(travels[index])) {
                return const SizedBox(height: 0.01);
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                child: TravelItem(travel:  travels[index]),
              );
            }),
        const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
        SliverInfiniteListIndicator(
            onVisible: ref
                .read(
                    cityTravelsProvider(widget.travelId, widget.cityId).notifier)
                .fetch,
            hasNextPage: hasNextPage),
      ]),
    );
  }

  Widget buildFilterOptionChip<T extends Enum>({
    required bool isSelected,
    required Iterable<T> values,
    required Set<T> selectedValues,
    required Function(Set<T>) onUpdate,
  }) {
    Future<void> onConfirmed() async {
      final selectedItems =
          await showCollectionFilterSheet<T>(values, selectedValues);
      if (selectedItems == null) return;
      onUpdate(selectedItems);
    }

    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return FilterChip(
        selected: isSelected,
        deleteIconColor:
            isSelected ? colorScheme.onPrimary : colorScheme.primary,
        deleteIcon: const Icon(Icons.arrow_drop_down),
        onDeleted: onConfirmed,
        label: Text(isSelected
            ? '${selectedValues.length}개 선택됨'
            : TranslationUtil.enumName<T>()),
        onSelected: (_) => onConfirmed());
  }

  Future<Set<T>?> showCollectionFilterSheet<T extends Enum>(
      Iterable<T> values, Set<T> selectedValues) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    var selectedItems = Set.of(selectedValues).toSet();

    return showModalContentSheet<Set<T>>(context,
        StatefulBuilder(builder: (context, setBottomSheetState) {
      return Theme(
        data: Theme.of(context).copyWith(
            chipTheme: ChipThemeData(
          side: BorderSide(color: colorScheme.surfaceDim),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          labelStyle:
              const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          color: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return colorScheme.primary;
            }
            return colorScheme.surface;
          }),
        )),
        child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(TranslationUtil.enumName<T>(), style: titleStyle),
                  const SizedBox(height: 24.0),
                  Wrap(spacing: 8.0, runSpacing: 6.0, children: [
                    for (final item in values)
                      FilterChip(
                          checkmarkColor: colorScheme.onPrimary,
                          selected: selectedItems.contains(item),
                          label: Text(
                            TranslationUtil.enumValue(item),
                            style: TextStyle(
                                color: selectedItems.contains(item)
                                    ? colorScheme.onPrimary
                                    : colorScheme.onSurfaceVariant),
                          ),
                          onSelected: (_) => setBottomSheetState(() {
                                if (selectedItems.contains(item)) {
                                  selectedItems.remove(item);
                                } else {
                                  selectedItems.add(item);
                                }
                              }))
                  ]),
                  const SizedBox(height: 32.0),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () => setBottomSheetState(
                                  () => selectedItems.clear()),
                              child: const Text('초기화'))),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: FilledButton(
                            onPressed: () =>
                                Navigator.of(context).pop(selectedItems),
                            child: const Text('선택 완료')),
                      ),
                    ],
                  )
                ])),
      );
    }));
  }
}
