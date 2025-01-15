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

class TravelNameForm extends ConsumerStatefulWidget {
  final int pageIndex;
  final PagedFormBottomControlViewBuilder bottomViewBuilder;

  const TravelNameForm(
      {super.key, required this.pageIndex, required this.bottomViewBuilder});

  @override
  ConsumerState createState() => _TravelNameFormState();
}

class _TravelNameFormState extends ConsumerState<TravelNameForm> {
  final TextEditingController nameController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();

  @override
  void initState() {
    Future.microtask(() {
      final name = ref.read(travelCreateProvider).name;

      FocusManager.instance.primaryFocus?.requestFocus(nameFocusNode);

      if (name != null) {
        nameController.text = name;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = ref.watch(translationServiceProvider);

    final state = ref.watch(travelCreateProvider);

    final TravelCreateState(:name, :cities, :fieldErrors) = state;

    final String provinceNames = cities
        .map((city) => city.parentId)
        .toSet()
        .map((provinceId) => ref.watch(provinceProvider(provinceId)).value)
        .whereType<ProvinceModel>()
        .map((province) => province.shortName)
        .join(', ');

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
              focusNode: nameFocusNode,
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              onChanged: (name) {
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
      bottomNavigationBar: widget.bottomViewBuilder(
          isInputted: name?.isNotEmpty ?? false, pageIndex: widget.pageIndex),
    );
  }
}
