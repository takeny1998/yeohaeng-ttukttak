// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelVisitModel _$TravelVisitModelFromJson(Map<String, dynamic> json) {
  return _TravelVisitModel.fromJson(json);
}

/// @nodoc
mixin _$TravelVisitModel {
  int get id => throw _privateConstructorUsedError;
  int get seq => throw _privateConstructorUsedError;
  int get placeId => throw _privateConstructorUsedError;
  DateTime get visitedOn => throw _privateConstructorUsedError;
  TravelVisitReason get reason => throw _privateConstructorUsedError;

  /// Serializes this TravelVisitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelVisitModelCopyWith<TravelVisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelVisitModelCopyWith<$Res> {
  factory $TravelVisitModelCopyWith(
          TravelVisitModel value, $Res Function(TravelVisitModel) then) =
      _$TravelVisitModelCopyWithImpl<$Res, TravelVisitModel>;
  @useResult
  $Res call(
      {int id,
      int seq,
      int placeId,
      DateTime visitedOn,
      TravelVisitReason reason});
}

/// @nodoc
class _$TravelVisitModelCopyWithImpl<$Res, $Val extends TravelVisitModel>
    implements $TravelVisitModelCopyWith<$Res> {
  _$TravelVisitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seq = null,
    Object? placeId = null,
    Object? visitedOn = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      visitedOn: null == visitedOn
          ? _value.visitedOn
          : visitedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as TravelVisitReason,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelVisitModelImplCopyWith<$Res>
    implements $TravelVisitModelCopyWith<$Res> {
  factory _$$TravelVisitModelImplCopyWith(_$TravelVisitModelImpl value,
          $Res Function(_$TravelVisitModelImpl) then) =
      __$$TravelVisitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int seq,
      int placeId,
      DateTime visitedOn,
      TravelVisitReason reason});
}

/// @nodoc
class __$$TravelVisitModelImplCopyWithImpl<$Res>
    extends _$TravelVisitModelCopyWithImpl<$Res, _$TravelVisitModelImpl>
    implements _$$TravelVisitModelImplCopyWith<$Res> {
  __$$TravelVisitModelImplCopyWithImpl(_$TravelVisitModelImpl _value,
      $Res Function(_$TravelVisitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seq = null,
    Object? placeId = null,
    Object? visitedOn = null,
    Object? reason = null,
  }) {
    return _then(_$TravelVisitModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      visitedOn: null == visitedOn
          ? _value.visitedOn
          : visitedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as TravelVisitReason,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitModelImpl implements _TravelVisitModel {
  const _$TravelVisitModelImpl(
      {required this.id,
      required this.seq,
      required this.placeId,
      required this.visitedOn,
      required this.reason});

  factory _$TravelVisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitModelImplFromJson(json);

  @override
  final int id;
  @override
  final int seq;
  @override
  final int placeId;
  @override
  final DateTime visitedOn;
  @override
  final TravelVisitReason reason;

  @override
  String toString() {
    return 'TravelVisitModel(id: $id, seq: $seq, placeId: $placeId, visitedOn: $visitedOn, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelVisitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.visitedOn, visitedOn) ||
                other.visitedOn == visitedOn) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, seq, placeId, visitedOn, reason);

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelVisitModelImplCopyWith<_$TravelVisitModelImpl> get copyWith =>
      __$$TravelVisitModelImplCopyWithImpl<_$TravelVisitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelVisitModelImplToJson(
      this,
    );
  }
}

abstract class _TravelVisitModel implements TravelVisitModel {
  const factory _TravelVisitModel(
      {required final int id,
      required final int seq,
      required final int placeId,
      required final DateTime visitedOn,
      required final TravelVisitReason reason}) = _$TravelVisitModelImpl;

  factory _TravelVisitModel.fromJson(Map<String, dynamic> json) =
      _$TravelVisitModelImpl.fromJson;

  @override
  int get id;
  @override
  int get seq;
  @override
  int get placeId;
  @override
  DateTime get visitedOn;
  @override
  TravelVisitReason get reason;

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelVisitModelImplCopyWith<_$TravelVisitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
