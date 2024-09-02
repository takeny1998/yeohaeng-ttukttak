import 'package:application/features/authentication/presentation/provider/auth_state_notifier.dart';
import 'package:application/features/authentication/presentation/screen/auth_screen.dart';
import 'package:application/home/home_page.dart';
import 'package:application/home/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authState = ref.watch(authStateNotifierProvider);

  return GoRouter(
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
            builder: (context, state) => const AuthScreen())
      ]);
}
