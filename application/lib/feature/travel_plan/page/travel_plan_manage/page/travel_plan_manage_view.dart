
import 'package:application_new/domain/travel/component/travel_date_scroll_view.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:flutter/material.dart';

class TravelPlanManageView extends StatelessWidget {

  final TravelModel travel;

  const TravelPlanManageView({super.key, required this.travel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [
      TravelDateScrollView(travel: travel)
    ]));
  }
}
