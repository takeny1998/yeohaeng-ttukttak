// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_place_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CityPlaceListState {
  List<PlaceMetricModel> get placeMetrics => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  PlaceViewType get viewType => throw _privateConstructorUsedError;
  PlaceSortType get sortType => throw _privateConstructorUsedError;

  /// Create a copy of CityPlaceListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityPlaceListStateCopyWith<CityPlaceListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityPlaceListStateCopyWith<$Res> {
  factory $CityPlaceListStateCopyWith(
          CityPlaceListState value, $Res Function(CityPlaceListState) then) =
      _$CityPlaceListStateCopyWithImpl<$Res, CityPlaceListState>;
  @useResult
  $Res call(
      {List<PlaceMetricModel> placeMetrics,
      bool hasNextPage,
      PlaceViewType viewType,
      PlaceSortType sortType});
}

/// @nodoc
class _$CityPlaceListStateCopyWithImpl<$Res, $Val extends CityPlaceListState>
    implements $CityPlaceListStateCopyWith<$Res> {
  _$CityPlaceListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityPlaceListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeMetrics = null,
    Object? hasNextPage = null,
    Object? viewType = null,
    Object? sortType = null,
  }) {
    return _then(_value.copyWith(
      placeMetrics: null == placeMetrics
          ? _value.placeMetrics
          : placeMetrics // ignore: cast_nullable_to_non_nullable
              as List<PlaceMetricModel>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as PlaceViewType,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as PlaceSortType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityPlaceListStateImplCopyWith<$Res>
    implements $CityPlaceListStateCopyWith<$Res> {
  factory _$$CityPlaceListStateImplCopyWith(_$CityPlaceListStateImpl value,
          $Res Function(_$CityPlaceListStateImpl) then) =
      __$$CityPlaceListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PlaceMetricModel> placeMetrics,
      bool hasNextPage,
      PlaceViewType viewType,
      PlaceSortType sortType});
}

/// @nodoc
class __$$CityPlaceListStateImplCopyWithImpl<$Res>
    extends _$CityPlaceListStateCopyWithImpl<$Res, _$CityPlaceListStateImpl>
    implements _$$CityPlaceListStateImplCopyWith<$Res> {
  __$$CityPlaceListStateImplCopyWithImpl(_$CityPlaceListStateImpl _value,
      $Res Function(_$CityPlaceListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityPlaceListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeMetrics = null,
    Object? hasNextPage = null,
    Object? viewType = null,
    Object? sortType = null,
  }) {
    return _then(_$CityPlaceListStateImpl(
      placeMetrics: null == placeMetrics
          ? _value._placeMetrics
          : placeMetrics // ignore: cast_nullable_to_non_nullable
              as List<PlaceMetricModel>,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      viewType: null == viewType
          ? _value.viewType
          : viewType // ignore: cast_nullable_to_non_nullable
              as PlaceViewType,
      sortType: null == sortType
          ? _value.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as PlaceSortType,
    ));
  }
}

/// @nodoc

class _$CityPlaceListStateImpl implements _CityPlaceListState {
  const _$CityPlaceListStateImpl(
      {final List<PlaceMetricModel> placeMetrics = const [],
      this.hasNextPage = true,
      this.viewType = PlaceViewType.list,
      this.sortType = PlaceSortType.rating})
      : _placeMetrics = placeMetrics;

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
  @override
  @JsonKey()
  final PlaceViewType viewType;
  @override
  @JsonKey()
  final PlaceSortType sortType;

  @override
  String toString() {
    return 'CityPlaceListState(placeMetrics: $placeMetrics, hasNextPage: $hasNextPage, viewType: $viewType, sortType: $sortType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityPlaceListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._placeMetrics, _placeMetrics) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.viewType, viewType) ||
                other.viewType == viewType) &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_placeMetrics),
      hasNextPage,
      viewType,
      sortType);

  /// Create a copy of CityPlaceListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityPlaceListStateImplCopyWith<_$CityPlaceListStateImpl> get copyWith =>
      __$$CityPlaceListStateImplCopyWithImpl<_$CityPlaceListStateImpl>(
          this, _$identity);
}

abstract class _CityPlaceListState implements CityPlaceListState {
  const factory _CityPlaceListState(
      {final List<PlaceMetricModel> placeMetrics,
      final bool hasNextPage,
      final PlaceViewType viewType,
      final PlaceSortType sortType}) = _$CityPlaceListStateImpl;

  @override
  List<PlaceMetricModel> get placeMetrics;
  @override
  bool get hasNextPage;
  @override
  PlaceViewType get viewType;
  @override
  PlaceSortType get sortType;

  /// Create a copy of CityPlaceListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityPlaceListStateImplCopyWith<_$CityPlaceListStateImpl> get copyWith =>
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
      {required this.place, required this.visitCount, this.rating});

  factory _$PlaceMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceMetricsModelImplFromJson(json);

  @override
  final PlaceModel place;
  @override
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
      required final int visitCount,
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
