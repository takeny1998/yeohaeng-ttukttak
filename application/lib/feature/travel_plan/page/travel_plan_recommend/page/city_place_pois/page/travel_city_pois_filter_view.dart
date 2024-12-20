
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/component/travel_city_pois_type_filter_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelCityPoisFilterView extends ConsumerWidget {

  final int travelId;
  final int cityId;
  final PlaceSortType sortType;

  final CityPlacePoisState state;

  const TravelCityPoisFilterView({super.key, required this.travelId, required this.cityId, required this.sortType, required this.state});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tr = ref.watch(translationServiceProvider);
    final CityPlacePoisState(:selectedTypes, :travel) = state;

  return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          const SizedBox(width: 24.0),
          FilterChip(
              label: Text(tr.from('All')),
              selected: selectedTypes.isEmpty,
              onSelected: (isSelected) {
                if (!isSelected) return;
                ref.read(CityPlacePoisProvider(travelId, cityId,
                    sortType).notifier).clearCategoryTypes();
              }),
          const SizedBox(width: 12.0),
          for (final categoryType in PlaceCategoryType.pois()) ...[
            TravelCityPoisTypeFilterItem(categoryType: categoryType,
              onDelete: (_) => ref.read(CityPlacePoisProvider(travel.id, cityId,
                  sortType).notifier).selectCategoryType(categoryType) , onSelect: (_) =>
                  ref.read(CityPlacePoisProvider(travelId, cityId,
                      sortType).notifier).selectCategoryType(categoryType) , isSelected: selectedTypes.contains(categoryType),),
            const SizedBox(width: 12.0),
          ],
          const SizedBox(width: 12.0),
        ]));
  }
}
