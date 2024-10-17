import 'dart:async';
import 'dart:ui';

import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/locale/locale_provider.dart';
import 'package:application_new/shared/component/filled_chip_theme.dart';
import 'package:application_new/shared/component/filled_icon_button_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import 'common/exception/exception.dart';
import 'common/router/router_provider.dart';
import 'feature/geography/provider/geography_provider.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final logger = Logger();
  final providerContainer = ProviderContainer();

  PlatformDispatcher.instance.onError = (error, stack) {
    logger.e('[PlatformDispatcher.instance.onError] exception = $error');
    logger.e('[PlatformDispatcher.instance.onError] $stack');

    if (error is BusinessException) {
      switch (error) {
        case ServerException(:final message):
          eventController.add(MessageEvent(message));
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

  const korean = Locale.fromSubtags(languageCode: 'ko');
  const english = Locale.fromSubtags(languageCode: 'en');

  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [korean, english],
    fallbackLocale: english,
    assetLoader: const YamlAssetLoader(),
    useOnlyLangCode: true,
    saveLocale: false,
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
    Future.microtask(() {
      ref.read(geographyProvider);
      autoLogin();
    });

    eventController.stream.listen((event) {
      switch (event) {
        case MessageEvent(:final message):
          messengerKey.currentState
              ?.showSnackBar(SnackBar(content: Text(message)));
      }
    });

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
    final locale = ref.watch(localeStateProvider);

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
        return FilledChipTheme(
          child: Stack(
            children: [
              widget!,
              if (isLoading)
                Positioned.fill(
                    child: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: const Center(child: CircularProgressIndicator()),
                ))
            ],
          ),
        );
      },
    );
  }
}
