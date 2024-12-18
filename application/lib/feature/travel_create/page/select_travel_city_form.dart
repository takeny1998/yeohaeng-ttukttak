import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/travel_create/component/bottom_action_button.dart';
import 'package:application_new/feature/travel_create/component/city_list_item.dart';
import 'package:application_new/feature/travel_create/component/selected_city_item.dart';
import 'package:application_new/feature/travel_create/component/travel_region_item.dart';
import 'package:application_new/feature/travel_create/delegate/city_search_delegate.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/theme/my_chip_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/travel_create_provider.dart';

class SelectTravelCityForm extends ConsumerStatefulWidget {
  const SelectTravelCityForm({super.key});
  @override
  ConsumerState createState() => _SelectTravelCityFormState();
}

class _SelectTravelCityFormState extends ConsumerState<SelectTravelCityForm> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TravelCreateState(cities: selectedCities, region: selectedRegion) =
        ref.watch(travelCreateProvider);

    final geography = ref.watch(geographyProvider).value;

    if (geography == null) return const LoadingPage();

    final (cities, regions) = geography;

    final colorScheme = Theme.of(context).colorScheme;

    final tr = ref.watch(translationServiceProvider);

    final filteredCities = cities.where((city) {
      if (selectedRegion == null) return true;
      return city.regionId == selectedRegion.id;
    }).toList();

    ref.listen(travelCreateProvider, (prev, next) {
      if (prev?.region == next.region) return;

      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });

    final isSelected = selectedCities.isNotEmpty;

    return MyChipTheme(
        child: Scaffold(
      appBar: AppBar(
          titleSpacing: 0.0,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: TextField(
              autofocus: true,
              readOnly: true,
              onTap: () async {
                final foundCity = await showSearch(
                    context: context,
                    delegate:
                        CitySearchDelegate(cities: cities, regions: regions));

                if (foundCity == null || selectedCities.contains(foundCity)) {
                  return;
                }

                ref.read(travelCreateProvider.notifier).selectCity(foundCity);
              },
              decoration: InputDecoration(
                fillColor: colorScheme.primaryContainer,
                suffixIcon: const Icon(Icons.search),
                hintStyle: TextStyle(color: colorScheme.secondary),
                hintText: tr.from('what_city_will_you_travel'),
              ),
            ),
          ),
          scrolledUnderElevation: 0.0,
          backgroundColor: colorScheme.surface),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Column(children: [
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const SizedBox(width: 24.0),
                  TravelRegionItem(
                      name: '전체',
                      isSelected: selectedRegion == null,
                      onClick: () => ref
                          .read(travelCreateProvider.notifier)
                          .selectRegion(null)),
                  const SizedBox(width: 8.0),
                  for (final region in regions) ...[
                    TravelRegionItem(
                        name: region.shortName,
                        insignia: region.insignia,
                        isSelected: region == selectedRegion,
                        onClick: () => ref
                            .read(travelCreateProvider.notifier)
                            .selectRegion(region)),
                    const SizedBox(width: 8.0),
                  ]
                ])),
          ]),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: colorScheme.surfaceContainer))),
              height: 12.0),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                final city = filteredCities[index];
                final region =
                    regions.firstWhere((region) => region.id == city.regionId);

                return CityListItem(
                    region: region,
                    city: city,
                    isSelected: selectedCities.contains(city),
                    onSelect: () => ref
                        .read(travelCreateProvider.notifier)
                        .selectCity(city));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: colorScheme.surfaceContainer))),
        child: BottomActionButton(
          top: Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final city in selectedCities) ...[
                    SelectedCityItem(
                        city: city,
                        onCancel: () => ref
                            .read(travelCreateProvider.notifier)
                            .selectCity(city)),
                    const SizedBox(width: 12.0)
                  ]
                ],
              ),
            ),
          ),
          onPressed: isSelected
              ? ref.read(travelCreateProvider.notifier).submit
              : null,
          child: Text(isSelected
              ? tr.from('number_of_cities_selected',
                  args: ['${selectedCities.length}'])
              : tr.from('please_select_at_least_one_city')),
        ),
      ),
    ));
  }
}
