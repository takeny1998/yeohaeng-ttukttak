import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/shared/component/safe_bottom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

typedef PagedFormBottomControlViewBuilder = PagedFormBottomControlView Function(
    {required int pageIndex, required bool isInputted});

class PagedFormBottomControlView extends ConsumerWidget {
  final PageController pageController;

  final bool canSubmit, isInputted;

  final bool hasPreviousPage, hasNextPage;

  final VoidCallback? onSubmit;

  const PagedFormBottomControlView(
      {super.key,
      required this.canSubmit,
      required this.isInputted,
      required int pageIndex,
      required int pageSize,
      required this.pageController,
      this.onSubmit})
      : hasNextPage = pageIndex + 1 < pageSize,
        hasPreviousPage = pageIndex > 0;

  static PagedFormBottomControlViewBuilder create(PageController pageController,
      {required int pageSize,
      required bool canSubmit,
      required VoidCallback onSubmit}) {
    return ({required int pageIndex, required bool isInputted}) =>
        PagedFormBottomControlView(
            pageController: pageController,
            pageIndex: pageIndex,
            pageSize: pageSize,
            onSubmit: onSubmit,
            canSubmit: canSubmit,
            isInputted: isInputted);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);
    return SafeBottomView(
        child: Row(children: [
      if (hasPreviousPage)
        Expanded(
            child: OutlinedButton(
                onPressed: hasPreviousPage ? _previousPage : null,
                child: Text(tr.from('Previous')))),
      if (hasPreviousPage && hasNextPage) const SizedBox(width: 8.0),
        Expanded(
            child: FilledButton(
                onPressed: hasNextPage
                    ? (isInputted ? _nextPage : null)
                    : (canSubmit ? onSubmit : null),
                child:
                    Text(hasNextPage ? tr.from('Next') : tr.from('Submit')))),
    ]));
  }

  void _previousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
