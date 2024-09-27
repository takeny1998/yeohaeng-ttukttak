import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/page/login_page.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel/select_travel_city_page.dart';
import 'package:application_new/feature/travel/select_travel_detail_page.dart';
import 'package:application_new/feature/travel/select_travel_date_page.dart';
import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final session = ref.watch(sessionProvider);

  return GoRouter(
    redirect: (context, state) {
      if (!session.isAuthenticated) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/travels/create/date',
        builder: (context, state) => const SelectTravelDatePage(),
      ),
      GoRoute(
        path: '/travels/create/city',
        builder: (context, state) => const SelectTravelCityPage(),
      ),
      GoRoute(
        path: '/travels/create/detail',
        builder: (context, state) => const SelectTravelDetailPage(),
      ),
    ],
  );
}
