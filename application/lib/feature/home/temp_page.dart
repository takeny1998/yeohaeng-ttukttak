import 'package:application_new/feature/geography_select/geography_select_view.dart';
import 'package:application_new/feature/geography_select/province_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TempPage extends ConsumerWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(child: ProvinceSelectView()),
    );
  }
}
