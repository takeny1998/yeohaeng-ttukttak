import 'package:application_new/feature/geography_select/province_city_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelCitySelectView extends ConsumerWidget {
  final VoidCallback onCancel;

  const TravelCitySelectView({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: onCancel,
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 24.0),
          Expanded(child: ProvinceCitySelectView(countryId: 0)),

          const SizedBox(height: 24.0),
        ]),
      ),
    );
  }
}
