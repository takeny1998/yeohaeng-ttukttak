import 'dart:async';
import 'dart:ui';

import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/util/translation_util.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/locale/locale_provider.dart';
import 'package:application_new/shared/theme/my_chip_theme.dart';
import 'package:application_new/shared/theme/my_app_bar_theme.dart';
import 'package:application_new/shared/theme/my_button_theme.dart';
import 'package:application_new/shared/theme/my_fab_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:uuid/v4.dart';

import 'common/exception/exception.dart';
import 'common/router/router_provider.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final logger = Logger();
  final providerContainer = ProviderContainer();

  PlatformDispatcher.instance.onError = (error, stack) {
    final uuid =  const UuidV4().generate().substring(0, 6);

    logger.e('[$uuid][Error]', stackTrace: stack, error: error);

    if (error is NetworkException) {
      logger.e('[$uuid][NetworkException] code = ${error.statusCode} message = ${error.statusMessage}');
      providerContainer.read(sessionProvider.notifier).omitError(TranslationUtil.message('network_exception'));
      return true;
    }

    if (error is ServerException) {
      switch (error) {
        case ServerErrorException(:final code, :final message):
          logger.e('[$uuid][ServerErrorException] code = $code, message = $message');
          eventController.add(MessageEvent(message));
        case ServerFailException(:final data):
          logger.e('[$uuid][ServerFailException] data = $data');
          final message = data.values.join('\n');
          eventController.add(MessageEvent(message));
      }
      return true;
    }


    if (error is BusinessException) {
      switch (error) {
        case AuthorizationException():
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
  final GlobalKey themeKey = GlobalKey();

  @override
  void initState() {
    Future.microtask(() {
      autoLogin();
    });

    eventController.stream.listen((event) {
      switch (event) {
        case MessageEvent(:final message, :final onCancel):
          final ThemeData(:colorScheme) = Theme.of(themeKey.currentContext!);

          messengerKey.currentState?.hideCurrentSnackBar();
          messengerKey.currentState?.showSnackBar(
            SnackBar(
                backgroundColor: colorScheme.primaryContainer,
                content: Text(message,
                    style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600)),
                action: onCancel != null
                    ? SnackBarAction(label: '취소', onPressed: onCancel)
                    : null),
          );
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
        return MyFabTheme(
          child: MyAppBarTheme(
            child: MyButtonTheme(
              child: MyChipTheme(
                key: themeKey,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
