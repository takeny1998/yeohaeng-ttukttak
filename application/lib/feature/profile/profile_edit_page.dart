import 'package:application_new/common/session/session_provider.dart';
import 'package:application_new/common/translation/translation_service.dart';
import 'package:application_new/feature/profile/profile_avatar.dart';
import 'package:application_new/feature/profile/profile_edit_provider.dart';
import 'package:application_new/feature/profile/profile_edit_state.dart';
import 'package:application_new/shared/model/member_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileEditPage extends ConsumerWidget {
  ProfileEditPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileEditState(
      :nickname,
      ageGroup: memberAgeGroup,
      gender: memberGender
    ) = ref.watch(profileEditProvider);

    final tr = ref.watch(translationServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr.from('edit_profile')),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
          children: [
            const Center(child: ProfileAvatar(radius: 56.0)),
            const SizedBox(height: 24.0),
            TextFormField(
              decoration: InputDecoration(labelText: tr.from('nickname')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return tr.from('please_enter_nickname');
                }
                return null;
              },
              onChanged: (value) {
                final isValid = formKey.currentState?.validate();
                if (isValid == null || isValid == false) return;
                ref.read(profileEditProvider.notifier).editNickname(value);
              },
              initialValue: nickname,
            ),
            const SizedBox(height: 48.0),
            Text(tr.from('gender')),
            const SizedBox(height: 12.0),
            Wrap(
              spacing: 12.0,
              children: [
                for (final gender in Gender.values)
                  ChoiceChip(
                      visualDensity: VisualDensity.standard,
                      label: Text(tr.fromEnum(gender)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      onSelected: (_) => ref
                          .read(profileEditProvider.notifier)
                          .selectGender(gender),
                      selected: memberGender == gender),
              ],
            ),
            const SizedBox(height: 48.0),
            Text(tr.from('age_group')),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              children: [
                for (final ageGroup in AgeGroup.values)
                  ChoiceChip(
                      label: Text(tr.fromEnum(ageGroup)),
                      onSelected: (_) => ref
                          .read(profileEditProvider.notifier)
                          .selectAgeGroup(ageGroup),
                      selected: memberAgeGroup == ageGroup)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: FilledButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();
                    if (isValid == null || isValid == false) return;
                    ref.read(profileEditProvider.notifier).submit();
                  },
                  child: Text(tr.from('edit_complete'))))),
    );
  }
}
