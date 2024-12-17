import 'dart:async';

import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/domain/travel/travel_plan/travel_plan_comment_model.dart';

final class TravelPlanCommentRepository {

  final HttpService httpService;

  TravelPlanCommentRepository(this.httpService);

  Future<List<TravelPlanCommentModel>> create(int travelId, int planId, String content) async {
    // TODO: implement create
    throw UnimplementedError();
  }

  Future<List<TravelPlanCommentModel>> delete(int travelId, int planId, int commentId) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<List<TravelPlanCommentModel>> edit(int travelId, int planId, int commentId, String content) async {
    // TODO: implement edit
    throw UnimplementedError();
  }

  Future<List<TravelPlanCommentModel>> findAll(int travelId, int planId) async {
    // TODO: implement findAll
    throw UnimplementedError();
  }
}