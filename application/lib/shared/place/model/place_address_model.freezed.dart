// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceAddressModel _$PlaceAddressModelFromJson(Map<String, dynamic> json) {
  return _PlaceAddressModel.fromJson(json);
}

/// @nodoc
mixin _$PlaceAddressModel {
  String get lotNumber => throw _privateConstructorUsedError;
  String get road => throw _privateConstructorUsedError;

  /// Serializes this PlaceAddressModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlaceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceAddressModelCopyWith<PlaceAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAddressModelCopyWith<$Res> {
  factory $PlaceAddressModelCopyWith(
          PlaceAddressModel value, $Res Function(PlaceAddressModel) then) =
      _$PlaceAddressModelCopyWithImpl<$Res, PlaceAddressModel>;
  @useResult
  $Res call({String lotNumber, String road});
}

/// @nodoc
class _$PlaceAddressModelCopyWithImpl<$Res, $Val extends PlaceAddressModel>
    implements $PlaceAddressModelCopyWith<$Res> {
  _$PlaceAddressModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotNumber = null,
    Object? road = null,
  }) {
    return _then(_value.copyWith(
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      road: null == road
          ? _value.road
          : road // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceAddressModelImplCopyWith<$Res>
    implements $PlaceAddressModelCopyWith<$Res> {
  factory _$$PlaceAddressModelImplCopyWith(_$PlaceAddressModelImpl value,
          $Res Function(_$PlaceAddressModelImpl) then) =
      __$$PlaceAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lotNumber, String road});
}

/// @nodoc
class __$$PlaceAddressModelImplCopyWithImpl<$Res>
    extends _$PlaceAddressModelCopyWithImpl<$Res, _$PlaceAddressModelImpl>
    implements _$$PlaceAddressModelImplCopyWith<$Res> {
  __$$PlaceAddressModelImplCopyWithImpl(_$PlaceAddressModelImpl _value,
      $Res Function(_$PlaceAddressModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lotNumber = null,
    Object? road = null,
  }) {
    return _then(_$PlaceAddressModelImpl(
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      road: null == road
          ? _value.road
          : road // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceAddressModelImpl implements _PlaceAddressModel {
  const _$PlaceAddressModelImpl({required this.lotNumber, required this.road});

  factory _$PlaceAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceAddressModelImplFromJson(json);

  @override
  final String lotNumber;
  @override
  final String road;

  @override
  String toString() {
    return 'PlaceAddressModel(lotNumber: $lotNumber, road: $road)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceAddressModelImpl &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.road, road) || other.road == road));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lotNumber, road);

  /// Create a copy of PlaceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceAddressModelImplCopyWith<_$PlaceAddressModelImpl> get copyWith =>
      __$$PlaceAddressModelImplCopyWithImpl<_$PlaceAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceAddressModelImplToJson(
      this,
    );
  }
}

abstract class _PlaceAddressModel implements PlaceAddressModel {
  const factory _PlaceAddressModel(
      {required final String lotNumber,
      required final String road}) = _$PlaceAddressModelImpl;

  factory _PlaceAddressModel.fromJson(Map<String, dynamic> json) =
      _$PlaceAddressModelImpl.fromJson;

  @override
  String get lotNumber;
  @override
  String get road;

  /// Create a copy of PlaceAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceAddressModelImplCopyWith<_$PlaceAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
