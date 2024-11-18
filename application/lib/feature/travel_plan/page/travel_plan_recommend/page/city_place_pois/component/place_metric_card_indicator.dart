import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../provider/city_place_pois_provider.dart';
import '../provider/city_place_pois_state.dart';

class PlaceMetricCardIndicator extends ConsumerWidget {

  final int cityId;
  final PlaceSortType sortType;

  const PlaceMetricCardIndicator(this.cityId, this.sortType, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    return VisibilityDetector(
      key: const ValueKey('card-indicator'),
      onVisibilityChanged: (info) {
        final isVisible = info.visibleFraction == 1.0;
        if (!isVisible) return;
        ref.read(cityPlacePoisProvider(cityId, sortType).notifier).fetch();
      },
      child: Container(
        decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(8.0)),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
