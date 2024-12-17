import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/shared/component/action_sheet_group_item.dart';
import 'package:application_new/shared/component/action_sheet_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActionSheet extends ConsumerWidget {
  final List<ActionSheetItem> items;

  const ActionSheet._({required this.items});

  static void show(
    BuildContext context, {
    required List<ActionSheetItem> items,
  }) {
    showModalBottomSheet(
        enableDrag: false,
        useSafeArea: true,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => ActionSheet._(items: items));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ActionSheetGroupItem(items: items),
        const SizedBox(height: 16.0),
        ActionSheetGroupItem(items: [
          ActionSheetItem(
              title: tr.from('Close'),
              onAction: Navigator.of(context).pop)
        ]),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
