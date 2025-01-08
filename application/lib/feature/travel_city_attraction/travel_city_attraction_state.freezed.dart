// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_city_attraction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelCityAttractionState {
  TravelModel get travel => throw _privateConstructorUsedError;
  List<InfiniteScrollModel<AttractionModel>> get attractions =>
      throw _privateConstructorUsedError;

  /// Create a copy of TravelCityAttractionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelCityAttractionStateCopyWith<TravelCityAttractionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelCityAttractionStateCopyWith<$Res> {
  factory $TravelCityAttractionStateCopyWith(TravelCityAttractionState value,
          $Res Function(TravelCityAttractionState) then) =
      _$TravelCityAttractionStateCopyWithImpl<$Res, TravelCityAttractionState>;
  @useResult
  $Res call(
      {TravelModel travel,
      List<InfiniteScrollModel<AttractionModel>> attractions});

  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class _$TravelCityAttractionStateCopyWithImpl<$Res,
        $Val extends TravelCityAttractionState>
    implements $TravelCityAttractionStateCopyWith<$Res> {
  _$TravelCityAttractionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelCityAttractionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? attractions = null,
  }) {
    return _then(_value.copyWith(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      attractions: null == attractions
          ? _value.attractions
          : attractions // ignore: cast_nullable_to_non_nullable
              as List<InfiniteScrollModel<AttractionModel>>,
    ) as $Val);
  }

  /// Create a copy of TravelCityAttractionState
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
abstract class _$$TravelCityAttractionStateImplCopyWith<$Res>
    implements $TravelCityAttractionStateCopyWith<$Res> {
  factory _$$TravelCityAttractionStateImplCopyWith(
          _$TravelCityAttractionStateImpl value,
          $Res Function(_$TravelCityAttractionStateImpl) then) =
      __$$TravelCityAttractionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TravelModel travel,
      List<InfiniteScrollModel<AttractionModel>> attractions});

  @override
  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class __$$TravelCityAttractionStateImplCopyWithImpl<$Res>
    extends _$TravelCityAttractionStateCopyWithImpl<$Res,
        _$TravelCityAttractionStateImpl>
    implements _$$TravelCityAttractionStateImplCopyWith<$Res> {
  __$$TravelCityAttractionStateImplCopyWithImpl(
      _$TravelCityAttractionStateImpl _value,
      $Res Function(_$TravelCityAttractionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelCityAttractionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? attractions = null,
  }) {
    return _then(_$TravelCityAttractionStateImpl(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      attractions: null == attractions
          ? _value._attractions
          : attractions // ignore: cast_nullable_to_non_nullable
              as List<InfiniteScrollModel<AttractionModel>>,
    ));
  }
}

/// @nodoc

class _$TravelCityAttractionStateImpl implements _TravelCityAttractionState {
  const _$TravelCityAttractionStateImpl(
      {required this.travel,
      required final List<InfiniteScrollModel<AttractionModel>> attractions})
      : _attractions = attractions;

  @override
  final TravelModel travel;
  final List<InfiniteScrollModel<AttractionModel>> _attractions;
  @override
  List<InfiniteScrollModel<AttractionModel>> get attractions {
    if (_attractions is EqualUnmodifiableListView) return _attractions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attractions);
  }

  @override
  String toString() {
    return 'TravelCityAttractionState(travel: $travel, attractions: $attractions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelCityAttractionStateImpl &&
            (identical(other.travel, travel) || other.travel == travel) &&
            const DeepCollectionEquality()
                .equals(other._attractions, _attractions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, travel, const DeepCollectionEquality().hash(_attractions));

  /// Create a copy of TravelCityAttractionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelCityAttractionStateImplCopyWith<_$TravelCityAttractionStateImpl>
      get copyWith => __$$TravelCityAttractionStateImplCopyWithImpl<
          _$TravelCityAttractionStateImpl>(this, _$identity);
}

abstract class _TravelCityAttractionState implements TravelCityAttractionState {
  const factory _TravelCityAttractionState(
      {required final TravelModel travel,
      required final List<InfiniteScrollModel<AttractionModel>>
          attractions}) = _$TravelCityAttractionStateImpl;

  @override
  TravelModel get travel;
  @override
  List<InfiniteScrollModel<AttractionModel>> get attractions;

  /// Create a copy of TravelCityAttractionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelCityAttractionStateImplCopyWith<_$TravelCityAttractionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
