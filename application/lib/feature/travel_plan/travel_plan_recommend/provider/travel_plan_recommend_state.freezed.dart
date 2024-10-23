// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_recommend_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelPlanRecommendState {
  List<RecommendModel> get recommendations =>
      throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanRecommendState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanRecommendStateCopyWith<TravelPlanRecommendState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanRecommendStateCopyWith<$Res> {
  factory $TravelPlanRecommendStateCopyWith(TravelPlanRecommendState value,
          $Res Function(TravelPlanRecommendState) then) =
      _$TravelPlanRecommendStateCopyWithImpl<$Res, TravelPlanRecommendState>;
  @useResult
  $Res call({List<RecommendModel> recommendations});
}

/// @nodoc
class _$TravelPlanRecommendStateCopyWithImpl<$Res,
        $Val extends TravelPlanRecommendState>
    implements $TravelPlanRecommendStateCopyWith<$Res> {
  _$TravelPlanRecommendStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanRecommendState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
  }) {
    return _then(_value.copyWith(
      recommendations: null == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<RecommendModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelPlanRecommendStateImplCopyWith<$Res>
    implements $TravelPlanRecommendStateCopyWith<$Res> {
  factory _$$TravelPlanRecommendStateImplCopyWith(
          _$TravelPlanRecommendStateImpl value,
          $Res Function(_$TravelPlanRecommendStateImpl) then) =
      __$$TravelPlanRecommendStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecommendModel> recommendations});
}

/// @nodoc
class __$$TravelPlanRecommendStateImplCopyWithImpl<$Res>
    extends _$TravelPlanRecommendStateCopyWithImpl<$Res,
        _$TravelPlanRecommendStateImpl>
    implements _$$TravelPlanRecommendStateImplCopyWith<$Res> {
  __$$TravelPlanRecommendStateImplCopyWithImpl(
      _$TravelPlanRecommendStateImpl _value,
      $Res Function(_$TravelPlanRecommendStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanRecommendState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendations = null,
  }) {
    return _then(_$TravelPlanRecommendStateImpl(
      recommendations: null == recommendations
          ? _value._recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as List<RecommendModel>,
    ));
  }
}

/// @nodoc

class _$TravelPlanRecommendStateImpl extends _TravelPlanRecommendState {
  const _$TravelPlanRecommendStateImpl(
      {final List<RecommendModel> recommendations = const []})
      : _recommendations = recommendations,
        super._();

  final List<RecommendModel> _recommendations;
  @override
  @JsonKey()
  List<RecommendModel> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'TravelPlanRecommendState(recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanRecommendStateImpl &&
            const DeepCollectionEquality()
                .equals(other._recommendations, _recommendations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recommendations));

  /// Create a copy of TravelPlanRecommendState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanRecommendStateImplCopyWith<_$TravelPlanRecommendStateImpl>
      get copyWith => __$$TravelPlanRecommendStateImplCopyWithImpl<
          _$TravelPlanRecommendStateImpl>(this, _$identity);
}

abstract class _TravelPlanRecommendState extends TravelPlanRecommendState {
  const factory _TravelPlanRecommendState(
          {final List<RecommendModel> recommendations}) =
      _$TravelPlanRecommendStateImpl;
  const _TravelPlanRecommendState._() : super._();

  @override
  List<RecommendModel> get recommendations;

  /// Create a copy of TravelPlanRecommendState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanRecommendStateImplCopyWith<_$TravelPlanRecommendStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
