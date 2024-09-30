// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geography_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeographyState {
  List<RegionModel> get regions => throw _privateConstructorUsedError;
  List<CityModel> get cities => throw _privateConstructorUsedError;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeographyStateCopyWith<GeographyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeographyStateCopyWith<$Res> {
  factory $GeographyStateCopyWith(
          GeographyState value, $Res Function(GeographyState) then) =
      _$GeographyStateCopyWithImpl<$Res, GeographyState>;
  @useResult
  $Res call({List<RegionModel> regions, List<CityModel> cities});
}

/// @nodoc
class _$GeographyStateCopyWithImpl<$Res, $Val extends GeographyState>
    implements $GeographyStateCopyWith<$Res> {
  _$GeographyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
    Object? cities = null,
  }) {
    return _then(_value.copyWith(
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeographyStateImplCopyWith<$Res>
    implements $GeographyStateCopyWith<$Res> {
  factory _$$GeographyStateImplCopyWith(_$GeographyStateImpl value,
          $Res Function(_$GeographyStateImpl) then) =
      __$$GeographyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RegionModel> regions, List<CityModel> cities});
}

/// @nodoc
class __$$GeographyStateImplCopyWithImpl<$Res>
    extends _$GeographyStateCopyWithImpl<$Res, _$GeographyStateImpl>
    implements _$$GeographyStateImplCopyWith<$Res> {
  __$$GeographyStateImplCopyWithImpl(
      _$GeographyStateImpl _value, $Res Function(_$GeographyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regions = null,
    Object? cities = null,
  }) {
    return _then(_$GeographyStateImpl(
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc

class _$GeographyStateImpl implements _GeographyState {
  const _$GeographyStateImpl(
      {final List<RegionModel> regions = const [],
      final List<CityModel> cities = const []})
      : _regions = regions,
        _cities = cities;

  final List<RegionModel> _regions;
  @override
  @JsonKey()
  List<RegionModel> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  final List<CityModel> _cities;
  @override
  @JsonKey()
  List<CityModel> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'GeographyState(regions: $regions, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeographyStateImpl &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_regions),
      const DeepCollectionEquality().hash(_cities));

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeographyStateImplCopyWith<_$GeographyStateImpl> get copyWith =>
      __$$GeographyStateImplCopyWithImpl<_$GeographyStateImpl>(
          this, _$identity);
}

abstract class _GeographyState implements GeographyState {
  const factory _GeographyState(
      {final List<RegionModel> regions,
      final List<CityModel> cities}) = _$GeographyStateImpl;

  @override
  List<RegionModel> get regions;
  @override
  List<CityModel> get cities;

  /// Create a copy of GeographyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeographyStateImplCopyWith<_$GeographyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
