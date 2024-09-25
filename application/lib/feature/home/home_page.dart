import 'package:application_new/common/exception/exception.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/feature/authentication/page/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: Center(
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
                child: const Text('로딩'))
          ],
        ),
      ),
    );
  }
}
