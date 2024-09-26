// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_travel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateTravelState {
  DateTime? get startedOn => throw _privateConstructorUsedError;
  DateTime? get endedOn => throw _privateConstructorUsedError;
  TravelCompanion? get companion => throw _privateConstructorUsedError;
  List<TravelMotivation> get motivations => throw _privateConstructorUsedError;
  List<RegionModel> get regions => throw _privateConstructorUsedError;
  List<RegionModel> get cities => throw _privateConstructorUsedError;

  /// Create a copy of CreateTravelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTravelStateCopyWith<CreateTravelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTravelStateCopyWith<$Res> {
  factory $CreateTravelStateCopyWith(
          CreateTravelState value, $Res Function(CreateTravelState) then) =
      _$CreateTravelStateCopyWithImpl<$Res, CreateTravelState>;
  @useResult
  $Res call(
      {DateTime? startedOn,
      DateTime? endedOn,
      TravelCompanion? companion,
      List<TravelMotivation> motivations,
      List<RegionModel> regions,
      List<RegionModel> cities});
}

/// @nodoc
class _$CreateTravelStateCopyWithImpl<$Res, $Val extends CreateTravelState>
    implements $CreateTravelStateCopyWith<$Res> {
  _$CreateTravelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTravelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedOn = freezed,
    Object? endedOn = freezed,
    Object? companion = freezed,
    Object? motivations = null,
    Object? regions = null,
    Object? cities = null,
  }) {
    return _then(_value.copyWith(
      startedOn: freezed == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedOn: freezed == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      companion: freezed == companion
          ? _value.companion
          : companion // ignore: cast_nullable_to_non_nullable
              as TravelCompanion?,
      motivations: null == motivations
          ? _value.motivations
          : motivations // ignore: cast_nullable_to_non_nullable
              as List<TravelMotivation>,
      regions: null == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTravelStateImplCopyWith<$Res>
    implements $CreateTravelStateCopyWith<$Res> {
  factory _$$CreateTravelStateImplCopyWith(_$CreateTravelStateImpl value,
          $Res Function(_$CreateTravelStateImpl) then) =
      __$$CreateTravelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startedOn,
      DateTime? endedOn,
      TravelCompanion? companion,
      List<TravelMotivation> motivations,
      List<RegionModel> regions,
      List<RegionModel> cities});
}

/// @nodoc
class __$$CreateTravelStateImplCopyWithImpl<$Res>
    extends _$CreateTravelStateCopyWithImpl<$Res, _$CreateTravelStateImpl>
    implements _$$CreateTravelStateImplCopyWith<$Res> {
  __$$CreateTravelStateImplCopyWithImpl(_$CreateTravelStateImpl _value,
      $Res Function(_$CreateTravelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTravelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedOn = freezed,
    Object? endedOn = freezed,
    Object? companion = freezed,
    Object? motivations = null,
    Object? regions = null,
    Object? cities = null,
  }) {
    return _then(_$CreateTravelStateImpl(
      startedOn: freezed == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedOn: freezed == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      companion: freezed == companion
          ? _value.companion
          : companion // ignore: cast_nullable_to_non_nullable
              as TravelCompanion?,
      motivations: null == motivations
          ? _value._motivations
          : motivations // ignore: cast_nullable_to_non_nullable
              as List<TravelMotivation>,
      regions: null == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
      cities: null == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<RegionModel>,
    ));
  }
}

/// @nodoc

class _$CreateTravelStateImpl implements _CreateTravelState {
  const _$CreateTravelStateImpl(
      {this.startedOn,
      this.endedOn,
      this.companion,
      final List<TravelMotivation> motivations = const [],
      final List<RegionModel> regions = const [],
      final List<RegionModel> cities = const []})
      : _motivations = motivations,
        _regions = regions,
        _cities = cities;

  @override
  final DateTime? startedOn;
  @override
  final DateTime? endedOn;
  @override
  final TravelCompanion? companion;
  final List<TravelMotivation> _motivations;
  @override
  @JsonKey()
  List<TravelMotivation> get motivations {
    if (_motivations is EqualUnmodifiableListView) return _motivations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_motivations);
  }

  final List<RegionModel> _regions;
  @override
  @JsonKey()
  List<RegionModel> get regions {
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_regions);
  }

  final List<RegionModel> _cities;
  @override
  @JsonKey()
  List<RegionModel> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  @override
  String toString() {
    return 'CreateTravelState(startedOn: $startedOn, endedOn: $endedOn, companion: $companion, motivations: $motivations, regions: $regions, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTravelStateImpl &&
            (identical(other.startedOn, startedOn) ||
                other.startedOn == startedOn) &&
            (identical(other.endedOn, endedOn) || other.endedOn == endedOn) &&
            (identical(other.companion, companion) ||
                other.companion == companion) &&
            const DeepCollectionEquality()
                .equals(other._motivations, _motivations) &&
            const DeepCollectionEquality().equals(other._regions, _regions) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startedOn,
      endedOn,
      companion,
      const DeepCollectionEquality().hash(_motivations),
      const DeepCollectionEquality().hash(_regions),
      const DeepCollectionEquality().hash(_cities));

  /// Create a copy of CreateTravelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTravelStateImplCopyWith<_$CreateTravelStateImpl> get copyWith =>
      __$$CreateTravelStateImplCopyWithImpl<_$CreateTravelStateImpl>(
          this, _$identity);
}

abstract class _CreateTravelState implements CreateTravelState {
  const factory _CreateTravelState(
      {final DateTime? startedOn,
      final DateTime? endedOn,
      final TravelCompanion? companion,
      final List<TravelMotivation> motivations,
      final List<RegionModel> regions,
      final List<RegionModel> cities}) = _$CreateTravelStateImpl;

  @override
  DateTime? get startedOn;
  @override
  DateTime? get endedOn;
  @override
  TravelCompanion? get companion;
  @override
  List<TravelMotivation> get motivations;
  @override
  List<RegionModel> get regions;
  @override
  List<RegionModel> get cities;

  /// Create a copy of CreateTravelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTravelStateImplCopyWith<_$CreateTravelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
