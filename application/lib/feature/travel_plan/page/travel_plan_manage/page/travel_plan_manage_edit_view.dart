import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel_visit/travel_visit_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_edit_header_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_edit_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_manage_provider.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

class TravelPlanManageEditView extends ConsumerStatefulWidget {
  final int travelId;
  final List<TravelVisitWithPlaceModel> visitPlaces;

  const TravelPlanManageEditView._({required this.travelId, required this.visitPlaces});


  static Future<void> showSheet(
      BuildContext context, {
        required int travelId,
        required List<TravelVisitWithPlaceModel> visitPlaces
      }) async =>
      showModalBottomSheet<List<TravelVisitEditModel>>(
          isScrollControlled: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          useSafeArea: true,
          enableDrag: false,
          context: context,
          builder: (context) => TravelPlanManageEditView._(travelId: travelId, visitPlaces: visitPlaces));



  @override
  ConsumerState createState() => _TravelPlanManageViewState();
}

class _TravelPlanManageViewState
    extends ConsumerState<TravelPlanManageEditView> {
  late List<DragAndDropList> groups;

  @override
  void initState() {
    super.initState();

    final groupedVisit = widget.visitPlaces.groupListsBy((visitPlace) =>
    visitPlace.visit.visitedOn);

    groups =
        groupedVisit.entries.mapIndexed<DragAndDropList>((groupIndex, entry) {
      final MapEntry(key: date, value: visits) = entry;

      return DragAndDropList(
        canDrag: false,
        header: TravelPlanEditHeaderItem(
            date: groupedVisit.keys.elementAt(groupIndex)),
        children: visits
            .mapIndexed((itemIndex, visit) => DragAndDropItem(
                key: ValueKey<int>(visit.visit.id),
                child: TravelPlanEditListItem(
                  order: itemIndex,
                  visitPlace: visit,
                  onDeleted: () {
                    setState(() => onItemDelete(groupIndex, visit.visit.id));
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
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            border: Border(
                top: BorderSide(color: colorScheme.surfaceContainerHigh)),
          ),
          child: FilledButton(onPressed: onSubmit, child: const Text('완료')),
        ),
      ),
    );
  }

  void onSubmit() async {
    final navigator = Navigator.of(context);
    final visits = groups
        .mapIndexed((dayOfTravel, group) => group.children
            .mapIndexed((orderOfVisit, child) => TravelVisitEditModel(
                id: (child.child as TravelPlanEditListItem).visitPlace.visit.id,
                orderOfVisit: orderOfVisit,
                dayOfTravel: dayOfTravel))
            .toList())
        .expand((e) => e)
        .toList();

    await ref
        .read(travelPlanManageProvider(widget.travelId).notifier)
        .edit(visits);

    eventController
        .add(MessageEvent(TranslationUtil.message('travel_plan_edited')));

    return navigator.pop(visits);
  }

  void onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = groups[oldListIndex].children.removeAt(oldItemIndex);
      groups[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  void onItemDelete(int listIndex, int itemId) {
    final item = groups[listIndex]
        .children
        .where((item) => (item.key as ValueKey<int>).value == itemId)
        .firstOrNull;

    if (item == null) return;

    final visitPlace = (item.child as TravelPlanEditListItem).visitPlace;

    final prevGroup = DragAndDropList(
      canDrag: groups[listIndex].canDrag,
      header: groups[listIndex].header,
      children: List.of(groups[listIndex].children),
    );

    setState(() => groups[listIndex].children.remove(item));
    eventController.add(MessageEvent(
        TranslationUtil.message(
          'travel_plan_item_removed',
          args: {
            'place_name': visitPlace.place.name,
          },
        ), onCancel: () {
      setState(() => groups[listIndex] = prevGroup);
    }));
  }
}
