import 'package:application/authentication/domain/auth_credentials_state_provider.dart';
import 'package:application/authentication/presentation/register_page.dart';
import 'package:application/home/home_page.dart';
import 'package:application/home/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authState = ref.watch(authCredentialsStateProvider);

  return GoRouter(
      redirect: (context, state) {
        return authState.when(
            skipLoadingOnReload: true,
            data: (data) {
              return data == null ? '/register' : null;
            },
            error: (err, _) => '/register',
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
            path: '/register',
            name: 'register',
            builder: (context, state) => const RegisterPage())
      ]);
}
