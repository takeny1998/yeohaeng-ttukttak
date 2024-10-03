import 'package:application_new/common/util/translation.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel_detail/provider/travel_detail_provider.dart';
import 'package:application_new/shared/member/model/gender.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TravelDetailPage extends ConsumerWidget {
  final int _travelId;

  final ScrollController _scrollController = ScrollController();

  TravelDetailPage({super.key, required int travelId}) : _travelId = travelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final travelDetail = ref.watch(travelDetailProvider(_travelId));

    final travel = travelDetail.travel;
    final motivations = travel?.motivations ?? [];
    final companions = travel?.companions ?? [];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            const SliverAppBar(pinned: true),
            SliverList(
                delegate: SliverChildListDelegate([
              Wrap(
                  spacing: 8.0,
                  children: motivations
                      .map((motivation) =>
                          Chip(label: Text(enumKey(motivation)).tr()))
                      .toList()),
              Wrap(spacing: 8.0, children: [
                if (travel != null) ...[
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatar.iran.liara.run/public/${travel.gender == Gender.male ? 'boy' : 'girl'}?username=${travel.id}')),
                      const SizedBox(height: 8.0),
                      Text('나'),
                      Text(enumKey(travel.ageGroup)).tr()
                    ],
                  ),
                ],
                for (final companion in companions)
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://avatar.iran.liara.run/public/${companion.gender == Gender.male ? 'boy' : 'girl'}?username=${companion.id}')),
                      const SizedBox(height: 8.0),
                      Text(enumKey(companion.type)).tr(),
                      Text(enumKey(companion.ageGroup)).tr()
                    ],
                  )
              ]),
              const SizedBox(height: 24.0),
            ])),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomHeaderDelegate(
                  extent: 300,
                  widget: Container(
                    height: 300,
                    color: Colors.blue,
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                height: 2000,
                color: Colors.black,
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  CustomHeaderDelegate({required this.widget, required this.extent});

  final Widget widget;
  final int extent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 300;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
