import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/feature/geography_select/province_city_select_provider.dart';
import 'package:application_new/feature/geography_select/province_city_select_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedCitiesListSheet extends ConsumerWidget {
  final ProvinceCitySelectState state;

  const SelectedCitiesListSheet._({required this.state});

  static void showSheet(
    BuildContext context, {
    required ProvinceCitySelectState state,
  }) =>
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
        ),
        builder: (context) => SelectedCitiesListSheet._(state: state),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProvinceCitySelectState(:selectedCities) = state;
    final colorScheme = Theme.of(context).colorScheme;

    final tr = ref.watch(translationServiceProvider);

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 24.0),
        physics: const ClampingScrollPhysics(),
        itemCount: selectedCities.length,
        itemBuilder: (context, index) {
          final cityRef = selectedCities.get(index);

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            leading: CircleAvatar(
              radius: 16.0,
              backgroundColor: colorScheme.surfaceContainer,
              child: Text('${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.w800)),
            ),
            title: Text(
              cityRef.entity.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(cityRef.reference.name),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(color: colorScheme.error, Icons.delete_outlined)),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: colorScheme.surfaceContainerHighest))),
          padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
          child:
              FilledButton(onPressed: () {}, child: Text(tr.from('Confirm'))),
        ),
      ),
    );
  }
}
