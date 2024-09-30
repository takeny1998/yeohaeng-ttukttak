import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/travel/component/bottom_action_button.dart';
import 'package:application_new/feature/travel/component/city_list_item.dart';
import 'package:application_new/feature/travel/provider/create_travel_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTravelCityForm extends ConsumerStatefulWidget {
  const SelectTravelCityForm({super.key});
  @override
  ConsumerState createState() => _SelectTravelCityFormState();
}

class _SelectTravelCityFormState extends ConsumerState<SelectTravelCityForm> {
  final cityNameController = TextEditingController();

  @override
  void dispose() {
    cityNameController.dispose();
    super.dispose();
  }

  bool filterCity(CityModel city) {
    final regions = ref.watch(createTravelProvider).regions;
    final citySearchText = ref.watch(createTravelProvider).citySearchText;

    final regionIds = regions.map((region) => region.id).toList();

    if (regionIds.isNotEmpty) {
      return regionIds.contains(city.regionId);
    }
    if (citySearchText != null) {
      return city.name.startsWith(citySearchText);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final selectedCities = ref.watch(createTravelProvider).cities;
    final selectedRegions = ref.watch(createTravelProvider).regions;

    final geographyState = ref.watch(geographyProvider);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final trKey = baseKey('travel.select_city');

    final filteredCities = geographyState.cities.where(filterCity).toList();

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: colorScheme.surface,
          scrolledUnderElevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(156),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(trKey('ask_city'), style: titleStyle).tr(),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: cityNameController,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: '검색할 도시를 입력해 주세요.',
                    ),
                    onChanged:
                        ref.read(createTravelProvider.notifier).searchCity,
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    const SizedBox(width: 24),
                    for (final region in geographyState.regions) ...[
                      FilterChip(
                        label: Text(region.shortName),
                        selected: selectedRegions.contains(region),
                        onSelected: (_) => ref
                            .read(createTravelProvider.notifier)
                            .selectRegion(region),
                      ),
                      const SizedBox(width: 8),
                    ]
                  ]),
                ),
                const SizedBox(height: 8),
              ],
            ),
          )),
      body: ListView.builder(
        itemCount: filteredCities.length,
        itemBuilder: (context, index) {
          final city = filteredCities[index];
          final region = geographyState.regions
              .firstWhere((region) => region.id == city.regionId);
          return CityListItem(region: region, city: city);
        },
      ),
      bottomNavigationBar: BottomActionButton(
          onPressed: selectedCities.isNotEmpty
              ? () => ref.read(createTravelProvider.notifier).submit()
              : null,
          child: selectedCities.isNotEmpty
              ? Text(trKey('display_select'))
                  .tr(args: ['${selectedCities.length}'])
              : Text(trKey('require_select')).tr()),
    );
  }
}
