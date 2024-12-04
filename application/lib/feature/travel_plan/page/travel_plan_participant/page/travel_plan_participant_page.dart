import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/domain/member/member_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/provider/travel_plan_participant_provider.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/provider/travel_plan_participant_state.dart';
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

    return Scaffold(
      appBar: AppBar(title: Text(travel.formattedName)),
      body: CustomScrollView(
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

                final invitee =
                    ref.watch(memberProvider(participant.inviteeId)).value;

                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.red,),
                  title: Text(invitee?.id.toString() ?? ''),
                );
              })
        ],
      ),
    );
  }
}
