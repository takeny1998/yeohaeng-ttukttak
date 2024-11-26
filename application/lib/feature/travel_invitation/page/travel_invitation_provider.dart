
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_invitation_provider.g.dart';

@riverpod
Future<void> travelInvitation(TravelInvitationRef ref, int travelId, String invitationId) async {

  final auth = await ref.read(authServiceProvider).find();

  await ref.read(httpServiceProvider).request(
    'POST',
    '/api/v2/travels/$travelId/participants',
    authorization: auth.accessToken,
    data: {
      'invitationId': invitationId,
    },
  );

  return;
}