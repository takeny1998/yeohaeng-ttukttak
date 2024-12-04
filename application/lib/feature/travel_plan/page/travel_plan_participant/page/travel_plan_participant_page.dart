import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/session/session_model.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/common/util/iterable_util.dart';
import 'package:application_new/domain/member/member_provider.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text(tr.from('travel_participants'))),
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
                  Text(tr.from('invite_new_participant'),
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 4.0),
                  Text(tr.from('share_link_to_invite')),
                  const SizedBox(height: 2.0),
                  Text(tr.from('link_expires_after_30_min')),
                  const SizedBox(height: 2.0),
                  Text(tr.from('can_plan_with_participants')),
                  const SizedBox(height: 16.0),
                  FilledButton.icon(
                    onPressed: () => ref
                        .read(travelPlanParticipantProvider(travel.id).notifier)
                        .shareLink(),
                    label: Text(tr.from('share_invitation_link')),
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
          SliverList.builder(
              itemCount: participants.length,
              itemBuilder: (context, index) {
                final participant = participants[index];

                // final invitee =
                //     ref.watch(memberProvider(participant.inviteeId)).value;

                final nickname = IterableUtil.random(['이솔루후야', '제투스', '타틴']);

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
                  leading: TravelerAvatarItem(
                      id: participant.id,
                      gender: IterableUtil.random(Gender.values),
                      ageGroup: IterableUtil.random(AgeGroup.values)),
                  title: Text(
                    nickname,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: const Text(
                    '닉네임님이 초대함',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  trailing: (participant.inviterId == me?.id) ||
                          (travel.memberId == me?.id)
                      ? FilledButton.tonal(
                          onPressed: () => ref
                              .read(travelPlanParticipantProvider(travelId)
                                  .notifier)
                              .leaveOrKick(participant.id),
                          child: Text(tr.from(participant.inviteeId == me?.id
                              ? 'leave'
                              : 'kick')))
                      : null,
                );
              })
        ],
      ),
    );
  }
}
