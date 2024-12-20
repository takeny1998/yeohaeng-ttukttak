import 'package:application_new/domain/geography/geography_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:latlong2/latlong.dart';

final class PolygonUtil {
  PolygonUtil._();

  static PolygonCreationCallback createPolygonCallback(BuildContext context, String Function(int id) findName) =>
      (List<LatLng> points, List<List<LatLng>>? holePointsList,
          Map<String, dynamic> properties) {
        final colorScheme = Theme.of(context).colorScheme;
        final int id = properties['id'];

        return Polygon<int>(
          hitValue: id,
          points: points,
          label: findName(id),
          labelStyle: TextStyle(
            fontFamily: 'Noto Sans',
            color: colorScheme.primary,
            fontSize: 11.0,
            fontWeight: FontWeight.w600
          ),
          rotateLabel: true,
          labelPlacement: PolygonLabelPlacement.polylabel,
          holePointsList: holePointsList,
          borderColor: colorScheme.onSurface,
          color: colorScheme.surface,
          borderStrokeWidth: 0.5,
        );
      };

  static Polygon<T> copyWith<T extends Object>(
    Polygon<T> polygon, {
    Color? borderColor,
    Color? color,
    TextStyle? labelStyle,
  }) =>
      Polygon<T>(
          hitValue: polygon.hitValue,
          points: polygon.points,
          holePointsList: polygon.holePointsList,
          borderColor: borderColor ?? polygon.borderColor,
          color: color ?? polygon.color,
          labelStyle: polygon.labelStyle.merge(labelStyle),
          label: polygon.label,
          labelPlacement: polygon.labelPlacement,
          borderStrokeWidth: 2.0);
}
