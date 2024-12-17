// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelPlanModel _$TravelPlanModelFromJson(Map<String, dynamic> json) {
  return _TravelPlanModel.fromJson(json);
}

/// @nodoc
mixin _$TravelPlanModel {
  int get id => throw _privateConstructorUsedError;
  int get orderOfVisit => throw _privateConstructorUsedError;
  int get placeId => throw _privateConstructorUsedError;
  DateTime get willVisitOn => throw _privateConstructorUsedError;

  /// Serializes this TravelPlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanModelCopyWith<TravelPlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanModelCopyWith<$Res> {
  factory $TravelPlanModelCopyWith(
          TravelPlanModel value, $Res Function(TravelPlanModel) then) =
      _$TravelPlanModelCopyWithImpl<$Res, TravelPlanModel>;
  @useResult
  $Res call({int id, int orderOfVisit, int placeId, DateTime willVisitOn});
}

/// @nodoc
class _$TravelPlanModelCopyWithImpl<$Res, $Val extends TravelPlanModel>
    implements $TravelPlanModelCopyWith<$Res> {
  _$TravelPlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderOfVisit = null,
    Object? placeId = null,
    Object? willVisitOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderOfVisit: null == orderOfVisit
          ? _value.orderOfVisit
          : orderOfVisit // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      willVisitOn: null == willVisitOn
          ? _value.willVisitOn
          : willVisitOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelPlanModelImplCopyWith<$Res>
    implements $TravelPlanModelCopyWith<$Res> {
  factory _$$TravelPlanModelImplCopyWith(_$TravelPlanModelImpl value,
          $Res Function(_$TravelPlanModelImpl) then) =
      __$$TravelPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int orderOfVisit, int placeId, DateTime willVisitOn});
}

/// @nodoc
class __$$TravelPlanModelImplCopyWithImpl<$Res>
    extends _$TravelPlanModelCopyWithImpl<$Res, _$TravelPlanModelImpl>
    implements _$$TravelPlanModelImplCopyWith<$Res> {
  __$$TravelPlanModelImplCopyWithImpl(
      _$TravelPlanModelImpl _value, $Res Function(_$TravelPlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderOfVisit = null,
    Object? placeId = null,
    Object? willVisitOn = null,
  }) {
    return _then(_$TravelPlanModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderOfVisit: null == orderOfVisit
          ? _value.orderOfVisit
          : orderOfVisit // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      willVisitOn: null == willVisitOn
          ? _value.willVisitOn
          : willVisitOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelPlanModelImpl implements _TravelPlanModel {
  const _$TravelPlanModelImpl(
      {required this.id,
      required this.orderOfVisit,
      required this.placeId,
      required this.willVisitOn});

  factory _$TravelPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelPlanModelImplFromJson(json);

  @override
  final int id;
  @override
  final int orderOfVisit;
  @override
  final int placeId;
  @override
  final DateTime willVisitOn;

  @override
  String toString() {
    return 'TravelPlanModel(id: $id, orderOfVisit: $orderOfVisit, placeId: $placeId, willVisitOn: $willVisitOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderOfVisit, orderOfVisit) ||
                other.orderOfVisit == orderOfVisit) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.willVisitOn, willVisitOn) ||
                other.willVisitOn == willVisitOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, orderOfVisit, placeId, willVisitOn);

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanModelImplCopyWith<_$TravelPlanModelImpl> get copyWith =>
      __$$TravelPlanModelImplCopyWithImpl<_$TravelPlanModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelPlanModelImplToJson(
      this,
    );
  }
}

abstract class _TravelPlanModel implements TravelPlanModel {
  const factory _TravelPlanModel(
      {required final int id,
      required final int orderOfVisit,
      required final int placeId,
      required final DateTime willVisitOn}) = _$TravelPlanModelImpl;

  factory _TravelPlanModel.fromJson(Map<String, dynamic> json) =
      _$TravelPlanModelImpl.fromJson;

  @override
  int get id;
  @override
  int get orderOfVisit;
  @override
  int get placeId;
  @override
  DateTime get willVisitOn;

  /// Create a copy of TravelPlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanModelImplCopyWith<_$TravelPlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
