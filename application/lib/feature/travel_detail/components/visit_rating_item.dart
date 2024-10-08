import 'package:application_new/common/util/translation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class VisitRatingItem extends StatelessWidget {
  final String _name;
  final int _rating;

  const VisitRatingItem({super.key, required String name, required int rating})
      : _name = name,
        _rating = rating;

  Icon _buildIcon() {
    if (_rating > 3) {
      return const Icon(
        Icons.sentiment_satisfied_outlined,
        color: Colors.green,
      );
    }

    if (_rating < 3) {
      return const Icon(
        Icons.sentiment_dissatisfied_outlined,
        color: Colors.red,
      );
    }

    return const Icon(
      Icons.sentiment_neutral_outlined,
      color: Colors.deepOrangeAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final trKey = baseKey('travel.travel_detail');

    final labelStyle =
        textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trKey('ask_$_name'),
          style: textTheme.labelMedium,
        ).tr(),
        const SizedBox(height: 4.0),
        Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 8.0),
            Flexible(
                child: Text('rating.$_name.$_rating'.tr(), style: labelStyle)),
          ],
        ),
      ],
    );
  }
}
