import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/shared/component/safe_bottom_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagedFormBottomControlView extends ConsumerStatefulWidget {
  final PageController pageController;

  final bool isInputted;

  final bool hasPreviousPage, hasNextPage;
  final VoidCallback? onPreviousPage, onNextPage;

  const PagedFormBottomControlView({
    super.key,
    required this.isInputted,
    required PageController controller,
    this.onPreviousPage,
    this.onNextPage,
    this.hasNextPage = true,
    this.hasPreviousPage = true
  }) : pageController = controller;

  @override
  ConsumerState createState() => _PagedFormBottomControlViewState();
}

class _PagedFormBottomControlViewState
    extends ConsumerState<PagedFormBottomControlView> {


  void _previousPage() {
    widget.onPreviousPage?.call();
    widget.pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _nextPage() {
    widget.onNextPage?.call();
    widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final tr = ref.watch(translationServiceProvider);

    return SafeBottomView(
        child: Row(children: [
          Expanded(
              child: OutlinedButton(
                  onPressed: widget.hasPreviousPage ? _previousPage : null,
                  child: Text(tr.from('Previous')))),
          const SizedBox(width: 8.0),
          Expanded(
              child: FilledButton(
                  onPressed: widget.hasNextPage && widget.isInputted ? _nextPage : null,
                  child: Text(widget.hasNextPage ? tr.from('Next') : tr.from('Submit')))),
        ]));
  }
}
