// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_coordinates.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceCoordinates _$PlaceCoordinatesFromJson(Map<String, dynamic> json) {
  return _PlaceCoordinates.fromJson(json);
}

/// @nodoc
mixin _$PlaceCoordinates {
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;

  /// Serializes this PlaceCoordinates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceCoordinatesCopyWith<PlaceCoordinates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCoordinatesCopyWith<$Res> {
  factory $PlaceCoordinatesCopyWith(
          PlaceCoordinates value, $Res Function(PlaceCoordinates) then) =
      _$PlaceCoordinatesCopyWithImpl<$Res, PlaceCoordinates>;
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class _$PlaceCoordinatesCopyWithImpl<$Res, $Val extends PlaceCoordinates>
    implements $PlaceCoordinatesCopyWith<$Res> {
  _$PlaceCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_value.copyWith(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceCoordinatesImplCopyWith<$Res>
    implements $PlaceCoordinatesCopyWith<$Res> {
  factory _$$PlaceCoordinatesImplCopyWith(_$PlaceCoordinatesImpl value,
          $Res Function(_$PlaceCoordinatesImpl) then) =
      __$$PlaceCoordinatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double longitude, double latitude});
}

/// @nodoc
class __$$PlaceCoordinatesImplCopyWithImpl<$Res>
    extends _$PlaceCoordinatesCopyWithImpl<$Res, _$PlaceCoordinatesImpl>
    implements _$$PlaceCoordinatesImplCopyWith<$Res> {
  __$$PlaceCoordinatesImplCopyWithImpl(_$PlaceCoordinatesImpl _value,
      $Res Function(_$PlaceCoordinatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longitude = null,
    Object? latitude = null,
  }) {
    return _then(_$PlaceCoordinatesImpl(
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceCoordinatesImpl implements _PlaceCoordinates {
  const _$PlaceCoordinatesImpl(
      {required this.longitude, required this.latitude});

  factory _$PlaceCoordinatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceCoordinatesImplFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;

  @override
  String toString() {
    return 'PlaceCoordinates(longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceCoordinatesImpl &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, longitude, latitude);

  /// Create a copy of PlaceCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceCoordinatesImplCopyWith<_$PlaceCoordinatesImpl> get copyWith =>
      __$$PlaceCoordinatesImplCopyWithImpl<_$PlaceCoordinatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceCoordinatesImplToJson(
      this,
    );
  }
}

abstract class _PlaceCoordinates implements PlaceCoordinates {
  const factory _PlaceCoordinates(
      {required final double longitude,
      required final double latitude}) = _$PlaceCoordinatesImpl;

  factory _PlaceCoordinates.fromJson(Map<String, dynamic> json) =
      _$PlaceCoordinatesImpl.fromJson;

  @override
  double get longitude;
  @override
  double get latitude;

  /// Create a copy of PlaceCoordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceCoordinatesImplCopyWith<_$PlaceCoordinatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
