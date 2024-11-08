import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/common/util/translation.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_provider.dart';
import 'package:application_new/feature/travel_plan/city_travels/provider/city_travels_state.dart';
import 'package:application_new/feature/travel_plan/travel_plan_recommend/component/travel_item.dart';
import 'package:application_new/shared/component/infinite_list_indicator.dart';
import 'package:application_new/shared/component/show_modal_content_sheet.dart';
import 'package:application_new/shared/component/sliver_infinite_list_indicator.dart';
import 'package:application_new/shared/model/travel/travel_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CityTravelsPage extends ConsumerStatefulWidget {
  final TravelModel travel;
  final CityModel city;

  const CityTravelsPage({super.key, required this.travel, required this.city});

  @override
  ConsumerState createState() => _CityTravelsPageState();
}

class _CityTravelsPageState extends ConsumerState<CityTravelsPage> {
  Set<TravelMotivationType> selectedMotivationTypes = {};

  @override
  Widget build(BuildContext context) {
    final CityTravelsState(:travels, :hasNextPage) =
        ref.watch(cityTravelsProvider(widget.travel, widget.city.id));


    var isMotivationTypeSelected = selectedMotivationTypes.isNotEmpty;

    final data = switch (isMotivationTypeSelected) {
      true => travels
          .where((travel) => selectedMotivationTypes
              .intersection(travel.motivationTypes.toSet())
              .isNotEmpty)
          .toList(),
      false => travels,
    };

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                const SizedBox(width: 24.0),
                FilterChip(
                    selected: isMotivationTypeSelected,
                    label: Text(isMotivationTypeSelected
                        ? '${selectedMotivationTypes.length}개 선택됨'
                        : '여행 동기'),
                    onSelected: (_) async {
                      final selectedItems =
                          await showCollectionFilterSheet<TravelMotivationType>(
                              TravelMotivationType.values, selectedMotivationTypes);

                      if (selectedItems == null) return;

                      setState(() {
                        selectedMotivationTypes = selectedItems;
                      });
                    }),
                const SizedBox(width: 16.0),
              ])),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
        SliverList.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const SizedBox(height: 56.0),
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TravelItem(travel: data[index]),
                )),
        const SliverToBoxAdapter(child: SizedBox(height: 48.0)),
        SliverInfiniteListIndicator(
            onVisible: ref
                .read(
                    cityTravelsProvider(widget.travel, widget.city.id).notifier)
                .fetch,
            hasNextPage: hasNextPage),
      ]),
    );
  }


  Future<Set<T>?> showCollectionFilterSheet<T extends Enum>(Iterable<T> values,
      Set<T> selectedValues) async {
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
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
                                    color: selectedItems.contains(
                                        item)
                                        ? colorScheme.onPrimary
                                        : colorScheme.onSurfaceVariant),
                              ),
                              onSelected: (_) =>
                                  setBottomSheetState(() {
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
                                  onPressed: () =>
                                      setBottomSheetState(
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
