import 'package:application_new/common/util/translation_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final String? message;

  const ErrorPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ThemeData(:colorScheme) = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  message ?? TranslationUtil.message('unchecked_exception')),
              const SizedBox(height: 24.0),
              FilledButton(
                  onPressed: () => context.go('/'),
                  child: const Text('다시 시도하기'))
            ],
          ),
        ),
      ),
    );
  }
}
