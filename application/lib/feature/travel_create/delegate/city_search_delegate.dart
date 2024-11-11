import 'package:application_new/feature/geography/model/city_model.dart';
import 'package:application_new/feature/geography/model/region_model.dart';
import 'package:application_new/shared/model/image_model.dart';
import 'package:flutter/material.dart';

final class CitySearchDelegate extends SearchDelegate<CityModel> {
  final List<CityModel> cities;
  final List<RegionModel> regions;

  List<CityModel> selectedCities = [];

  CitySearchDelegate(
      {super.searchFieldLabel,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      required this.cities,
      required this.regions})
      : super(searchFieldStyle: const TextStyle(fontSize: 18.0));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResult();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildResult();
  }

  Widget _buildResult() {
    final filteredCities = query.isNotEmpty
        ? cities.where((city) => city.name.startsWith(query)).toList()
        : [];

    return ListView.builder(
      itemCount: filteredCities.length,
      itemBuilder: (context, index) {
        final city = filteredCities[index];
        final region =
            regions.firstWhere((region) => region.id == city.regionId);

        final ImageModel(:path, :name, :ext) = city.insignia;
        final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

        final titleStyle =
            textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

        final otherName = city.name.replaceFirst(query, '');

        return ListTile(
            onTap: () => close(context, city),
            leading: CircleAvatar(
              radius: 24.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network('https://host.tatine.kr$path/$name.$ext'),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            title: RichText(
                text: TextSpan(style: titleStyle, children: [
              TextSpan(
                  text: query, style: TextStyle(color: colorScheme.primary)),
              TextSpan(text: otherName)
            ])),
            subtitle: Text(
              region.name,
              style:
                  textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
            ));
      },
    );
  }
}
