import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'travel_invitation_provider.g.dart';

@riverpod
Future<void> travelInvitation(
    TravelInvitationRef ref, int travelId, String invitationId) async {
  await ref.read(httpServiceProvider).post('/travels/$travelId/participants',
      options: ServerRequestOptions(
        data: {
          'invitationId': invitationId,
        },
      ));

  return;
}
