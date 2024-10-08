import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Text title;
  final double headerHeight;
  final Widget? header;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.headerHeight,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        const toolbarHeight = kToolbarHeight;
        final expandedHeight =
            headerHeight - MediaQuery.of(context).viewPadding.top;

        final isScrolledUnder =
            constraints.scrollOffset > expandedHeight - toolbarHeight - 24;

        return SliverAppBar(
          pinned: true,
          toolbarHeight: toolbarHeight,
          title: AnimatedOpacity(
            opacity: isScrolledUnder ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: const Cubic(0.2, 0.0, 0.0, 1.0),
            child: title,
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: AnimatedOpacity(
                opacity: isScrolledUnder ? 0 : 1,
                duration: const Duration(milliseconds: 300),
                curve: const Cubic(0.2, 0.0, 0.0, 1.0),
                child: title),
            centerTitle: false,
            titlePadding: const EdgeInsets.symmetric(
                horizontal: 24.0),
            expandedTitleScale: 1.0,
          ),
          expandedHeight: expandedHeight,
        );
      },
    );
  }
}
