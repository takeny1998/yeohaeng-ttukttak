import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'common/exception/exception.dart';
import 'common/router/router_provider.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Intl.defaultLocale = 'en';

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

  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale('ko', 'KR'),
      Locale('en', 'US'),
    ],
    fallbackLocale: const Locale('en', 'US'),
    assetLoader: const YamlAssetLoader(),
    child: ProviderScope(
      parent: providerContainer,
      child: const MyApp(),
    ),
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
        colorSchemeSeed: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Noto Sans'),
        useMaterial3: true,
      ),
      routerConfig: router,
      scaffoldMessengerKey: messengerKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
