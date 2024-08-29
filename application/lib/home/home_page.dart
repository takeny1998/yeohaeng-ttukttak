import 'package:application/authentication/presentation/register_provider.dart';
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: () =>
                ref.read(registerProvider.notifier).logout()
                , child: const Text('로그아웃')),
            TextButton(onPressed: () =>
              ref.read(registerProvider.notifier).revoke()
            , child: const Text('Apple 연동 해제')),
          ],
        ),
      ),
    );
  }
}