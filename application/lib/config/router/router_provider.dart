import 'package:application/features/authentication/presentation/provider/auth_state_notifier.dart';
import 'package:application/features/authentication/presentation/screen/auth_screen.dart';
import 'package:application/features/home/presentation/screen/home_screen.dart';
import 'package:application/features/notification/data/model/notification_event.dart';
import 'package:application/features/notification/presentation/sceern/new_login_detected_screen.dart';
import 'package:application/features/notification/presentation/sceern/notification_list_screen.dart';
import 'package:application/features/splash/presentation/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authState = ref.watch(authStateNotifierProvider);


  return GoRouter(
      navigatorKey: rootNavKey,
      redirect: (context, state) {
        return authState.when(
            skipLoadingOnReload: true,
            data: (data) {
              return data == null ? '/auth' : null;
            },
            error: (err, _) => '/auth',
            loading: () => '/splash');
      },
      routes: [
        GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomePage()),
        GoRoute(
            path: '/splash',
            name: 'splash',
            builder: (context, state) => const SplashPage()),
        GoRoute(
            path: '/auth',
            name: 'auth',
            builder: (context, state) => const AuthScreen()),
        GoRoute(
          path: '/notifications',
          name: 'notifications',
          builder: (context, state) => const NotificationListScreen(),
          routes: <GoRoute>[
            GoRoute(
              path: 'new-login-detected',
              name: 'new-login-detected',
              builder: (context, state) => NewLoginDetectedScreen(
                  deviceName: state.uri.queryParameters['deviceName']!),
            ),
          ],
        ),
      ]);
}
