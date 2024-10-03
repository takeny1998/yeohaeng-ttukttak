// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_companion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelCompanion _$TravelCompanionFromJson(Map<String, dynamic> json) {
  return _TravelCompanion.fromJson(json);
}

/// @nodoc
mixin _$TravelCompanion {
  int get id => throw _privateConstructorUsedError;
  TravelCompanionType get type => throw _privateConstructorUsedError;
  AgeGroup get ageGroup => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;

  /// Serializes this TravelCompanion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelCompanionCopyWith<TravelCompanion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelCompanionCopyWith<$Res> {
  factory $TravelCompanionCopyWith(
          TravelCompanion value, $Res Function(TravelCompanion) then) =
      _$TravelCompanionCopyWithImpl<$Res, TravelCompanion>;
  @useResult
  $Res call(
      {int id, TravelCompanionType type, AgeGroup ageGroup, Gender gender});
}

/// @nodoc
class _$TravelCompanionCopyWithImpl<$Res, $Val extends TravelCompanion>
    implements $TravelCompanionCopyWith<$Res> {
  _$TravelCompanionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? ageGroup = null,
    Object? gender = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelCompanionType,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelCompanionImplCopyWith<$Res>
    implements $TravelCompanionCopyWith<$Res> {
  factory _$$TravelCompanionImplCopyWith(_$TravelCompanionImpl value,
          $Res Function(_$TravelCompanionImpl) then) =
      __$$TravelCompanionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, TravelCompanionType type, AgeGroup ageGroup, Gender gender});
}

/// @nodoc
class __$$TravelCompanionImplCopyWithImpl<$Res>
    extends _$TravelCompanionCopyWithImpl<$Res, _$TravelCompanionImpl>
    implements _$$TravelCompanionImplCopyWith<$Res> {
  __$$TravelCompanionImplCopyWithImpl(
      _$TravelCompanionImpl _value, $Res Function(_$TravelCompanionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? ageGroup = null,
    Object? gender = null,
  }) {
    return _then(_$TravelCompanionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TravelCompanionType,
      ageGroup: null == ageGroup
          ? _value.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as AgeGroup,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelCompanionImpl implements _TravelCompanion {
  const _$TravelCompanionImpl(
      {required this.id,
      required this.type,
      required this.ageGroup,
      required this.gender});

  factory _$TravelCompanionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelCompanionImplFromJson(json);

  @override
  final int id;
  @override
  final TravelCompanionType type;
  @override
  final AgeGroup ageGroup;
  @override
  final Gender gender;

  @override
  String toString() {
    return 'TravelCompanion(id: $id, type: $type, ageGroup: $ageGroup, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelCompanionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, ageGroup, gender);

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelCompanionImplCopyWith<_$TravelCompanionImpl> get copyWith =>
      __$$TravelCompanionImplCopyWithImpl<_$TravelCompanionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelCompanionImplToJson(
      this,
    );
  }
}

abstract class _TravelCompanion implements TravelCompanion {
  const factory _TravelCompanion(
      {required final int id,
      required final TravelCompanionType type,
      required final AgeGroup ageGroup,
      required final Gender gender}) = _$TravelCompanionImpl;

  factory _TravelCompanion.fromJson(Map<String, dynamic> json) =
      _$TravelCompanionImpl.fromJson;

  @override
  int get id;
  @override
  TravelCompanionType get type;
  @override
  AgeGroup get ageGroup;
  @override
  Gender get gender;

  /// Create a copy of TravelCompanion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelCompanionImplCopyWith<_$TravelCompanionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
