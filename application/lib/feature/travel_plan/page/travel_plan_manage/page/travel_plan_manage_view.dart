import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/place/place_provider.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_label_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_edit_list_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class TravelPlanManageView extends ConsumerStatefulWidget {
  final List<TravelVisitModel> visits;

  const TravelPlanManageView({super.key, required this.visits});

  @override
  ConsumerState createState() => _TravelPlanManageViewState();
}

class _TravelPlanManageViewState extends ConsumerState<TravelPlanManageView> {
  late List<DragAndDropList> groups;

  @override
  void initState() {
    super.initState();

    final groupedVisit = widget.visits.groupListsBy((visit) => visit.visitedOn);

    groups =
        groupedVisit.entries.mapIndexed<DragAndDropList>((groupIndex, entry) {
      final MapEntry(key: date, value: visits) = entry;

      return DragAndDropList(
        canDrag: false,
        header:
            TravelPlanHeaderItem(date: groupedVisit.keys.elementAt(groupIndex)),
        children: visits
            .mapIndexed((itemIndex, visit) => DragAndDropItem(
                key: ValueKey<int>(visit.id),
                child: TravelPlanEditListItem(
                  order: itemIndex,
                  visit: visit,
                  onDeleted: () {
                    setState(() => onItemDelete(groupIndex, visit.id));
                  },
                )))
            .toList(),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: colorScheme.surfaceContainer,
      body: DragAndDropLists(
        children: groups,
        listInnerDecoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: BorderRadius.circular(8.0)),
        listPadding: const EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0),
        onItemReorder: onItemReorder,
        onListReorder: (_, __) {},
        itemDivider: Divider(color: colorScheme.surfaceContainer),
        itemDragHandle: const DragHandle(
          child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.drag_handle)),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border(
                top: BorderSide(color: colorScheme.surfaceContainerHigh)),
          ),
          child: FilledButton(
              onPressed: () {
                final visits = groups
                    .map((group) => group.children
                        .map((child) =>
                            (child.child as TravelPlanEditListItem).visit)
                        .toList())
                    .expand((e) => e)
                    .toList();

                return Navigator.of(context).pop(visits);
              },
              child: const Text('완료')),
        ),
      ),
    );
  }

  void onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = groups[oldListIndex].children.removeAt(oldItemIndex);
      groups[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  void onItemDelete(int listIndex, int itemId)  {
    final item = groups[listIndex]
        .children
        .where((item) => (item.key as ValueKey<int>).value == itemId)
        .firstOrNull;

    if (item == null) return;

    final visit = (item.child as TravelPlanEditListItem).visit;

    final prevGroup = DragAndDropList(
      canDrag: groups[listIndex].canDrag,
      header: groups[listIndex].header,
      children: List.of(groups[listIndex].children),
    );

    setState(() => groups[listIndex].children.remove(item));

   ref.read(placeProvider(visit.placeId).future).then((place) {
     eventController.add(MessageEvent(
         TranslationUtil.message(
           'travel_plan_item_removed',
           args: {
             'place_name': place.name,
           },
         ), onCancel: () {
       setState(() => groups[listIndex] = prevGroup);
     }));
   });

  }
}
