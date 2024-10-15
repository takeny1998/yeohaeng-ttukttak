import 'package:application_new/common/router/router_provider.dart';
import 'package:application_new/feature/travel_list/model/travel_list_model.dart';
import 'package:application_new/feature/travel_list/provider/travel_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TravelListPage extends ConsumerWidget {
  const TravelListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final TravelListModel(:travels) = ref.watch(travelListProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('여행 목록'),
      ),
      body: ListView.builder(
        itemCount: travels.length,
        itemBuilder: (context, index) {
          final travel = travels[index];

          return ListTile(
          onTap: () => context.push('/travels/${travel.id}'),
          title: Text(travel.formattedName),
        );
        }, ),
    );
  }
}
