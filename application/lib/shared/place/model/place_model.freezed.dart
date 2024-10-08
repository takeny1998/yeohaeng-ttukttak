// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return _PlaceModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PlaceCoordinates get coordinates => throw _privateConstructorUsedError;

  /// Serializes this PlaceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceModelCopyWith<PlaceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceModelCopyWith<$Res> {
  factory $PlaceModelCopyWith(
          PlaceModel value, $Res Function(PlaceModel) then) =
      _$PlaceModelCopyWithImpl<$Res, PlaceModel>;
  @useResult
  $Res call({int id, String name, PlaceCoordinates coordinates});

  $PlaceCoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$PlaceModelCopyWithImpl<$Res, $Val extends PlaceModel>
    implements $PlaceModelCopyWith<$Res> {
  _$PlaceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as PlaceCoordinates,
    ) as $Val);
  }

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceCoordinatesCopyWith<$Res> get coordinates {
    return $PlaceCoordinatesCopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceModelImplCopyWith<$Res>
    implements $PlaceModelCopyWith<$Res> {
  factory _$$PlaceModelImplCopyWith(
          _$PlaceModelImpl value, $Res Function(_$PlaceModelImpl) then) =
      __$$PlaceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, PlaceCoordinates coordinates});

  @override
  $PlaceCoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$PlaceModelImplCopyWithImpl<$Res>
    extends _$PlaceModelCopyWithImpl<$Res, _$PlaceModelImpl>
    implements _$$PlaceModelImplCopyWith<$Res> {
  __$$PlaceModelImplCopyWithImpl(
      _$PlaceModelImpl _value, $Res Function(_$PlaceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? coordinates = null,
  }) {
    return _then(_$PlaceModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as PlaceCoordinates,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceModelImpl implements _PlaceModel {
  const _$PlaceModelImpl(
      {required this.id, required this.name, required this.coordinates});

  factory _$PlaceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final PlaceCoordinates coordinates;

  @override
  String toString() {
    return 'PlaceModel(id: $id, name: $name, coordinates: $coordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, coordinates);

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      __$$PlaceModelImplCopyWithImpl<_$PlaceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceModel implements PlaceModel {
  const factory _PlaceModel(
      {required final int id,
      required final String name,
      required final PlaceCoordinates coordinates}) = _$PlaceModelImpl;

  factory _PlaceModel.fromJson(Map<String, dynamic> json) =
      _$PlaceModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  PlaceCoordinates get coordinates;

  /// Create a copy of PlaceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceModelImplCopyWith<_$PlaceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
