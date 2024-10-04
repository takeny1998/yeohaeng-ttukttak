// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelDetailState {
  int get selectedDay => throw _privateConstructorUsedError;
  TravelDetailModel get data => throw _privateConstructorUsedError;

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelDetailStateCopyWith<TravelDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelDetailStateCopyWith<$Res> {
  factory $TravelDetailStateCopyWith(
          TravelDetailState value, $Res Function(TravelDetailState) then) =
      _$TravelDetailStateCopyWithImpl<$Res, TravelDetailState>;
  @useResult
  $Res call({int selectedDay, TravelDetailModel data});

  $TravelDetailModelCopyWith<$Res> get data;
}

/// @nodoc
class _$TravelDetailStateCopyWithImpl<$Res, $Val extends TravelDetailState>
    implements $TravelDetailStateCopyWith<$Res> {
  _$TravelDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TravelDetailModel,
    ) as $Val);
  }

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelDetailModelCopyWith<$Res> get data {
    return $TravelDetailModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelDetailStateImplCopyWith<$Res>
    implements $TravelDetailStateCopyWith<$Res> {
  factory _$$TravelDetailStateImplCopyWith(_$TravelDetailStateImpl value,
          $Res Function(_$TravelDetailStateImpl) then) =
      __$$TravelDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedDay, TravelDetailModel data});

  @override
  $TravelDetailModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$TravelDetailStateImplCopyWithImpl<$Res>
    extends _$TravelDetailStateCopyWithImpl<$Res, _$TravelDetailStateImpl>
    implements _$$TravelDetailStateImplCopyWith<$Res> {
  __$$TravelDetailStateImplCopyWithImpl(_$TravelDetailStateImpl _value,
      $Res Function(_$TravelDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
    Object? data = null,
  }) {
    return _then(_$TravelDetailStateImpl(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TravelDetailModel,
    ));
  }
}

/// @nodoc

class _$TravelDetailStateImpl extends _TravelDetailState {
  const _$TravelDetailStateImpl({required this.selectedDay, required this.data})
      : super._();

  @override
  final int selectedDay;
  @override
  final TravelDetailModel data;

  @override
  String toString() {
    return 'TravelDetailState(selectedDay: $selectedDay, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelDetailStateImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDay, data);

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelDetailStateImplCopyWith<_$TravelDetailStateImpl> get copyWith =>
      __$$TravelDetailStateImplCopyWithImpl<_$TravelDetailStateImpl>(
          this, _$identity);
}

abstract class _TravelDetailState extends TravelDetailState {
  const factory _TravelDetailState(
      {required final int selectedDay,
      required final TravelDetailModel data}) = _$TravelDetailStateImpl;
  const _TravelDetailState._() : super._();

  @override
  int get selectedDay;
  @override
  TravelDetailModel get data;

  /// Create a copy of TravelDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelDetailStateImplCopyWith<_$TravelDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
