import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class InfiniteListIndicator extends StatelessWidget {
  final double visibleThreshold;
  final VoidCallback onVisible;
  final bool hasNextPage;

  const InfiniteListIndicator({
    super.key,
    required this.onVisible,
    required this.hasNextPage,
    this.visibleThreshold = 0.01,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData(:textTheme, :colorScheme) = Theme.of(context);

    if (!hasNextPage) return const Placeholder();

    return VisibilityDetector(
      key: const Key('sliver-infinite-list-indicator'),
      onVisibilityChanged: (info) {
        final isVisible = info.visibleFraction >= visibleThreshold;
        if (!isVisible) return;
        onVisible();
      },
      child: Container(
        color: colorScheme.surface,
        constraints: const BoxConstraints(minHeight: 120.0),
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
