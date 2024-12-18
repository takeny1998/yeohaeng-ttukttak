import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_geojson/flutter_map_geojson.dart';
import 'package:latlong2/latlong.dart';

final class PolygonUtil {
  PolygonUtil._();

  static PolygonCreationCallback createPolygonCallback(BuildContext context) =>
      (List<LatLng> points, List<List<LatLng>>? holePointsList,
          Map<String, dynamic> properties) {
        final colorScheme = Theme.of(context).colorScheme;

        return Polygon<int>(
          hitValue: properties['id'],
          points: points,
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
  }) => Polygon<T>(
        hitValue: polygon.hitValue,
        points: polygon.points,
        holePointsList: polygon.holePointsList,
        borderColor: borderColor ?? polygon.borderColor,
        color: color ?? polygon.color,
        borderStrokeWidth: 2.0);
}
