// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_participant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelPlanParticipantState {
  TravelModel get travel => throw _privateConstructorUsedError;
  List<TravelParticipantModel> get participants =>
      throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanParticipantStateCopyWith<TravelPlanParticipantState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanParticipantStateCopyWith<$Res> {
  factory $TravelPlanParticipantStateCopyWith(TravelPlanParticipantState value,
          $Res Function(TravelPlanParticipantState) then) =
      _$TravelPlanParticipantStateCopyWithImpl<$Res,
          TravelPlanParticipantState>;
  @useResult
  $Res call({TravelModel travel, List<TravelParticipantModel> participants});

  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class _$TravelPlanParticipantStateCopyWithImpl<$Res,
        $Val extends TravelPlanParticipantState>
    implements $TravelPlanParticipantStateCopyWith<$Res> {
  _$TravelPlanParticipantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? participants = null,
  }) {
    return _then(_value.copyWith(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      participants: null == participants
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<TravelParticipantModel>,
    ) as $Val);
  }

  /// Create a copy of TravelPlanParticipantState
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
abstract class _$$TravelPlanParticipantStateImplCopyWith<$Res>
    implements $TravelPlanParticipantStateCopyWith<$Res> {
  factory _$$TravelPlanParticipantStateImplCopyWith(
          _$TravelPlanParticipantStateImpl value,
          $Res Function(_$TravelPlanParticipantStateImpl) then) =
      __$$TravelPlanParticipantStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TravelModel travel, List<TravelParticipantModel> participants});

  @override
  $TravelModelCopyWith<$Res> get travel;
}

/// @nodoc
class __$$TravelPlanParticipantStateImplCopyWithImpl<$Res>
    extends _$TravelPlanParticipantStateCopyWithImpl<$Res,
        _$TravelPlanParticipantStateImpl>
    implements _$$TravelPlanParticipantStateImplCopyWith<$Res> {
  __$$TravelPlanParticipantStateImplCopyWithImpl(
      _$TravelPlanParticipantStateImpl _value,
      $Res Function(_$TravelPlanParticipantStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = null,
    Object? participants = null,
  }) {
    return _then(_$TravelPlanParticipantStateImpl(
      travel: null == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as TravelModel,
      participants: null == participants
          ? _value._participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<TravelParticipantModel>,
    ));
  }
}

/// @nodoc

class _$TravelPlanParticipantStateImpl implements _TravelPlanParticipantState {
  const _$TravelPlanParticipantStateImpl(
      {required this.travel,
      required final List<TravelParticipantModel> participants})
      : _participants = participants;

  @override
  final TravelModel travel;
  final List<TravelParticipantModel> _participants;
  @override
  List<TravelParticipantModel> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  String toString() {
    return 'TravelPlanParticipantState(travel: $travel, participants: $participants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanParticipantStateImpl &&
            (identical(other.travel, travel) || other.travel == travel) &&
            const DeepCollectionEquality()
                .equals(other._participants, _participants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, travel, const DeepCollectionEquality().hash(_participants));

  /// Create a copy of TravelPlanParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanParticipantStateImplCopyWith<_$TravelPlanParticipantStateImpl>
      get copyWith => __$$TravelPlanParticipantStateImplCopyWithImpl<
          _$TravelPlanParticipantStateImpl>(this, _$identity);
}

abstract class _TravelPlanParticipantState
    implements TravelPlanParticipantState {
  const factory _TravelPlanParticipantState(
          {required final TravelModel travel,
          required final List<TravelParticipantModel> participants}) =
      _$TravelPlanParticipantStateImpl;

  @override
  TravelModel get travel;
  @override
  List<TravelParticipantModel> get participants;

  /// Create a copy of TravelPlanParticipantState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanParticipantStateImplCopyWith<_$TravelPlanParticipantStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
