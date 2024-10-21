import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel/component/bottom_action_button.dart';
import 'package:application_new/feature/travel/component/city_list_item.dart';
import 'package:application_new/feature/travel/component/selected_city_item.dart';
import 'package:application_new/feature/travel/component/travel_region_item.dart';
import 'package:application_new/feature/travel/delegate/city_search_delegate.dart';
import 'package:application_new/feature/travel/provider/create_travel_state.dart';
import 'package:application_new/feature/travel/provider/create_travel_provider.dart';
import 'package:application_new/shared/component/filled_chip_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final CreateTravelState(cities: selectedCities, region: selectedRegion) =
        ref.watch(createTravelProvider);

    final geographyState = ref.watch(geographyProvider);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    const titleStyle = TextStyle(fontSize: 21.0, fontWeight: FontWeight.w600);

    final trKey = baseKey('travel.select_city');

    final filteredCities = geographyState.cities.where((city) {
      if (selectedRegion == null) return true;
      return city.regionId == selectedRegion.id;
    }).toList();

    ref.listen(createTravelProvider, (prev, next) {
      if (prev?.region == next.region) return;

      scrollController.animateTo(0.0,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });

    return FilledChipTheme(
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
                      delegate: CitySearchDelegate(
                          cities: geographyState.cities,
                          regions: geographyState.regions));

                  if (foundCity == null || selectedCities.contains(foundCity)) {
                    return;
                  }

                  ref.read(createTravelProvider.notifier).selectCity(foundCity);
                },
                decoration: InputDecoration(
                  fillColor: colorScheme.primaryContainer,
                  suffixIcon: const Icon(Icons.search),
                  hintStyle: TextStyle(color: colorScheme.secondary),
                  hintText: trKey('ask_city').tr(),
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
                            .read(createTravelProvider.notifier)
                            .selectRegion(null)),
                    const SizedBox(width: 8.0),
                    for (final region in geographyState.regions) ...[
                      TravelRegionItem(
                          name: region.shortName,
                          insignia: region.insignia,
                          isSelected: region == selectedRegion,
                          onClick: () => ref
                              .read(createTravelProvider.notifier)
                              .selectRegion(region)),
                      const SizedBox(width: 8.0),
                    ]
                  ])),
            ]),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: colorScheme.surfaceContainer))),
                height: 12.0),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  final city = filteredCities[index];
                  final region = geographyState.regions
                      .firstWhere((region) => region.id == city.regionId);

                  return CityListItem(
                      region: region,
                      city: city,
                      isSelected: selectedCities.contains(city),
                      onSelect: () => ref
                          .read(createTravelProvider.notifier)
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
                                .read(createTravelProvider.notifier)
                                .selectCity(city)),
                        const SizedBox(width: 12.0)
                      ]
                    ],
                  ),
                ),
              ),
              onPressed: selectedCities.isNotEmpty
                  ? () => ref.read(createTravelProvider.notifier).submit()
                  : null,
              child: selectedCities.isNotEmpty
                  ? Text(trKey('display_select'))
                      .tr(args: ['${selectedCities.length}'])
                  : Text(trKey('require_select')).tr()),
        ),
      ),
    );
  }
}
