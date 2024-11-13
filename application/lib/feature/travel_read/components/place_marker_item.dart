import 'package:application_new/domain/place/place_model.dart';
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

    final backgroundColor =
        _isSelected ? colorScheme.primary : colorScheme.secondary;
    final foregroundColor =
        _isSelected ? colorScheme.onPrimary : colorScheme.onSecondary;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          child: CircleAvatar(
              radius: 18.0,
              backgroundColor: backgroundColor,
              child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: CircleAvatar(backgroundColor: foregroundColor))),
        ),
        Positioned(
            top: 28.0,
            child: Container(
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(4.0)),
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                child: Text(_place.name, style: labelStyle)))
      ],
    );
  }
}
