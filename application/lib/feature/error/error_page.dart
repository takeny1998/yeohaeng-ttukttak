import 'package:application_new/common/session/error_model.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/common/util/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends ConsumerWidget {
  final ErrorModel error;

  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData(:colorScheme) = Theme.of(context);

    final tr = ref.watch(translationServiceProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: colorScheme.primaryFixed,
                  radius: 32.0,
                  child: const Icon(Icons.warning_amber_rounded, size: 32.0),
                ),
                const SizedBox(height: 16.0),
                Text(tr.from('An Error Occurred'),
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(height: 8.0),
                Text(
                  error.message.lineBreakByWord(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 40.0),
                FilledButton.tonalIcon(
                    onPressed: () => context.go('/'),
                    icon: const Icon(Icons.home_outlined),
                    label: Text(tr.from('Back to the main page'))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
