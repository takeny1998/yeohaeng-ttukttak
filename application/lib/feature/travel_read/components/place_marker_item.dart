import 'package:application_new/domain/place/place_model.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class PlaceMarkerItem extends StatelessWidget {
  final bool isSelected;
  final PlaceModel place;
  final double radius;

  const PlaceMarkerItem({
    super.key,
    required this.place,
    required this.isSelected,
    this.radius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final labelStyle = TextStyle(
      fontSize: 13.0,
      color: colorScheme.primary,
      fontWeight: FontWeight.w600,
    );

    final backgroundColor =
        isSelected ? colorScheme.primary : colorScheme.primaryContainer;
    final foregroundColor =
        isSelected ? colorScheme.onPrimary : colorScheme.primary;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: colorScheme.primaryFixedDim)),
              child: Icon(
                place.categoryTypes.first.iconData,
                color: foregroundColor,
                size: radius / 2,
              )),
        ),
        Positioned(
            top: radius + 4.0,
            child: BorderedText(
                strokeColor: Colors.white,
                strokeWidth: 3.0,
                child: Text(place.name, style: labelStyle)))
      ],
    );
  }
}
