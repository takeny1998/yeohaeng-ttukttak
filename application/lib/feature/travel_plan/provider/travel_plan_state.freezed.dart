// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelPlanState {
  TravelDetailModel get detail => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanStateCopyWith<TravelPlanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanStateCopyWith<$Res> {
  factory $TravelPlanStateCopyWith(
          TravelPlanState value, $Res Function(TravelPlanState) then) =
      _$TravelPlanStateCopyWithImpl<$Res, TravelPlanState>;
  @useResult
  $Res call({TravelDetailModel detail});

  $TravelDetailModelCopyWith<$Res> get detail;
}

/// @nodoc
class _$TravelPlanStateCopyWithImpl<$Res, $Val extends TravelPlanState>
    implements $TravelPlanStateCopyWith<$Res> {
  _$TravelPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_value.copyWith(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as TravelDetailModel,
    ) as $Val);
  }

  /// Create a copy of TravelPlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelDetailModelCopyWith<$Res> get detail {
    return $TravelDetailModelCopyWith<$Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelPlanStateImplCopyWith<$Res>
    implements $TravelPlanStateCopyWith<$Res> {
  factory _$$TravelPlanStateImplCopyWith(_$TravelPlanStateImpl value,
          $Res Function(_$TravelPlanStateImpl) then) =
      __$$TravelPlanStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TravelDetailModel detail});

  @override
  $TravelDetailModelCopyWith<$Res> get detail;
}

/// @nodoc
class __$$TravelPlanStateImplCopyWithImpl<$Res>
    extends _$TravelPlanStateCopyWithImpl<$Res, _$TravelPlanStateImpl>
    implements _$$TravelPlanStateImplCopyWith<$Res> {
  __$$TravelPlanStateImplCopyWithImpl(
      _$TravelPlanStateImpl _value, $Res Function(_$TravelPlanStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_$TravelPlanStateImpl(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as TravelDetailModel,
    ));
  }
}

/// @nodoc

class _$TravelPlanStateImpl extends _TravelPlanState {
  const _$TravelPlanStateImpl({required this.detail}) : super._();

  @override
  final TravelDetailModel detail;

  @override
  String toString() {
    return 'TravelPlanState(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanStateImpl &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail);

  /// Create a copy of TravelPlanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanStateImplCopyWith<_$TravelPlanStateImpl> get copyWith =>
      __$$TravelPlanStateImplCopyWithImpl<_$TravelPlanStateImpl>(
          this, _$identity);
}

abstract class _TravelPlanState extends TravelPlanState {
  const factory _TravelPlanState({required final TravelDetailModel detail}) =
      _$TravelPlanStateImpl;
  const _TravelPlanState._() : super._();

  @override
  TravelDetailModel get detail;

  /// Create a copy of TravelPlanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanStateImplCopyWith<_$TravelPlanStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
