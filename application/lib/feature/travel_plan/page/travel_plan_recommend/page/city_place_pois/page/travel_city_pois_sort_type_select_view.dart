import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/provider/city_place_pois_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelCityPoisSortTypeSelectView extends ConsumerWidget {
  final PlaceSortType sortType;

  const TravelCityPoisSortTypeSelectView._({required this.sortType});

  static Future<PlaceSortType?> showSheet(
      BuildContext context, PlaceSortType sortType) async {
    return showModalBottomSheet<PlaceSortType>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) =>
            TravelCityPoisSortTypeSelectView._(sortType: sortType));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);
    
    final tr = ref.watch(translationServiceProvider);
    
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(children: [
          const SizedBox(width: 24.0),
          Text(tr.from('Sort By'),
              style:
                  const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600))
        ]),
        const SizedBox(height: 16.0),
        for (final sortType in PlaceSortType.values)
          ListTile(
              selected: sortType == this.sortType,
              selectedColor: colorScheme.primary,
              selectedTileColor: colorScheme.primaryContainer,
              trailing: sortType == this.sortType
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.check_box_outline_blank),
              onTap: () => Navigator.of(context).pop(sortType),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              title: Text(TranslationUtil.enumValue(sortType)),
              titleTextStyle:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
      ]),
    );
  }
}
