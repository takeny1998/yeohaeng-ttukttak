import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../authentication/domain/auth_credentials_state_provider.dart';

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
                ref.read(authCredentialsStateProvider.notifier).logout()
                , child: const Text('로그아웃')),
            TextButton(onPressed: () =>
              ref.read(authCredentialsStateProvider.notifier).deleteAccount()
            , child: const Text('Apple 연동 해제')),
          ],
        ),
      ),
    );
  }
}