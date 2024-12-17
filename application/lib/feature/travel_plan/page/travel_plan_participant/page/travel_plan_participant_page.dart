import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/session/session_model.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/domain/member/member_provider.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/feature/profile/profile_avatar.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/component/travel_member_list_item.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/provider/travel_plan_participant_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/provider/travel_plan_participant_state.dart';
import 'package:application_new/shared/component/travel_companion_avatar_item.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanParticipantPage extends ConsumerWidget {
  final int travelId;

  const TravelPlanParticipantPage({super.key, required this.travelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final tr = ref.watch(translationServiceProvider);

    final state = ref.watch(travelPlanParticipantProvider(travelId));
    if (state == null) return const LoadingPage();

    final TravelPlanParticipantState(:travel, :participants) = state;
    final SessionModel(member: me) = ref.watch(sessionProvider);

    final owner = ref.watch(memberProvider(travel.memberId)).value;

    final otherParticipants = participants
        .where((participant) => participant.inviteeId != me?.uuid)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text(tr.from('Travel Participants'))),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tr.from('Invite new participant'),
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4.0),
                  Text(tr.from('You can invite participants by sharing this link.')),
                  const SizedBox(height: 2.0),
                  Text(tr.from('The invitation link expire after 30 minutes.')),
                  const SizedBox(height: 2.0),
                  Text(tr.from('You can plan the travel with participants.')),
                  const SizedBox(height: 16.0),
                  FilledButton.tonalIcon(
                    onPressed: () => ref
                        .read(travelPlanParticipantProvider(travel.id).notifier)
                        .shareLink(),
                    label: Text(tr.from('Share invitation link')),
                    icon: const Icon(Icons.link),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 32.0),
              color: colorScheme.surfaceContainer,
              height: 8.0,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            TravelMemberListItem(
              travel: travel,
              member: me,
              trailing: owner?.uuid != me?.uuid
                  ? FilledButton.tonal(
                      onPressed: () {
                        final participant = participants
                            .where((participant) =>
                                participant.inviteeId == me?.uuid)
                            .firstOrNull;
                        if (participant == null) return;

                        ref
                            .read(travelPlanParticipantProvider(travelId)
                                .notifier)
                            .leaveOrKick(participant.id);
                      },
                      child: Text(tr.from('Leave')),
                    )
                  : null,
            ),
            if (owner?.uuid != me?.uuid)
              TravelMemberListItem(travel: travel, member: owner),
          ])),
          SliverList.builder(
              itemCount: otherParticipants.length,
              itemBuilder: (context, index) {
                final participant = otherParticipants[index];

                final invitee =
                    ref.watch(memberProvider(participant.inviteeId)).value;

                final canKickOrLeave = (participant.inviterId == me?.uuid) ||
                    (owner?.uuid == me?.uuid);

                return TravelMemberListItem(
                  travel: travel,
                  member: invitee,
                  trailing: canKickOrLeave
                      ? FilledButton.tonal(
                          onPressed: () => ref
                              .read(travelPlanParticipantProvider(travelId)
                                  .notifier)
                              .leaveOrKick(participant.id),
                          child: Text(tr.from(participant.inviteeId == me?.uuid
                              ? 'Leave'
                              : 'Kick')))
                      : null,
                );
              })
        ],
      ),
    );
  }
}
