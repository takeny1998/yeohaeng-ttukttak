import 'package:application_new/shared/component/infinite_list_indicator.dart';
import 'package:flutter/material.dart';

class SliverInfiniteListIndicator extends StatelessWidget {
  final double visibleThreshold;
  final VoidCallback onVisible;
  final bool hasNextPage;

  const SliverInfiniteListIndicator({
    super.key,
    required this.onVisible,
    required this.hasNextPage,
    this.visibleThreshold = 0.01,
  });

  @override
  Widget build(BuildContext context) {
    if (!hasNextPage) return const SliverToBoxAdapter(child: SizedBox());

    return SliverFillRemaining(
        hasScrollBody: false,
        child: InfiniteListIndicator(
            onVisible: onVisible, hasNextPage: hasNextPage));
  }
}
