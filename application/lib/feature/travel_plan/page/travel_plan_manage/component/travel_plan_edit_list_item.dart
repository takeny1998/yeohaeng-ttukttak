import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_provider.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanEditListItem extends ConsumerWidget {

  final int order;
  final TravelVisitModel visit;
  final VoidCallback onDeleted;

  const TravelPlanEditListItem({super.key, required this.onDeleted, required this.order, required this.visit});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final place = ref.watch(placeProvider(visit.placeId)).value;

    const titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0);
    const subTitleStyle = TextStyle(fontSize: 13.0);

    var categoryName =
        TranslationUtil.enumValue(place?.categoryTypes.firstOrNull);
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      title: Row(
        children: [
          Text(place?.name ?? '', style: titleStyle),
          const SizedBox(width: 6.0),
          Text(categoryName, style: const TextStyle(fontSize: 12.0))
        ],
      ),

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text(
          place?.address.value ?? '',
          style: subTitleStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      // subTitle Gap을 위한 더미 아이콘s
      trailing: Padding(
        padding: const EdgeInsets.only(right: 34.0),
        child: IconButton(
            onPressed: onDeleted,
            color: colorScheme.error,
            icon: const Icon(Icons.delete_outline, size: 21.0)),
      ),
    );
  }
}
