import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/exception/server_exception.dart';
import 'package:application_new/common/http/http_service.dart';
import 'package:application_new/common/http/http_service_provider.dart';
import 'package:application_new/common/loading/async_loading_provider.dart';
import 'package:application_new/core/message/message_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/travel/travel_model.dart';
import 'package:application_new/domain/travel/travel_repository.dart';
import 'package:application_new/feature/travel_create/page/travel_city_form.dart';
import 'package:application_new/feature/travel_create/page/travel_companion_type_form.dart';
import 'package:application_new/feature/travel_create/page/travel_date_form.dart';
import 'package:application_new/feature/travel_create/page/travel_form_page.dart';
import 'package:application_new/feature/travel_create/page/travel_motivation_type_form.dart';
import 'package:application_new/feature/travel_create/page/travel_name_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/travel_create_provider.dart';
import '../provider/travel_create_state.dart';

class TravelCreatePage extends ConsumerWidget {
  const TravelCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);

    return TravelFormPage(
        pageSize: 5,
        buildPages: (builder) => [
              TravelDateForm(pageIndex: 0, bottomViewBuilder: builder),
              TravelCityForm(pageIndex: 1, bottomViewBuilder: builder),
              TravelCompanionTypeForm(pageIndex: 2, bottomViewBuilder: builder),
              TravelMotivationTypeForm(
                  pageIndex: 3, bottomViewBuilder: builder),
              TravelNameForm(pageIndex: 4, bottomViewBuilder: builder),
            ],
        canSubmit: (state) {
          final TravelCreateState(
            :cities,
            :name,
            :motivationTypes,
            :companionTypes,
            :startedOn,
            :endedOn,
            :fieldErrors,
          ) = ref.watch(travelCreateProvider);

          return cities.isNotEmpty &&
              motivationTypes.isNotEmpty &&
              companionTypes.isNotEmpty &&
              startedOn != null &&
              endedOn != null;
        },
        onSubmit: (state) async {
          final navigator = GoRouter.of(context);
          final notifier = ref.read(travelCreateProvider.notifier);

          final TravelCreateState(
            :name,
            :startedOn,
            :endedOn,
            :companionTypes,
            :motivationTypes,
            :cities
          ) = state;

          if (name == null || startedOn == null || endedOn == null) return;

          printMessage() => MessageUtil.showSnackBar(
              context,
              MessageEvent(
                  tr.from('The travel has been created successfully.')));

          final travelRepository = ref.read(travelRepositoryProvider);

          final travel = await ref
              .read(asyncLoadingProvider.notifier)
              .guard(
                () => travelRepository.create(
                    name: name,
                    startedOn: startedOn,
                    endedOn: endedOn,
                    companionTypes: companionTypes,
                    motivationTypes: motivationTypes,
                    cities: cities),
              )
              .catchError((error, _) {
            if (error is ServerFailException) {
              error.consumeFieldErrors(notifier.setFieldErrors);
            }
            throw error;
          });

          printMessage();
          navigator.pushReplacement('/travels/${travel.id}');
        });
  }
}
