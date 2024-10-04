// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelDetailModel _$TravelDetailModelFromJson(Map<String, dynamic> json) {
  return _TravelDetailModel.fromJson(json);
}

/// @nodoc
mixin _$TravelDetailModel {
  TravelModel get travel => throw _privateConstructorUsedError;
  List<TravelVisitModel> get visits => throw _privateConstructorUsedError;
  List<PlaceModel> get places => throw _privateConstructorUsedError;
  List<CityModel> get cities => throw _privateConstructorUsedError;

  /// Serializes this TravelDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelDetailModelCopyWith<TravelDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelDetailModelCopyWith<$Res> {
  factory $TravelDetailModelCopyWith(
          TravelDetailModel value, $Res Function(TravelDetailModel) then) =
      _$TravelDetailModelCopyWithImpl<$Res, TravelDetailModel>;
  @useResult
  $Res call(
      {TravelModel travel,
      List<TravelVisitModel> visits,
      List<PlaceModel> places,
      List<CityModel> cities});

  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class _$TravelDetailModelCopyWithImpl<$Res, $Val extends TravelDetailModel>
    implements $TravelDetailModelCopyWith<$Res> {
  _$TravelDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? visits = null,
    Object? places = null,
    Object? cities = null,
  }) {
    return _then(_value.copyWith(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      visits: null == visits
          ? _value.visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<TravelVisitModel>,
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ) as $Val);
  }

  /// Create a copy of TravelDetailModel
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
abstract class _$$TravelDetailModelImplCopyWith<$Res>
    implements $TravelDetailModelCopyWith<$Res> {
  factory _$$TravelDetailModelImplCopyWith(_$TravelDetailModelImpl value,
          $Res Function(_$TravelDetailModelImpl) then) =
      __$$TravelDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TravelModel travel,
      List<TravelVisitModel> visits,
      List<PlaceModel> places,
      List<CityModel> cities});

  @override
  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class __$$TravelDetailModelImplCopyWithImpl<$Res>
    extends _$TravelDetailModelCopyWithImpl<$Res, _$TravelDetailModelImpl>
    implements _$$TravelDetailModelImplCopyWith<$Res> {
  __$$TravelDetailModelImplCopyWithImpl(_$TravelDetailModelImpl _value,
      $Res Function(_$TravelDetailModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? visits = null,
    Object? places = null,
    Object? cities = null,
  }) {
    return _then(_$TravelDetailModelImpl(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      visits: null == visits
          ? _value._visits
          : visits // ignore: cast_nullable_to_non_nullable
              as List<TravelVisitModel>,
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelDetailModelImpl implements _TravelDetailModel {
  const _$TravelDetailModelImpl(
      {required this.travel,
      final List<TravelVisitModel> visits = const [],
      final List<PlaceModel> places = const [],
      final List<CityModel> cities = const []})
      : _visits = visits,
        _places = places,
        _cities = cities;

  factory _$TravelDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelDetailModelImplFromJson(json);

  @override
  final TravelModel travel;
  final List<TravelVisitModel> _visits;
  @override
  @JsonKey()
  List<TravelVisitModel> get visits {
    if (_visits is EqualUnmodifiableListView) return _visits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visits);
  }

  final List<PlaceModel> _places;
  @override
  @JsonKey()
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
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
    return 'TravelDetailModel(travel: $travel, visits: $visits, places: $places, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelDetailModelImpl &&
            (identical(other.travel, travel) || other.travel == travel) &&
            const DeepCollectionEquality().equals(other._visits, _visits) &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      travel,
      const DeepCollectionEquality().hash(_visits),
      const DeepCollectionEquality().hash(_places),
      const DeepCollectionEquality().hash(_cities));

  /// Create a copy of TravelDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelDetailModelImplCopyWith<_$TravelDetailModelImpl> get copyWith =>
      __$$TravelDetailModelImplCopyWithImpl<_$TravelDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelDetailModelImplToJson(
      this,
    );
  }
}

abstract class _TravelDetailModel implements TravelDetailModel {
  const factory _TravelDetailModel(
      {required final TravelModel travel,
      final List<TravelVisitModel> visits,
      final List<PlaceModel> places,
      final List<CityModel> cities}) = _$TravelDetailModelImpl;

  factory _TravelDetailModel.fromJson(Map<String, dynamic> json) =
      _$TravelDetailModelImpl.fromJson;

  @override
  TravelModel get travel;
  @override
  List<TravelVisitModel> get visits;
  @override
  List<PlaceModel> get places;
  @override
  List<CityModel> get cities;

  /// Create a copy of TravelDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelDetailModelImplCopyWith<_$TravelDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
