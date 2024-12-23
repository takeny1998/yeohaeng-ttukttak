import 'dart:async';
import 'dart:ui';

import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/exception/exception_handler.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/domain/member/member_model.dart';
import 'package:application_new/feature/authentication/service/auth_service_provider.dart';
import 'package:application_new/feature/locale/locale_provider.dart';
import 'package:application_new/shared/theme/my_chip_theme.dart';
import 'package:application_new/shared/theme/my_app_bar_theme.dart';
import 'package:application_new/shared/theme/my_button_theme.dart';
import 'package:application_new/shared/theme/my_fab_theme.dart';
import 'package:application_new/shared/theme/my_input_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/router/router_provider.dart';
import 'package:timeago/timeago.dart' as timeago;

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final providerContainer = ProviderContainer();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  FlutterError.onError =
      (details) => handleException(details.exception, details.stack);
  PlatformDispatcher.instance.onError = handleException;

  const korean = Locale.fromSubtags(languageCode: 'ko');
  const english = Locale.fromSubtags(languageCode: 'en');

  timeago.setLocaleMessages('ko', timeago.KoMessages());

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
        case MessageEvent(:final message, :final onActionRef):
          final ThemeData(:colorScheme) = Theme.of(themeKey.currentContext!);

          messengerKey.currentState?.hideCurrentSnackBar();
          messengerKey.currentState?.showSnackBar(
            SnackBar(
                backgroundColor: colorScheme.primaryContainer,
                content: Text(message,
                    style: TextStyle(
                        color: colorScheme.onSurface,
                        fontWeight: FontWeight.w600)),
                action: onActionRef != null
                    ? SnackBarAction(
                        backgroundColor: colorScheme.surface,
                        textColor: colorScheme.onSurface,
                        label: onActionRef.entity,
                        onPressed: onActionRef.reference)
                    : null),
          );
      }
    });

    super.initState();
  }

  FutureOr<void> autoLogin() async {
    final sessionNotifier = ref.read(sessionProvider.notifier);
    final member = await ref.read(authServiceProvider).login();
    if (member == null) return;

    sessionNotifier.updateLoginMember(member);
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
              child: MyInputTheme(
                child: MyChipTheme(
                  key: themeKey,
                  child: Stack(
                    children: [
                      widget!,
                      if (isLoading)
                        Positioned.fill(
                            child: Container(
                          color: Colors.white.withOpacity(0.5),
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
