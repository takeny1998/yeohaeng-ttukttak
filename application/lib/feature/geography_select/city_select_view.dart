import 'package:application_new/domain/geo_json/geo_json_model.dart';
import 'package:application_new/domain/geo_json/geo_json_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'geography_select_view.dart';

class CitySelectView extends ConsumerWidget {
  final int provinceId;

  const CitySelectView({super.key, required this.provinceId});

  Future<GeoJsonProvinceModel> _load(WidgetRef ref) async {
    return ref.read(geoJsonRepositoryProvider).findProvinceById(provinceId);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: _load(ref),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return GeographySelectView(
              geoJson: snapshot.data!,
              onSelect: (id) {
                print('하아');
              });
        });
  }
}
