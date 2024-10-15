import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/page/login_page.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel/page/create_travel_page.dart';
import 'package:application_new/feature/travel_detail/page/travel_detail_page.dart';
import 'package:application_new/feature/travel_list/page/travel_list_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_page.dart';
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
      GoRoute(
          path: '/travels/:id/detail',
          builder: (context, state) {
            final {'id': travelId} = state.pathParameters;
            return TravelDetailPage(travelId: int.parse(travelId));
          }),
      GoRoute(
        path: '/travels',
        builder: (context, state) => const TravelListPage(),
      ),
      GoRoute(path: '/travels/:id', builder: (context, state) {
        final {'id': travelId} = state.pathParameters;
        return TravelPlanPage(travelId: int.parse(travelId));
      })
    ],
  );
}
