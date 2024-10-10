import 'package:application_new/common/component/outlined_text.dart';
import 'package:application_new/shared/place/model/place_model.dart';
import 'package:flutter/material.dart';

class PlaceMarkerItem extends StatelessWidget {
  final bool _isSelected;
  final PlaceModel _place;

  const PlaceMarkerItem(
      {super.key, required PlaceModel place, required bool isSelected})
      : _place = place,
        _isSelected = isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final labelStyle = TextStyle(
      fontSize: 10.0,
      color: colorScheme.onPrimary,
      fontWeight: FontWeight.w600,
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          child: CircleAvatar(
              radius: 18.0,
              backgroundColor:
                  _isSelected ? colorScheme.primary : colorScheme.secondary),
        ),
        Positioned(
            top: 36.0,
            child: Container(
                decoration: BoxDecoration(
                  color: _isSelected ? colorScheme.primary : colorScheme.secondary,
                  border: Border.all(color: colorScheme.primary),
                  borderRadius: BorderRadius.circular(4.0)
                ),
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                child: Text(_place.name, style: labelStyle)))
      ],
    );
  }
}
