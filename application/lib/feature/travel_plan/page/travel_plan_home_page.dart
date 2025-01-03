import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/domain/member/member_provider.dart';
import 'package:application_new/feature/travel_plan/component/travel_info_chip.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intrinsic_size_builder/intrinsic_size_builder.dart';

class TravelPlanHomePage extends ConsumerStatefulWidget {
  final TravelPlanProvider provider;
  final TravelPlanState state;

  const TravelPlanHomePage({
    super.key,
    required this.provider,
    required this.state,
  });

  @override
  ConsumerState createState() => _TravelPlanHomePageState();
}

class _TravelPlanHomePageState extends ConsumerState<TravelPlanHomePage> {
  double appbarHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    final TravelPlanState(:travel) = widget.state;
    final colorScheme = Theme.of(context).colorScheme;

    const headerStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);
    final owner = ref.watch(memberProvider(travel.memberId)).value;

    return IntrinsicSizeBuilder(
        firstFrameWidget: Container(
          color: colorScheme.surface,
        ),
        subject: Padding(
            padding: EdgeInsets.fromLTRB(
                24.0,
                MediaQuery.of(context).padding.top + kToolbarHeight + 8.0,
                24.0,
                24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(travel.name, style: headerStyle),
              Text('${owner?.nickname ?? ''}님의 여행',
                  style: TextStyle(
                      fontSize: 13.5, color: colorScheme.onSurfaceVariant)),
              const SizedBox(height: 16.0),
              Wrap(
                spacing: 8.0,
                children: [
                  TravelInfoChip(
                      avatar: Icons.calendar_today,
                      label: travel.formattedDate),
                  TravelInfoChip(
                      avatar: Icons.person,
                      label: travel.companionTypes
                          .map((e) => TranslationUtil.enumValue(e))
                          .join(', ')),
                  // TravelInfoChip(
                  //     avatar: Icons.place,
                  //     label: travel.cities.map((e) => e.name).join(', ')),
                  TravelInfoChip(
                      avatar: Icons.tag,
                      label: travel.motivationTypes
                          .map((e) => TranslationUtil.enumValue(e))
                          .join(', ')),
                ],
              ),
              const SizedBox(height: 12.0),
            ])),
        builder: (context, subjectSize, subject) {
          return Scaffold(
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverAppBar(
                    expandedHeight:
                        subjectSize.height - MediaQuery.of(context).padding.top,
                    collapsedHeight: kToolbarHeight,
                    pinned: true,
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit_note_outlined)),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz)),
                      ),
                    ],
                    flexibleSpace: subject),
                SliverToBoxAdapter(
                    child: TextButton(
                        onPressed: () =>
                            context.push('/travels/${travel.id}/participants'),
                        child: Text('여행 일원')))
              ],
            ),
          );
        });
  }
}
