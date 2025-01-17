// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_manage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelPlanManageState {
  TravelModel get travel => throw _privateConstructorUsedError;
  List<TravelPlanModel> get plans => throw _privateConstructorUsedError;
  DateTime get selectedDate => throw _privateConstructorUsedError;
  int get mapHeightLevel => throw _privateConstructorUsedError;
  bool get isAnimating => throw _privateConstructorUsedError;
  int? get draggingIndex => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanManageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanManageStateCopyWith<TravelPlanManageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanManageStateCopyWith<$Res> {
  factory $TravelPlanManageStateCopyWith(TravelPlanManageState value,
          $Res Function(TravelPlanManageState) then) =
      _$TravelPlanManageStateCopyWithImpl<$Res, TravelPlanManageState>;
  @useResult
  $Res call(
      {TravelModel travel,
      List<TravelPlanModel> plans,
      DateTime selectedDate,
      int mapHeightLevel,
      bool isAnimating,
      int? draggingIndex});

  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class _$TravelPlanManageStateCopyWithImpl<$Res,
        $Val extends TravelPlanManageState>
    implements $TravelPlanManageStateCopyWith<$Res> {
  _$TravelPlanManageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanManageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? plans = null,
    Object? selectedDate = null,
    Object? mapHeightLevel = null,
    Object? isAnimating = null,
    Object? draggingIndex = freezed,
  }) {
    return _then(_value.copyWith(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      plans: null == plans
          ? _value.plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<TravelPlanModel>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mapHeightLevel: null == mapHeightLevel
          ? _value.mapHeightLevel
          : mapHeightLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isAnimating: null == isAnimating
          ? _value.isAnimating
          : isAnimating // ignore: cast_nullable_to_non_nullable
              as bool,
      draggingIndex: freezed == draggingIndex
          ? _value.draggingIndex
          : draggingIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of TravelPlanManageState
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
abstract class _$$TravelPlanManageStateImplCopyWith<$Res>
    implements $TravelPlanManageStateCopyWith<$Res> {
  factory _$$TravelPlanManageStateImplCopyWith(
          _$TravelPlanManageStateImpl value,
          $Res Function(_$TravelPlanManageStateImpl) then) =
      __$$TravelPlanManageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TravelModel travel,
      List<TravelPlanModel> plans,
      DateTime selectedDate,
      int mapHeightLevel,
      bool isAnimating,
      int? draggingIndex});

  @override
  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class __$$TravelPlanManageStateImplCopyWithImpl<$Res>
    extends _$TravelPlanManageStateCopyWithImpl<$Res,
        _$TravelPlanManageStateImpl>
    implements _$$TravelPlanManageStateImplCopyWith<$Res> {
  __$$TravelPlanManageStateImplCopyWithImpl(_$TravelPlanManageStateImpl _value,
      $Res Function(_$TravelPlanManageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanManageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? plans = null,
    Object? selectedDate = null,
    Object? mapHeightLevel = null,
    Object? isAnimating = null,
    Object? draggingIndex = freezed,
  }) {
    return _then(_$TravelPlanManageStateImpl(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      plans: null == plans
          ? _value._plans
          : plans // ignore: cast_nullable_to_non_nullable
              as List<TravelPlanModel>,
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mapHeightLevel: null == mapHeightLevel
          ? _value.mapHeightLevel
          : mapHeightLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isAnimating: null == isAnimating
          ? _value.isAnimating
          : isAnimating // ignore: cast_nullable_to_non_nullable
              as bool,
      draggingIndex: freezed == draggingIndex
          ? _value.draggingIndex
          : draggingIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TravelPlanManageStateImpl implements _TravelPlanManageState {
  const _$TravelPlanManageStateImpl(
      {required this.travel,
      required final List<TravelPlanModel> plans,
      required this.selectedDate,
      this.mapHeightLevel = 1,
      this.isAnimating = false,
      this.draggingIndex})
      : _plans = plans;

  @override
  final TravelModel travel;
  final List<TravelPlanModel> _plans;
  @override
  List<TravelPlanModel> get plans {
    if (_plans is EqualUnmodifiableListView) return _plans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_plans);
  }

  @override
  final DateTime selectedDate;
  @override
  @JsonKey()
  final int mapHeightLevel;
  @override
  @JsonKey()
  final bool isAnimating;
  @override
  final int? draggingIndex;

  @override
  String toString() {
    return 'TravelPlanManageState(travel: $travel, plans: $plans, selectedDate: $selectedDate, mapHeightLevel: $mapHeightLevel, isAnimating: $isAnimating, draggingIndex: $draggingIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanManageStateImpl &&
            (identical(other.travel, travel) || other.travel == travel) &&
            const DeepCollectionEquality().equals(other._plans, _plans) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.mapHeightLevel, mapHeightLevel) ||
                other.mapHeightLevel == mapHeightLevel) &&
            (identical(other.isAnimating, isAnimating) ||
                other.isAnimating == isAnimating) &&
            (identical(other.draggingIndex, draggingIndex) ||
                other.draggingIndex == draggingIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      travel,
      const DeepCollectionEquality().hash(_plans),
      selectedDate,
      mapHeightLevel,
      isAnimating,
      draggingIndex);

  /// Create a copy of TravelPlanManageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanManageStateImplCopyWith<_$TravelPlanManageStateImpl>
      get copyWith => __$$TravelPlanManageStateImplCopyWithImpl<
          _$TravelPlanManageStateImpl>(this, _$identity);
}

abstract class _TravelPlanManageState implements TravelPlanManageState {
  const factory _TravelPlanManageState(
      {required final TravelModel travel,
      required final List<TravelPlanModel> plans,
      required final DateTime selectedDate,
      final int mapHeightLevel,
      final bool isAnimating,
      final int? draggingIndex}) = _$TravelPlanManageStateImpl;

  @override
  TravelModel get travel;
  @override
  List<TravelPlanModel> get plans;
  @override
  DateTime get selectedDate;
  @override
  int get mapHeightLevel;
  @override
  bool get isAnimating;
  @override
  int? get draggingIndex;

  /// Create a copy of TravelPlanManageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanManageStateImplCopyWith<_$TravelPlanManageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
