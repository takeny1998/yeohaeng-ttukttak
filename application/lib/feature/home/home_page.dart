import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';

import 'package:application_new/feature/authentication/page/login_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: ref.read(loginProvider.notifier).logout,
                child: const Text('로그아웃')),
            TextButton(
                onPressed: () =>
                    ref.read(asyncLoadingProvider.notifier).guard(() async {
                      await Future.delayed(const Duration(seconds: 3));
                    }),
                child: const Text('로딩')),
            TextButton(
                onPressed: () => eventController.add(MessageEvent('travel.created'.tr())),
                child: const Text('메세지')),
            TextButton(
                onPressed: () => context.push('/travels/create'),
                child: const Text('여행 생성')),
            TextButton(
                onPressed: () => context.push('/travels'),
                child: const Text('여행 목록')),
            TextField(
              onSubmitted: (text) {
                final id = int.tryParse(text);
                if (id == null) return;
                context.push('/travels/$id/detail');
              },
            )
          ],
        ),
      ),
    );
  }
}
