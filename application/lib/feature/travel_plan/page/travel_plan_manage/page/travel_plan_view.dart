import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_provider.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_list_drag_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/page/travel_plan_comment_view.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:application_new/shared/component/outlined_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanView extends ConsumerWidget {
  final int index;
  final TravelPlanModel plan;

  final TravelPlanManageProvider provider;

  final VoidCallback? onDelete;

  const TravelPlanView(
      {super.key,
      required this.provider,
      required this.index,
      required this.plan,
      this.onDelete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final draggingIndex = ref.watch(provider)?.draggingIndex;

    if (draggingIndex == index) {
      return const SizedBox();
    }

    const titleStyle =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0, height: 1.0);
    const subTitleStyle = TextStyle(fontSize: 12.0);

    final place = ref.watch(placeProvider(plan.placeId)).value;

    final categoryName =
    TranslationUtil.enumValue(place?.categoryTypes.firstOrNull);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 24.0),
          Column(
            children: [
              CircleAvatar(
                  radius: 16.0,
                  backgroundColor: colorScheme.primaryContainer,
                  child: Text('${index + 1}',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: colorScheme.primary))),
              Expanded(
                  child: Container(
                      width: 1.0, color: colorScheme.primaryContainer)),
            ],
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(place?.name ?? '', style: titleStyle),
                              const SizedBox(width: 6.0),
                              Text(categoryName,
                                  style: const TextStyle(fontSize: 12.0)),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(place?.address.value ?? '',
                              style: subTitleStyle,
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24.0),
                    Draggable<TravelPlanModel>(
                        key: ValueKey<int>(plan.id),
                        data: plan,
                        onDragStarted: () {
                          ref.read(provider.notifier).updateDraggingIndex(index);
                        },
                        onDragEnd: (_) {
                          ref.read(provider.notifier).updateDraggingIndex(null);
                        },
                        onDragCompleted: () {
                          ref.read(provider.notifier).updateDraggingIndex(null);
                        },
                        onDraggableCanceled: (_, __) =>
                            ref.read(provider.notifier).updateDraggingIndex(null),
                        feedback: TravelPlanListDragItem(place: place),
                        child: const Icon(Icons.drag_handle)),
                    const SizedBox(width: 16.0),
                  ],
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 4.0,
                  children: [
                    OutlinedIconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.rate_review_outlined)),
                    OutlinedIconButton(
                        onPressed: onDelete,
                        foregroundColor: colorScheme.error,
                        icon: const Icon(Icons.delete_outline)),
                  ],
                ),
                if (draggingIndex == null) ...[
                  TravelPlanCommentView(
                      travelId: provider.travelId, planId: plan.id),
                ],
                const SizedBox(height: 48.0),
              ],
            ),
          ),
          const SizedBox(width: 24.0),
        ],
      ),
    );
  }

}
