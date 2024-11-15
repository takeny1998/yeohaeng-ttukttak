import 'package:application_new/common/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanEditHeaderItem extends ConsumerWidget {
  final DateTime? date;

  const TravelPlanEditHeaderItem({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
          date != null ? DateUtil.formatter('MMMEd').date(date!) : '분류 없음',
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
    );
  }
}
