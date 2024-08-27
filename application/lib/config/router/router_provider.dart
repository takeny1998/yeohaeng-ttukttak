import 'package:application/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(routes: [
    GoRoute(
        path: '/', name: 'home', builder: (context, state) => const HomePage())
  ]);
}
