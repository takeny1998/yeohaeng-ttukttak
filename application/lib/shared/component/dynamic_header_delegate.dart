import 'package:flutter/material.dart';

class DynamicHeaderDelegate extends SliverPersistentHeaderDelegate {

  DynamicHeaderDelegate({required Widget widget, required double maxExtent, required double minExtent})
      : _widget = widget, _maxExtent = maxExtent, _minExtent = minExtent;

  final Widget _widget;
  final double _maxExtent;
  final double _minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _widget;
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
