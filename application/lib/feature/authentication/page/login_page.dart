
import 'package:application_new/feature/authentication/model/auth_provider.dart';
import 'package:application_new/feature/authentication/page/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () => ref
                    .read(loginProvider.notifier)
                    .login(provider: AppleProvider()),
                child: const Text('Apple 로그인')),
            TextButton(
                onPressed: () {
                  ref
                    .read(loginProvider.notifier)
                    .login(provider: GoogleProvider());
                },
                child: const Text('Google 로그인')),
          ],
        ),
      ),
    );
  }
}
