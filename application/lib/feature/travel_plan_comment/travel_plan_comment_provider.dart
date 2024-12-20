import 'dart:ffi';

import 'package:application_new/common/exception/business_exception.dart';
import 'package:application_new/common/exception/server_exception.dart';
import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/core/translation/translation_service.dart';
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
        .get( '/travels/$travelId/plans/$planId/comments');

    final comments = TravelPlanCommentModel.listFromJson(response);

    return TravelPlanCommentState(comments: comments);
  }

  Future<void> submitComment(String content) async {
    final prevState = state.value;
    if (prevState == null || content.isEmpty) return;

    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    final updatedComments = await loadingNotifier.guard(() async {
      if (prevState.editingCommentId == null) {
        return _createComment(content);
      }
      return _editComment(prevState.editingCommentId!, content);
    });

    state = AsyncValue.data(
        prevState.copyWith(content: null, comments: updatedComments));
  }

  Future<List<TravelPlanCommentModel>> _createComment(String content) async {
    final httpService = ref.read(httpServiceProvider);

    final response = await httpService.post(
      '/travels/$travelId/plans/$planId/comments',
      options: ServerRequestOptions(
        data: {'content': content},
      ),
    );
    return TravelPlanCommentModel.listFromJson(response);
  }

  Future<List<TravelPlanCommentModel>> _editComment(
      int commentId, String content) async {
    final httpService = ref.read(httpServiceProvider);

    final response = await httpService.patch(
      '/travels/$travelId/plans/$planId/comments/$commentId',
      options: ServerRequestOptions(
        data: {'content': content},
      )
    );
    return TravelPlanCommentModel.listFromJson(response);
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
    if (prevState == null) return;

    state = AsyncValue.data(
        prevState.copyWith(editingCommentId: commentId, content: content));
  }

  void cancelEditingComment() {
    final prevState = state.value;
    if (prevState == null || prevState.editingCommentId == null) return;

    state = AsyncValue.data(
        prevState.copyWith(content: null, editingCommentId: null));
  }

  Future<void> deleteComment(int commentId) async {
    final prevState = state.value;
    if (prevState == null) return;

    final foundComment = prevState.comments
        .where((comment) => comment.id == commentId)
        .firstOrNull;

    final tr = ref.read(translationServiceProvider);

    if (foundComment == null) {
      throw BusinessException(message: tr.from('No comments found to delete.'));
    }

    final loadingNotifier = ref.read(asyncLoadingProvider.notifier);

    final updatedComments = await loadingNotifier.guard(() async {
      final httpService = ref.read(httpServiceProvider);

      final response = await httpService.delete(
          '/travels/$travelId/plans/$planId/comments/$commentId');

      return TravelPlanCommentModel.listFromJson(response);
    });

    state = AsyncValue.data(prevState.copyWith(
        editingCommentId: prevState.editingCommentId == commentId
            ? null
            : prevState.editingCommentId,
        comments: updatedComments));
  }
}
