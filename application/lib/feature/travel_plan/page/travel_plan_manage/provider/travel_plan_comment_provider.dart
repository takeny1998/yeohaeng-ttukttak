import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_manage/provider/travel_plan_comment_state.dart';
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

  
}
