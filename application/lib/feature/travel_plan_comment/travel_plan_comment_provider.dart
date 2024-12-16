import 'dart:ffi';

import 'package:application_new/common/exception/server_exception.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:application_new/feature/authentication/model/auth_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/travel_plan_comment/travel_plan_comment_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_plan_comment_provider.g.dart';

@riverpod
class TravelPlanComment extends _$TravelPlanComment {
  @override
  Future<TravelPlanCommentState> build(int travelId, int planId) async {
    final response = await ref
        .watch(httpServiceProvider)
        .request('GET', '/api/v2/travels/$travelId/plans/$planId/comments');

    final comments = TravelPlanCommentModel.listFromJson(response);

    return TravelPlanCommentState(comments: comments);
  }

  Future<void> submitComment(String content) async {
    final prevState = state.value;
    if (prevState == null || content.isEmpty) return;

    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    final updatedComments = await loadingNotifier.guard(() async {
      final httpService = ref.read(httpServiceProvider);

      final AuthModel(:accessToken) =
          await ref.read(authServiceProvider).find();

      if (prevState.editingCommentId != null) {
        final response = await httpService.request('PATCh',
            '/api/v2/travels/$travelId/plans/$planId/comments/${prevState.editingCommentId}',
            authorization: accessToken, data: {'content': content});
        return TravelPlanCommentModel.listFromJson(response);
      } else {
        final response = await httpService.request(
            'POST', '/api/v2/travels/$travelId/plans/$planId/comments',
            authorization: accessToken, data: {'content': content});
        return TravelPlanCommentModel.listFromJson(response);
      }
    });

    state = AsyncValue.data(prevState.copyWith(
        content: null,
        comments: updatedComments));
  }

  Future<void> consumeFieldError(ServerFailException exception) async {
    exception.consumeFieldErrors((fieldErrors) {
      state = AsyncValue.data(
        state.value!.copyWith(
          fieldErrors: fieldErrors,
        ),
      );
    });
  }

  void startEditingComment(int commentId, String content) {
    final prevState = state.value;
    if (prevState == null || prevState.editingCommentId != null) return;

    state = AsyncValue.data(prevState.copyWith(
        content: content,
        editingCommentId: commentId));
  }

  void cancelEditingComment() {
    final prevState = state.value;
    if (prevState == null || prevState.editingCommentId == null) return;

    state = AsyncValue.data(prevState.copyWith(
        content: '',
        editingCommentId: null));
  }

  Future<void> editComment(String newContent) async {
    final prevState = state.value;
    if (prevState == null || newContent.isEmpty) return;
  }
}
