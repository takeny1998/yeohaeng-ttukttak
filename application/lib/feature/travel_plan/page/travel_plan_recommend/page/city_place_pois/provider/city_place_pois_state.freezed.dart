// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_place_pois_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CityPlacePoisState {
  TravelModel get travel => throw _privateConstructorUsedError;
  CityModel get city => throw _privateConstructorUsedError;
  List<PlaceMetricModel> get placeMetrics => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  Set<PlaceCategoryType> get selectedTypes =>
      throw _privateConstructorUsedError;

  /// Create a copy of CityPlacePoisState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityPlacePoisStateCopyWith<CityPlacePoisState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityPlacePoisStateCopyWith<$Res> {
  factory $CityPlacePoisStateCopyWith(
          CityPlacePoisState value, $Res Function(CityPlacePoisState) then) =
      _$CityPlacePoisStateCopyWithImpl<$Res, CityPlacePoisState>;
  @useResult
  $Res call(
      {TravelModel travel,
      CityModel city,
      List<PlaceMetricModel> placeMetrics,
      bool hasNextPage,
      Set<PlaceCategoryType> selectedTypes});

  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class _$CityPlacePoisStateCopyWithImpl<$Res, $Val extends CityPlacePoisState>
    implements $CityPlacePoisStateCopyWith<$Res> {
  _$CityPlacePoisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityPlacePoisState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? city = freezed,
    Object? placeMetrics = null,
    Object? hasNextPage = null,
    Object? selectedTypes = null,
  }) {
    return _then(_value.copyWith(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityModel,
      placeMetrics: null == placeMetrics
          ? _value.placeMetrics
          : placeMetrics // ignore: cast_nullable_to_non_nullable
              as List<PlaceMetricModel>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTypes: null == selectedTypes
          ? _value.selectedTypes
          : selectedTypes // ignore: cast_nullable_to_non_nullable
              as Set<PlaceCategoryType>,
    ) as $Val);
  }

  /// Create a copy of CityPlacePoisState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelModelCopyWith<$Res> get travel {
    return $TravelModelCopyWith<$Res>(_value.travel, (value) {
      return _then(_value.copyWith(travel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CityPlacePoisStateImplCopyWith<$Res>
    implements $CityPlacePoisStateCopyWith<$Res> {
  factory _$$CityPlacePoisStateImplCopyWith(_$CityPlacePoisStateImpl value,
          $Res Function(_$CityPlacePoisStateImpl) then) =
      __$$CityPlacePoisStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TravelModel travel,
      CityModel city,
      List<PlaceMetricModel> placeMetrics,
      bool hasNextPage,
      Set<PlaceCategoryType> selectedTypes});

  @override
  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class __$$CityPlacePoisStateImplCopyWithImpl<$Res>
    extends _$CityPlacePoisStateCopyWithImpl<$Res, _$CityPlacePoisStateImpl>
    implements _$$CityPlacePoisStateImplCopyWith<$Res> {
  __$$CityPlacePoisStateImplCopyWithImpl(_$CityPlacePoisStateImpl _value,
      $Res Function(_$CityPlacePoisStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityPlacePoisState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? city = freezed,
    Object? placeMetrics = null,
    Object? hasNextPage = null,
    Object? selectedTypes = null,
  }) {
    return _then(_$CityPlacePoisStateImpl(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityModel,
      placeMetrics: null == placeMetrics
          ? _value._placeMetrics
          : placeMetrics // ignore: cast_nullable_to_non_nullable
              as List<PlaceMetricModel>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTypes: null == selectedTypes
          ? _value._selectedTypes
          : selectedTypes // ignore: cast_nullable_to_non_nullable
              as Set<PlaceCategoryType>,
    ));
  }
}

/// @nodoc

class _$CityPlacePoisStateImpl implements _CityPlacePoisState {
  const _$CityPlacePoisStateImpl(
      {required this.travel,
      required this.city,
      final List<PlaceMetricModel> placeMetrics = const [],
      this.hasNextPage = true,
      final Set<PlaceCategoryType> selectedTypes = const {}})
      : _placeMetrics = placeMetrics,
        _selectedTypes = selectedTypes;

  @override
  final TravelModel travel;
  @override
  final CityModel city;
  final List<PlaceMetricModel> _placeMetrics;
  @override
  @JsonKey()
  List<PlaceMetricModel> get placeMetrics {
    if (_placeMetrics is EqualUnmodifiableListView) return _placeMetrics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placeMetrics);
  }

  @override
  @JsonKey()
  final bool hasNextPage;
  final Set<PlaceCategoryType> _selectedTypes;
  @override
  @JsonKey()
  Set<PlaceCategoryType> get selectedTypes {
    if (_selectedTypes is EqualUnmodifiableSetView) return _selectedTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedTypes);
  }

  @override
  String toString() {
    return 'CityPlacePoisState(travel: $travel, city: $city, placeMetrics: $placeMetrics, hasNextPage: $hasNextPage, selectedTypes: $selectedTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityPlacePoisStateImpl &&
            (identical(other.travel, travel) || other.travel == travel) &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality()
                .equals(other._placeMetrics, _placeMetrics) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            const DeepCollectionEquality()
                .equals(other._selectedTypes, _selectedTypes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      travel,
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(_placeMetrics),
      hasNextPage,
      const DeepCollectionEquality().hash(_selectedTypes));

  /// Create a copy of CityPlacePoisState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityPlacePoisStateImplCopyWith<_$CityPlacePoisStateImpl> get copyWith =>
      __$$CityPlacePoisStateImplCopyWithImpl<_$CityPlacePoisStateImpl>(
          this, _$identity);
}

abstract class _CityPlacePoisState implements CityPlacePoisState {
  const factory _CityPlacePoisState(
      {required final TravelModel travel,
      required final CityModel city,
      final List<PlaceMetricModel> placeMetrics,
      final bool hasNextPage,
      final Set<PlaceCategoryType> selectedTypes}) = _$CityPlacePoisStateImpl;

  @override
  TravelModel get travel;
  @override
  CityModel get city;
  @override
  List<PlaceMetricModel> get placeMetrics;
  @override
  bool get hasNextPage;
  @override
  Set<PlaceCategoryType> get selectedTypes;

  /// Create a copy of CityPlacePoisState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityPlacePoisStateImplCopyWith<_$CityPlacePoisStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceMetricModel _$PlaceMetricModelFromJson(Map<String, dynamic> json) {
  return _PlaceMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceMetricModel {
  PlaceModel get place => throw _privateConstructorUsedError;
  int get visitCount => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;

  /// Serializes this PlaceMetricModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceMetricModelCopyWith<PlaceMetricModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceMetricModelCopyWith<$Res> {
  factory $PlaceMetricModelCopyWith(
          PlaceMetricModel value, $Res Function(PlaceMetricModel) then) =
      _$PlaceMetricModelCopyWithImpl<$Res, PlaceMetricModel>;
  @useResult
  $Res call({PlaceModel place, int visitCount, double? rating});

  $PlaceModelCopyWith<$Res> get place;
}

/// @nodoc
class _$PlaceMetricModelCopyWithImpl<$Res, $Val extends PlaceMetricModel>
    implements $PlaceMetricModelCopyWith<$Res> {
  _$PlaceMetricModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = null,
    Object? visitCount = null,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceModel,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of PlaceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaceModelCopyWith<$Res> get place {
    return $PlaceModelCopyWith<$Res>(_value.place, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceMetricsModelImplCopyWith<$Res>
    implements $PlaceMetricModelCopyWith<$Res> {
  factory _$$PlaceMetricsModelImplCopyWith(_$PlaceMetricsModelImpl value,
          $Res Function(_$PlaceMetricsModelImpl) then) =
      __$$PlaceMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceModel place, int visitCount, double? rating});

  @override
  $PlaceModelCopyWith<$Res> get place;
}

/// @nodoc
class __$$PlaceMetricsModelImplCopyWithImpl<$Res>
    extends _$PlaceMetricModelCopyWithImpl<$Res, _$PlaceMetricsModelImpl>
    implements _$$PlaceMetricsModelImplCopyWith<$Res> {
  __$$PlaceMetricsModelImplCopyWithImpl(_$PlaceMetricsModelImpl _value,
      $Res Function(_$PlaceMetricsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = null,
    Object? visitCount = null,
    Object? rating = freezed,
  }) {
    return _then(_$PlaceMetricsModelImpl(
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceModel,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceMetricsModelImpl implements _PlaceMetricsModel {
  const _$PlaceMetricsModelImpl(
      {required this.place, this.visitCount = 0, this.rating});

  factory _$PlaceMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceMetricsModelImplFromJson(json);

  @override
  final PlaceModel place;
  @override
  @JsonKey()
  final int visitCount;
  @override
  final double? rating;

  @override
  String toString() {
    return 'PlaceMetricModel(place: $place, visitCount: $visitCount, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceMetricsModelImpl &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, place, visitCount, rating);

  /// Create a copy of PlaceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceMetricsModelImplCopyWith<_$PlaceMetricsModelImpl> get copyWith =>
      __$$PlaceMetricsModelImplCopyWithImpl<_$PlaceMetricsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceMetricsModel implements PlaceMetricModel {
  const factory _PlaceMetricsModel(
      {required final PlaceModel place,
      final int visitCount,
      final double? rating}) = _$PlaceMetricsModelImpl;

  factory _PlaceMetricsModel.fromJson(Map<String, dynamic> json) =
      _$PlaceMetricsModelImpl.fromJson;

  @override
  PlaceModel get place;
  @override
  int get visitCount;
  @override
  double? get rating;

  /// Create a copy of PlaceMetricModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceMetricsModelImplCopyWith<_$PlaceMetricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
