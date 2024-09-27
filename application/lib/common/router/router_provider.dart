import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/page/login_page.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel/create_travel_page.dart';
import 'package:application_new/feature/travel/select_travel_city_form.dart';
import 'package:application_new/feature/travel/select_travel_detail_form.dart';
import 'package:application_new/feature/travel/select_travel_date_form.dart';
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
        path: '/travels/create',
        builder: (context, state) => const CreateTravelPage(),
      ),
    ],
  );
}
