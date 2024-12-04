import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/provider/travel_plan_participant_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/travel_plan_provider.dart';
import '../../../provider/travel_plan_state.dart';

class TravelPlanParticipantPage extends ConsumerWidget {
  final TravelPlanProvider provider;
  final TravelPlanState state;

  const TravelPlanParticipantPage(
      {super.key, required this.provider, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);
    final TravelPlanState(:travel) = state;

    final tr = ref.watch(translationServiceProvider);


    return Scaffold(
      appBar: AppBar(title: Text(travel.formattedName)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32.0),
            Container(
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
                    onPressed: () => ref.read(travelPlanParticipantProvider(travel.id).notifier).invite(),
                    label: Text(tr.from('share_invitation_link')),
                    icon: const Icon(Icons.link),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 32.0),
              color: colorScheme.surfaceContainer,
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
