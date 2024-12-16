import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/component/travel_plan_comment_list_item.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanCommentPage extends ConsumerWidget {
  final int travelId, planId;

  const TravelPlanCommentPage(
      {super.key, required this.travelId, required this.planId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(travelPlanCommentProvider(travelId, planId));

    final colorScheme = Theme.of(context).colorScheme;

    final tr = ref.watch(translationServiceProvider);

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
                      onTapOutside: (_) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      decoration:
                          InputDecoration(
                              hintText: tr.from('please_enter_a_comment'),
                              suffixIcon: const Icon(Icons.add)),
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
