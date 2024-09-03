import 'package:application/features/authentication/presentation/provider/auth_state_notifier.dart';
import 'package:application/features/authentication/presentation/provider/dto/oauth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: () =>
                ref.read(authStateNotifierProvider.notifier).signIn(Apple())
                , child: const Text('Apple 로그인')),
            TextButton(onPressed: () =>
                ref.read(authStateNotifierProvider.notifier).signIn(Google())
                , child: const Text('Google 로그인')),
          ],
        ),
      ),
    );

  }
}
