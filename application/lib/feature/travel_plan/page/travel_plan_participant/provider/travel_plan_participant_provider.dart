import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/domain/travel_invitation/travel_invitation_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/provider/travel_plan_participant_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

part 'travel_plan_participant_provider.g.dart';

@riverpod
class TravelPlanParticipant extends _$TravelPlanParticipant {
  static const String domain = String.fromEnvironment('DOMAIN');

  @override
  TravelPlanParticipantState? build(int travelId) {
    final travel = ref.watch(travelProvider(travelId)).value;

    if (travel == null) return null;

    _fetch().then((participants) => state =
        TravelPlanParticipantState(travel: travel, participants: participants));

    return null;
  }

  Future<List<TravelParticipantModel>> _fetch() async {
    final httpService = ref.watch(httpServiceProvider);

    final response = await httpService.request(
        'GET', '/api/v2/travels/$travelId/participants');

    return TravelParticipantModel.listFromJson(response);
  }

  Future<void> shareLink() async {
    final invitation =
        await ref.read(asyncLoadingProvider.notifier).guard(() async {
      final auth = await ref.read(authServiceProvider).find();

      final response = await ref.read(httpServiceProvider).request(
            'POST',
            '/api/v2/travels/$travelId/invitations',
            authorization: auth.accessToken,
          );

      return TravelInvitationModel.fromJson(response['invitation']);
    });

    final uri = Uri(
        scheme: 'https',
        host: domain,
        path: '/travels/${invitation.travelId}/invitations/${invitation.id}');

    Share.share(uri.toString(), subject: '초대 링크 공유하기');
  }
}
