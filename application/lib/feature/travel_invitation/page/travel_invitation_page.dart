import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/domain/travel/travel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelInvitationPage extends ConsumerWidget {

  final int travelId;
  final String invitationId;

  const TravelInvitationPage({super.key, required this.travelId, required this.invitationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final travel = ref.watch(travelProvider(travelId)).value;

    if (travel == null) {
      return const LoadingPage();
    }

    return Scaffold(
      appBar: AppBar(title: Text(travel.formattedName)),
    );
  }
}
