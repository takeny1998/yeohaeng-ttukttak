import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/page/login_page.dart';
import 'package:application_new/feature/geography/provider/geography_provider.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/travel_create/page/travel_create_page.dart';
import 'package:application_new/feature/travel_plan/city_place_pois/page/city_place_pois_page.dart';
import 'package:application_new/feature/travel_plan/city_travels/page/city_travels_page.dart';
import 'package:application_new/feature/travel_read/page/travel_read_page.dart';
import 'package:application_new/feature/travel_list/page/travel_list_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_page.dart';
import 'package:application_new/shared/provider/travel_detail_provider.dart';
import 'package:application_new/shared/provider/travel_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

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
      GoRoute(path: '/loading', builder: (context, state) => const LoadingPage()),
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
        builder: (context, state) => const TravelCreatePage(),
      ),
      GoRoute(
          path: '/travels/:id/detail',
          builder: (context, state) {
            final {'id': travelId} = state.pathParameters;
            return TravelReadPage(travelId: int.parse(travelId));
          }),
      GoRoute(
        path: '/travels',
        builder: (context, state) => const TravelListPage(),
      ),
      GoRoute(
          path: '/travels/:id',
          builder: (context, state) {
            final {'id': travelId} = state.pathParameters;

            return TravelPlanPage(travelId: int.parse(travelId));
          }),
      GoRoute(
          path: '/cities/:id/places/pois',
          builder: (context, state) {
            final {'id': cityId} = state.pathParameters;

            return CityPlacePoisPage(cityId: int.parse(cityId));
          }),
      GoRoute(
          path: '/travels/:travelId/cities/:cityId/travels',
          builder: (context, state) {
            final {'travelId': travelId, 'cityId': cityId} =
                state.pathParameters;

            return CityTravelsPage(
                travelId: int.parse(travelId), cityId: int.parse(cityId));
          }),
    ],
  );
}
