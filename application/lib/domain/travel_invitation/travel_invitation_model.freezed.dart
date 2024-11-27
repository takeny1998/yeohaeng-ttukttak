// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_invitation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelInvitationModel _$TravelInvitationModelFromJson(
    Map<String, dynamic> json) {
  return _TravelInvitationModel.fromJson(json);
}

/// @nodoc
mixin _$TravelInvitationModel {
  String get id => throw _privateConstructorUsedError;
  int get travelId => throw _privateConstructorUsedError;

  /// Serializes this TravelInvitationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelInvitationModelCopyWith<TravelInvitationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelInvitationModelCopyWith<$Res> {
  factory $TravelInvitationModelCopyWith(TravelInvitationModel value,
          $Res Function(TravelInvitationModel) then) =
      _$TravelInvitationModelCopyWithImpl<$Res, TravelInvitationModel>;
  @useResult
  $Res call({String id, int travelId});
}

/// @nodoc
class _$TravelInvitationModelCopyWithImpl<$Res,
        $Val extends TravelInvitationModel>
    implements $TravelInvitationModelCopyWith<$Res> {
  _$TravelInvitationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? travelId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      travelId: null == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelInvitationModelImplCopyWith<$Res>
    implements $TravelInvitationModelCopyWith<$Res> {
  factory _$$TravelInvitationModelImplCopyWith(
          _$TravelInvitationModelImpl value,
          $Res Function(_$TravelInvitationModelImpl) then) =
      __$$TravelInvitationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int travelId});
}

/// @nodoc
class __$$TravelInvitationModelImplCopyWithImpl<$Res>
    extends _$TravelInvitationModelCopyWithImpl<$Res,
        _$TravelInvitationModelImpl>
    implements _$$TravelInvitationModelImplCopyWith<$Res> {
  __$$TravelInvitationModelImplCopyWithImpl(_$TravelInvitationModelImpl _value,
      $Res Function(_$TravelInvitationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? travelId = null,
  }) {
    return _then(_$TravelInvitationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      travelId: null == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelInvitationModelImpl implements _TravelInvitationModel {
  const _$TravelInvitationModelImpl({required this.id, required this.travelId});

  factory _$TravelInvitationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelInvitationModelImplFromJson(json);

  @override
  final String id;
  @override
  final int travelId;

  @override
  String toString() {
    return 'TravelInvitationModel(id: $id, travelId: $travelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelInvitationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.travelId, travelId) ||
                other.travelId == travelId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, travelId);

  /// Create a copy of TravelInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelInvitationModelImplCopyWith<_$TravelInvitationModelImpl>
      get copyWith => __$$TravelInvitationModelImplCopyWithImpl<
          _$TravelInvitationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelInvitationModelImplToJson(
      this,
    );
  }
}

abstract class _TravelInvitationModel implements TravelInvitationModel {
  const factory _TravelInvitationModel(
      {required final String id,
      required final int travelId}) = _$TravelInvitationModelImpl;

  factory _TravelInvitationModel.fromJson(Map<String, dynamic> json) =
      _$TravelInvitationModelImpl.fromJson;

  @override
  String get id;
  @override
  int get travelId;

  /// Create a copy of TravelInvitationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelInvitationModelImplCopyWith<_$TravelInvitationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
