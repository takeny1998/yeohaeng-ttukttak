import 'dart:async';
import 'dart:ui';

import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/log/logger.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'common/exception/exception.dart';
import 'common/router/router_provider.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  final logger = Logger();
  final providerContainer = ProviderContainer();

  FlutterError.onError = (error) {
    logger.e('[HttpException] exception = $error');
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    if (error is BusinessException) {
      logger.e('[HttpException] exception = $error');
      switch (error) {
        case ServerException(:final message):
          messengerKey.currentState
              ?.showSnackBar(SnackBar(content: Text(message)));
        case NetworkException(:final code, :final message):
          logger.e('[HttpException] code = $code, message = $message');
        case AuthenticatedException():
          final sessionNotifier =
              providerContainer.read(sessionProvider.notifier);
          sessionNotifier.update(isAuthenticated: false);
      }
    }

    return true;
  };

  runApp(ProviderScope(
    parent: providerContainer,
    child: const MyApp(),
  ));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    Future.microtask(autoLogin);
    super.initState();
  }

  FutureOr<void> autoLogin() async {
    final authService = ref.read(authServiceProvider);
    final sessionNotifier = ref.read(sessionProvider.notifier);

    await authService.find();
    sessionNotifier.update(isAuthenticated: true);
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);
    final isLoading = ref.watch(asyncLoadingProvider).count > 0;


    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.black,
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Noto Sans'
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
      scaffoldMessengerKey: messengerKey,
      builder: (context, widget) {
        return Stack(
          children: [
            widget!,
            if (isLoading)
              Positioned.fill(
                  child: Container(
                color: Colors.white.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()),
              ))
          ],
        );
      },
    );
  }
}
