import 'package:application_new/shared/member/model/gender.dart';
import 'package:flutter/material.dart';

class CompanionItem extends StatelessWidget {
  final int _id;
  final Gender _gender;
  final String _title;
  final String _subTitle;

  const CompanionItem(
      {super.key,
      required int id,
      required Gender gender,
      required String title,
      required String subTitle})
      : _id = id,
        _gender = gender,
        _title = title,
        _subTitle = subTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );

    final subTitleStyle = textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: colorScheme.secondary,
    );

    return Column(
      children: [
        CircleAvatar(
          radius: 24.0,
          backgroundImage: NetworkImage(
              'https://avatar.iran.liara.run/public/${_gender == Gender.male ? 'boy' : 'girl'}?username=$_id}'),
        ),
        const SizedBox(height: 6.0),
        Text(_title, style: titleStyle),
        Text(_subTitle, style: subTitleStyle),
      ],
    );
  }
}
