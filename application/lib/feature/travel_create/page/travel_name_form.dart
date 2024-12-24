import 'package:application_new/common/event/event.dart';
import 'package:application_new/common/exception/server_exception.dart';
import 'package:application_new/core/message/message_util.dart';
import 'package:application_new/core/translation/translation_service.dart';
import 'package:application_new/domain/geography/geography_model.dart';
import 'package:application_new/domain/geography/geography_provider.dart';
import 'package:application_new/feature/travel_create/provider/travel_create_state.dart';
import 'package:application_new/shared/component/content_top_app_bar.dart';
import 'package:application_new/shared/component/paged_form_bottom_control_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../provider/travel_create_provider.dart';

class TravelNameForm extends ConsumerWidget {
  final PageController pageController;
  final TextEditingController nameController = TextEditingController();

  TravelNameForm(this.pageController, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(translationServiceProvider);

    final TravelCreateState(
      :cities,
      :name,
      :motivationTypes,
      :companionTypes,
      :startedOn,
      :endedOn,
      :fieldErrors,
    ) = ref.watch(travelCreateProvider);

    final bool canSubmit = cities.isNotEmpty &&
        motivationTypes.isNotEmpty &&
        companionTypes.isNotEmpty &&
        startedOn != null &&
        endedOn != null;

    final String provinceNames = cities
        .map((city) => city.parentId)
        .toSet()
        .map((provinceId) => ref.watch(provinceProvider(provinceId)).value)
        .whereType<ProvinceModel>()
        .map((province) => province.shortName)
        .join(', ');

    if (name != null) {
      nameController.text = name;
    }

    return Scaffold(
      appBar: AppBar(shape: const Border()),
      body: Column(
        children: [
          ContentTopAppBar(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr.from('Please enter a name of travel.'),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20.0)),
              Text('(${tr.from('Optional')})'),
              const SizedBox(height: 8.0),
            ],
          )),
          const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: TextFormField(
              controller: nameController,
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              onChanged: (name) {
                if (name.isEmpty) return;
                ref.read(travelCreateProvider.notifier).enterName(name);
              },
              decoration: InputDecoration(
                errorText: fieldErrors['name'],
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(999.0),
                        radius: 16.0,
                        onTap: () {
                          nameController.clear();
                          ref
                              .read(travelCreateProvider.notifier)
                              .enterName(null);
                        },
                        child: const Icon(Icons.clear)),
                  ),
                  hintText: tr.from('Travel of {}', args: [provinceNames])),
            ),
          )
        ],
      ),
      bottomNavigationBar: PagedFormBottomControlView(
        isInputted: canSubmit,
        controller: pageController,
        hasNextPage: false,
        onSubmit: () async {
          final navigator = GoRouter.of(context);
          final notifier = ref.read(travelCreateProvider.notifier);

          printMessage() => MessageUtil.showSnackBar(
              context,
              MessageEvent(
                  tr.from('The travel has been created successfully.')));

          final travel = await notifier.submit().catchError((error, _) {
            if (error is ServerFailException) {
              error.consumeFieldErrors(notifier.setFieldErrors);
            }
            throw error;
          });

          printMessage();
          navigator.pushReplacement('/travels/${travel.id}');
        },
      ),
    );
  }
}
