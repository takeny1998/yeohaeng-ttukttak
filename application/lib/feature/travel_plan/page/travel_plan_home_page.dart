import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/travel_plan/component/travel_info_list_item.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_provider.dart';
import 'package:application_new/feature/travel_plan/provider/travel_plan_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelPlanHomePage extends ConsumerStatefulWidget {
  final TravelPlanProvider provider;
  final TravelPlanState state;

  const TravelPlanHomePage(
      {super.key, required this.provider, required this.state});

  @override
  ConsumerState createState() => _TravelPlanHomePageState();
}

class _TravelPlanHomePageState extends ConsumerState<TravelPlanHomePage> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TravelPlanState(:travel) = widget.state;
    final colorScheme = Theme.of(context).colorScheme;

    const header = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 276.0,
            collapsedHeight: kToolbarHeight,
            backgroundColor: colorScheme.primaryContainer,
            shape: Border(),
            pinned: true,
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit_note_outlined)),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                  padding: EdgeInsets.fromLTRB(
                      24.0,
                      MediaQuery.of(context).padding.top + kToolbarHeight + 8.0,
                      48.0,
                      48.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(travel.formattedName, style: header),
                        Text('예제 닉네임님의 여행', style: TextStyle(fontSize: 13.5, color: colorScheme.onSurfaceVariant)),
                        const SizedBox(height: 24.0),
                        TravelInfoListItem(
                            avatar: Icons.calendar_today_outlined,
                            label: travel.formattedDate),
                        const SizedBox(height: 12.0),
                        TravelInfoListItem(
                            avatar: Icons.person_outline,
                            label: travel.companions
                                .map((e) => TranslationUtil.enumValue(e.type))
                                .join(', ')),
                        const SizedBox(height: 12.0),
                        TravelInfoListItem(
                            avatar: Icons.tag,
                            label: '${travel.motivationTypes.take(2)
                                .map((e) => TranslationUtil.enumValue(e))
                                .join(', ')} ${travel.motivationTypes.length > 2 ? '외 ${travel.motivationTypes.length - 2}개...' : null}'),
                      ])),
            ),
          ),
          SliverToBoxAdapter(child: Container(height: 1600.0)),
        ],
      ),
    );
  }
}
