import 'package:application_new/common/loading/loading_page.dart';
import 'package:application_new/common/session/error_model.dart';
import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/feature/authentication/page/login_page.dart';
import 'package:application_new/feature/error/error_page.dart';
import 'package:application_new/feature/home/home_page.dart';
import 'package:application_new/feature/profile/profile_edit_page.dart';
import 'package:application_new/feature/travel_create/page/travel_create_page.dart';
import 'package:application_new/feature/travel_invitation/page/travel_invitation_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_participant/page/travel_plan_participant_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_recommend/page/city_travels/page/city_travels_page.dart';
import 'package:application_new/feature/travel_read/page/travel_read_page.dart';
import 'package:application_new/feature/travel_list/page/travel_list_page.dart';
import 'package:application_new/feature/travel_plan/page/travel_plan_page.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../feature/travel_plan/page/travel_plan_recommend/page/city_place_pois/page/travel_city_pois_page.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final session = ref.watch(sessionProvider);

  return GoRouter(
    redirect: (context, state) {
      if (session.error != null) {
        return '/error';
      }

      if (session.member == null) {
        return '/login';
      }

      return null;
    },
    errorBuilder: (context, state) {
      return ErrorPage(error: ErrorModel(
        code: 'route_error_occurred',
        message: state.error?.message ?? ''
      ));
    },
    routes: [
      GoRoute(
          path: '/profile/edit',
          builder: (context, state) => ProfileEditPage()),
      GoRoute(
          path: '/error',
          builder: (context, state) {
            return ErrorPage(error: session.error!);
          }),
      GoRoute(
          path: '/loading', builder: (context, state) => const LoadingPage()),
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
          path: '/travels/:travelId/cities/:cityId/places/pois',
          builder: (context, state) {
            final {
              'travelId': travelId,
              'cityId': cityId,
            } = state.pathParameters;

            return TravelCityPoisPage(
                travelId: int.parse(travelId), cityId: int.parse(cityId));
          }),
      GoRoute(
          path: '/travels/:travelId/cities/:cityId/travels',
          builder: (context, state) {
            final {
              'travelId': travelId,
              'cityId': cityId,
            } = state.pathParameters;

            return CityTravelsPage(
                travelId: int.parse(travelId), cityId: int.parse(cityId));
          }),
      GoRoute(
          path: '/travels/:travelId/invitations/:invitationId',
          builder: (context, state) {
            final {
              'travelId': travelId,
              'invitationId': invitationId,
            } = state.pathParameters;

            return TravelInvitationPage(
                travelId: int.parse(travelId), invitationId: invitationId);
          }),
      GoRoute(
          path: '/travels/:travelId/participants',
          builder: (context, state) {
            final {'travelId': travelId} = state.pathParameters;

            return TravelPlanParticipantPage(travelId: int.parse(travelId));
          })
    ],
  );
}
