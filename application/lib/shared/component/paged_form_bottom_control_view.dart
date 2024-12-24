import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/shared/component/safe_bottom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PagedFormBottomControlView extends ConsumerWidget {
  final PageController pageController;

  final bool isInputted;

  final bool hasPreviousPage, hasNextPage;
  final VoidCallback? onPreviousPage, onNextPage;

  final VoidCallback? onSubmit;

  const PagedFormBottomControlView(
      {super.key,
      required this.isInputted,
      required PageController controller,
      this.onPreviousPage,
      this.onNextPage,
      this.onSubmit,
      this.hasNextPage = true,
      this.hasPreviousPage = true})
      : pageController = controller;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);

    return SafeBottomView(
        child: Row(children: [
      Expanded(
          child: OutlinedButton(
              onPressed: hasPreviousPage ? _previousPage : null,
              child: Text(tr.from('Previous')))),
      const SizedBox(width: 8.0),
      Expanded(
          child: FilledButton(
              onPressed: isInputted ? _nextPage : null,
              child: Text(hasNextPage ? tr.from('Next') : tr.from('Submit')))),
    ]));
  }
  
  void _previousPage() {
    onPreviousPage?.call();
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _nextPage() {
    if (!hasNextPage) {
      onSubmit?.call();
      return;
    }

    onNextPage?.call();
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
