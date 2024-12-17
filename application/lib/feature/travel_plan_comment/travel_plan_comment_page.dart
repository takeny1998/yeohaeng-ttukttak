import 'package:application_new/common/exception/server_exception.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_list_item.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanCommentPage extends ConsumerWidget {
  final int travelId, planId;

  final contentController = TextEditingController();
  final contentFocusNode = FocusNode();

  TravelPlanCommentPage(
      {super.key, required this.travelId, required this.planId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = travelPlanCommentProvider(travelId, planId);
    final state = ref.watch(provider);

    final colorScheme = Theme.of(context).colorScheme;

    final tr = ref.watch(translationServiceProvider);

    // 댓글 수정을 위한 리스너
    ref.listen(provider, (prev, next) {
      if (!next.hasValue) return;
      final content = next.value?.content;

      if (content != null) {
        contentController.text = content;
        FocusScope.of(context).requestFocus(contentFocusNode);
      } else {
        contentController.text = '';
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.from('number_of_comment',
            args: ['${state.value?.comments.length ?? '0'}'])),
      ),
      body: SafeArea(
        child: state.when(
            data: (data) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.all(24.0),
                      itemCount: data.comments.length,
                      itemBuilder: (context, index) =>
                          TravelPlanCommentListItem(
                              provider: provider,
                              comment: data.comments[index]),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: colorScheme.surfaceContainerHighest,
                                width: 1.0))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    child: TextFormField(
                      controller: contentController,
                      focusNode: contentFocusNode,
                      onTapOutside: (_) {
                        contentController.clear();
                        ref.read(provider.notifier).cancelEditingComment();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      decoration: InputDecoration(
                          hintText: tr.from('please_enter_a_comment'),
                          errorText: data.fieldErrors['content'],
                          suffixIcon: const Icon(Icons.add)),
                      onFieldSubmitted: (content) {
                        final notifier = ref.read(provider.notifier);

                        notifier.submitComment(content).catchError((error, _) {
                          if (error is ServerFailException) {
                            notifier.consumeFieldError(error);
                            return;
                          }
                          throw error;
                        });

                        contentController.clear();
                      },
                      enabled: !state.isLoading,
                    ),
                  )
                ],
              );
            },
            error: (error, _) => throw error,
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
