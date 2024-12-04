import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends ConsumerWidget {
  final String? message;

  const ErrorPage({super.key, required this.message});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final tr = ref.watch(translationServiceProvider);


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  message ?? tr.from('unknown_error_occurred')),
              const SizedBox(height: 24.0),
              FilledButton(
                  onPressed: () => context.go('/'),
                  child: Text(tr.from('retry')))
            ],
          ),
        ),
      ),
    );
  }
}
