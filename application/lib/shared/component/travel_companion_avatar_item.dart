import 'package:application_new/shared/model/member_model.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/shared/service/avatar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelerAvatarItem extends ConsumerWidget {
  final int id;

  final Gender? gender;
  final AgeGroup? ageGroup;

  final double? radius;

  const TravelerAvatarItem({
    super.key,
    required this.id,
    required this.gender,
    required this.ageGroup,
    this.radius,
  });

  factory TravelerAvatarItem.companion(
    TravelCompanionModel travelCompanion, {
    double? radius,
  }) {
    return TravelerAvatarItem(
        id: travelCompanion.id,
        gender: travelCompanion.gender,
        ageGroup: travelCompanion.ageGroup,
        radius: radius);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ageGroup == null || gender == null) {
      return Container(color: Colors.transparent);
    }

    final path = ref
        .watch(avatarServiceProvider)
        .getPathByUniqueId(id, gender: gender!, ageGroup: ageGroup!);

    return CircleAvatar(
        radius: radius ?? 24.0,
        backgroundImage: NetworkImage('https://host.tatine.kr/$path'));
  }
}
