import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:application_new/feature/travel_invitation/page/travel_invitation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TravelInvitationPage extends ConsumerWidget {
  final int travelId;
  final String invitationId;

  const TravelInvitationPage(
      {super.key, required this.travelId, required this.invitationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      travelInvitationProvider(travelId, invitationId),
      (prev, next) => next.whenOrNull(
        data: (_) async {

          final goRouter = GoRouter.of(context);

          final travel = await ref.watch(travelProvider(travelId).future);

          eventController.add(MessageEvent(TranslationUtil.message(
              'joined_travel_successfully',
              args: {'travel_name': travel.formattedName})));

          goRouter.replace('/travels/:$travelId');
        },
        error: (error, stack) {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/');
          }
          throw error;
        },
      ),
    );

    return const LoadingPage();
  }
}
