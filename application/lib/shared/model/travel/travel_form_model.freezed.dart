// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_form_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelFormModel {
  DateTime? get startedOn => throw _privateConstructorUsedError;
  DateTime? get endedOn => throw _privateConstructorUsedError;
  Iterable<TravelMotivationType> get motivationTypes =>
      throw _privateConstructorUsedError;
  Iterable<TravelCompanionType> get companionTypes =>
      throw _privateConstructorUsedError;
  Iterable<CityModel> get cities => throw _privateConstructorUsedError;

  /// Create a copy of TravelFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelFormModelCopyWith<TravelFormModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelFormModelCopyWith<$Res> {
  factory $TravelFormModelCopyWith(
          TravelFormModel value, $Res Function(TravelFormModel) then) =
      _$TravelFormModelCopyWithImpl<$Res, TravelFormModel>;
  @useResult
  $Res call(
      {DateTime? startedOn,
      DateTime? endedOn,
      Iterable<TravelMotivationType> motivationTypes,
      Iterable<TravelCompanionType> companionTypes,
      Iterable<CityModel> cities});
}

/// @nodoc
class _$TravelFormModelCopyWithImpl<$Res, $Val extends TravelFormModel>
    implements $TravelFormModelCopyWith<$Res> {
  _$TravelFormModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedOn = freezed,
    Object? endedOn = freezed,
    Object? motivationTypes = null,
    Object? companionTypes = null,
    Object? cities = null,
  }) {
    return _then(_value.copyWith(
      startedOn: freezed == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedOn: freezed == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      motivationTypes: null == motivationTypes
          ? _value.motivationTypes
          : motivationTypes // ignore: cast_nullable_to_non_nullable
              as Iterable<TravelMotivationType>,
      companionTypes: null == companionTypes
          ? _value.companionTypes
          : companionTypes // ignore: cast_nullable_to_non_nullable
              as Iterable<TravelCompanionType>,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as Iterable<CityModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelFormModelImplCopyWith<$Res>
    implements $TravelFormModelCopyWith<$Res> {
  factory _$$TravelFormModelImplCopyWith(_$TravelFormModelImpl value,
          $Res Function(_$TravelFormModelImpl) then) =
      __$$TravelFormModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startedOn,
      DateTime? endedOn,
      Iterable<TravelMotivationType> motivationTypes,
      Iterable<TravelCompanionType> companionTypes,
      Iterable<CityModel> cities});
}

/// @nodoc
class __$$TravelFormModelImplCopyWithImpl<$Res>
    extends _$TravelFormModelCopyWithImpl<$Res, _$TravelFormModelImpl>
    implements _$$TravelFormModelImplCopyWith<$Res> {
  __$$TravelFormModelImplCopyWithImpl(
      _$TravelFormModelImpl _value, $Res Function(_$TravelFormModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelFormModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startedOn = freezed,
    Object? endedOn = freezed,
    Object? motivationTypes = null,
    Object? companionTypes = null,
    Object? cities = null,
  }) {
    return _then(_$TravelFormModelImpl(
      startedOn: freezed == startedOn
          ? _value.startedOn
          : startedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endedOn: freezed == endedOn
          ? _value.endedOn
          : endedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      motivationTypes: null == motivationTypes
          ? _value.motivationTypes
          : motivationTypes // ignore: cast_nullable_to_non_nullable
              as Iterable<TravelMotivationType>,
      companionTypes: null == companionTypes
          ? _value.companionTypes
          : companionTypes // ignore: cast_nullable_to_non_nullable
              as Iterable<TravelCompanionType>,
      cities: null == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as Iterable<CityModel>,
    ));
  }
}

/// @nodoc

class _$TravelFormModelImpl extends _TravelFormModel {
  const _$TravelFormModelImpl(
      {required this.startedOn,
      required this.endedOn,
      required this.motivationTypes,
      required this.companionTypes,
      required this.cities})
      : super._();

  @override
  final DateTime? startedOn;
  @override
  final DateTime? endedOn;
  @override
  final Iterable<TravelMotivationType> motivationTypes;
  @override
  final Iterable<TravelCompanionType> companionTypes;
  @override
  final Iterable<CityModel> cities;

  @override
  String toString() {
    return 'TravelFormModel(startedOn: $startedOn, endedOn: $endedOn, motivationTypes: $motivationTypes, companionTypes: $companionTypes, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelFormModelImpl &&
            (identical(other.startedOn, startedOn) ||
                other.startedOn == startedOn) &&
            (identical(other.endedOn, endedOn) || other.endedOn == endedOn) &&
            const DeepCollectionEquality()
                .equals(other.motivationTypes, motivationTypes) &&
            const DeepCollectionEquality()
                .equals(other.companionTypes, companionTypes) &&
            const DeepCollectionEquality().equals(other.cities, cities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      startedOn,
      endedOn,
      const DeepCollectionEquality().hash(motivationTypes),
      const DeepCollectionEquality().hash(companionTypes),
      const DeepCollectionEquality().hash(cities));

  /// Create a copy of TravelFormModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelFormModelImplCopyWith<_$TravelFormModelImpl> get copyWith =>
      __$$TravelFormModelImplCopyWithImpl<_$TravelFormModelImpl>(
          this, _$identity);
}

abstract class _TravelFormModel extends TravelFormModel {
  const factory _TravelFormModel(
      {required final DateTime? startedOn,
      required final DateTime? endedOn,
      required final Iterable<TravelMotivationType> motivationTypes,
      required final Iterable<TravelCompanionType> companionTypes,
      required final Iterable<CityModel> cities}) = _$TravelFormModelImpl;
  const _TravelFormModel._() : super._();

  @override
  DateTime? get startedOn;
  @override
  DateTime? get endedOn;
  @override
  Iterable<TravelMotivationType> get motivationTypes;
  @override
  Iterable<TravelCompanionType> get companionTypes;
  @override
  Iterable<CityModel> get cities;

  /// Create a copy of TravelFormModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelFormModelImplCopyWith<_$TravelFormModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
