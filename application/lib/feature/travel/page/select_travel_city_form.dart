import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/region/model/region_model.dart';
import 'package:application_new/feature/region/provider/region_provider.dart';
import 'package:application_new/feature/travel/component/bottom_action_button.dart';
import 'package:application_new/feature/travel/provider/create_travel_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTravelCityForm extends ConsumerWidget {
  const SelectTravelCityForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(createTravelProvider);
    final isSelected = state.cities.isNotEmpty;

    final regions = ref.watch(regionProvider);
    final selectedRegions = state.regions.isEmpty ? regions : state.regions;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final titleStyle =
        textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600);

    final cityStyle =
        textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

    final citySubStyle =
        textTheme.bodyMedium?.copyWith(color: colorScheme.secondary);

    final trKey = baseKey('travel.select_city');

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(106),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(width: 24),
                  Text(trKey('ask_city'), style: titleStyle).tr(),
                ],
              ),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 24),
                    for (RegionModel region in regions) ...[
                      FilterChip(
                        label: Text(region.name),
                        selected: state.regions.contains(region),
                        onSelected: (_) => ref
                            .read(createTravelProvider.notifier)
                            .selectRegion(region),
                      ),
                      const SizedBox(width: 8),
                    ]
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (RegionModel region in selectedRegions)
            for (RegionModel city in region.children ?? [])
              CheckboxListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                title: Text(city.name, style: cityStyle),
                subtitle: Text('${region.name} · ${'korea'.tr()}',
                    style: citySubStyle),
                value: state.cities.contains(city),
                onChanged: (_) =>
                    ref.read(createTravelProvider.notifier).selectCity(city),
              )
        ],
      )),
      bottomNavigationBar: BottomActionButton(
          onPressed: isSelected
              ? () => ref.read(createTravelProvider.notifier).submit()
              : null,
          child: isSelected
              ? Text(trKey('display_select'))
                  .tr(args: ['${state.cities.length}'])
              : Text(trKey('require_select')).tr()),
    );
  }
}

class SampleHeaderDelegate extends SliverPersistentHeaderDelegate {
  SampleHeaderDelegate({required this.widget});

  Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
