import 'package:application_new/common/util/translation_util.dart';
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
    final translator = TranslationUtil.widget(context);

    final labelStyle =
        textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(translator.key('ask_$_name'), style: textTheme.labelMedium),
        const SizedBox(height: 4.0),
        Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 8.0),
            Flexible(
                child: Text(translator.key('rating.$_name.$_rating'),
                    style: labelStyle)),
          ],
        ),
      ],
    );
  }
}
