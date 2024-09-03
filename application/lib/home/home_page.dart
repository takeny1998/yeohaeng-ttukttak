import 'package:application/features/authentication/domain/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/authentication/presentation/provider/auth_state_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: ref.read(authStateNotifierProvider.notifier).signOut,
                child: const Text('로그아웃')),
            TextButton(
                onPressed: () async {
                  final profile = await ref.read(authClientProvider).getProfile();
                  print('[HomePage.build()] profile = ${profile.toString()}');
                },
                child: const Text('프로필 정보 조회')),
          ],
        ),
      ),
    );
  }
}
