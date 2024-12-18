import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/domain/geo_json/geo_json_repository.dart';
import 'package:application_new/feature/geography_select/city_select_view.dart';
import 'package:application_new/feature/geography_select/geography_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProvinceSelectView extends ConsumerWidget {
  const ProvinceSelectView({super.key});

  Future<GeoJsonCountryModel> _load(WidgetRef ref) async {
    return ref.read(geoJsonRepositoryProvider).getCountry();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<GeoJsonCountryModel>(
        future: _load(ref),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return GeographySelectView(
              geoJson: snapshot.data!,
              onSelect: (id) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Scaffold(
                        appBar: AppBar(),
                        body: CitySelectView(provinceId: id))));
              });
        });
  }
}
