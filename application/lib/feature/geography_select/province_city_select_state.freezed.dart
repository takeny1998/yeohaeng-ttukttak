// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_city_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProvinceCitySelectState {
  ProvinceModel? get activeProvince => throw _privateConstructorUsedError;
  CityModel? get activeCity => throw _privateConstructorUsedError;
  ReferenceIterable<CityModel, ProvinceModel> get selectedCities =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProvinceCitySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProvinceCitySelectStateCopyWith<ProvinceCitySelectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceCitySelectStateCopyWith<$Res> {
  factory $ProvinceCitySelectStateCopyWith(ProvinceCitySelectState value,
          $Res Function(ProvinceCitySelectState) then) =
      _$ProvinceCitySelectStateCopyWithImpl<$Res, ProvinceCitySelectState>;
  @useResult
  $Res call(
      {ProvinceModel? activeProvince,
      CityModel? activeCity,
      ReferenceIterable<CityModel, ProvinceModel> selectedCities});
}

/// @nodoc
class _$ProvinceCitySelectStateCopyWithImpl<$Res,
        $Val extends ProvinceCitySelectState>
    implements $ProvinceCitySelectStateCopyWith<$Res> {
  _$ProvinceCitySelectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProvinceCitySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeProvince = freezed,
    Object? activeCity = freezed,
    Object? selectedCities = null,
  }) {
    return _then(_value.copyWith(
      activeProvince: freezed == activeProvince
          ? _value.activeProvince
          : activeProvince // ignore: cast_nullable_to_non_nullable
              as ProvinceModel?,
      activeCity: freezed == activeCity
          ? _value.activeCity
          : activeCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      selectedCities: null == selectedCities
          ? _value.selectedCities
          : selectedCities // ignore: cast_nullable_to_non_nullable
              as ReferenceIterable<CityModel, ProvinceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceCitySelectStateImplCopyWith<$Res>
    implements $ProvinceCitySelectStateCopyWith<$Res> {
  factory _$$ProvinceCitySelectStateImplCopyWith(
          _$ProvinceCitySelectStateImpl value,
          $Res Function(_$ProvinceCitySelectStateImpl) then) =
      __$$ProvinceCitySelectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProvinceModel? activeProvince,
      CityModel? activeCity,
      ReferenceIterable<CityModel, ProvinceModel> selectedCities});
}

/// @nodoc
class __$$ProvinceCitySelectStateImplCopyWithImpl<$Res>
    extends _$ProvinceCitySelectStateCopyWithImpl<$Res,
        _$ProvinceCitySelectStateImpl>
    implements _$$ProvinceCitySelectStateImplCopyWith<$Res> {
  __$$ProvinceCitySelectStateImplCopyWithImpl(
      _$ProvinceCitySelectStateImpl _value,
      $Res Function(_$ProvinceCitySelectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProvinceCitySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeProvince = freezed,
    Object? activeCity = freezed,
    Object? selectedCities = null,
  }) {
    return _then(_$ProvinceCitySelectStateImpl(
      activeProvince: freezed == activeProvince
          ? _value.activeProvince
          : activeProvince // ignore: cast_nullable_to_non_nullable
              as ProvinceModel?,
      activeCity: freezed == activeCity
          ? _value.activeCity
          : activeCity // ignore: cast_nullable_to_non_nullable
              as CityModel?,
      selectedCities: null == selectedCities
          ? _value.selectedCities
          : selectedCities // ignore: cast_nullable_to_non_nullable
              as ReferenceIterable<CityModel, ProvinceModel>,
    ));
  }
}

/// @nodoc

class _$ProvinceCitySelectStateImpl implements _ProvinceCitySelectState {
  const _$ProvinceCitySelectStateImpl(
      {this.activeProvince,
      this.activeCity,
      this.selectedCities = const ReferenceIterable()});

  @override
  final ProvinceModel? activeProvince;
  @override
  final CityModel? activeCity;
  @override
  @JsonKey()
  final ReferenceIterable<CityModel, ProvinceModel> selectedCities;

  @override
  String toString() {
    return 'ProvinceCitySelectState(activeProvince: $activeProvince, activeCity: $activeCity, selectedCities: $selectedCities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceCitySelectStateImpl &&
            const DeepCollectionEquality()
                .equals(other.activeProvince, activeProvince) &&
            const DeepCollectionEquality()
                .equals(other.activeCity, activeCity) &&
            (identical(other.selectedCities, selectedCities) ||
                other.selectedCities == selectedCities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(activeProvince),
      const DeepCollectionEquality().hash(activeCity),
      selectedCities);

  /// Create a copy of ProvinceCitySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceCitySelectStateImplCopyWith<_$ProvinceCitySelectStateImpl>
      get copyWith => __$$ProvinceCitySelectStateImplCopyWithImpl<
          _$ProvinceCitySelectStateImpl>(this, _$identity);
}

abstract class _ProvinceCitySelectState implements ProvinceCitySelectState {
  const factory _ProvinceCitySelectState(
          {final ProvinceModel? activeProvince,
          final CityModel? activeCity,
          final ReferenceIterable<CityModel, ProvinceModel> selectedCities}) =
      _$ProvinceCitySelectStateImpl;

  @override
  ProvinceModel? get activeProvince;
  @override
  CityModel? get activeCity;
  @override
  ReferenceIterable<CityModel, ProvinceModel> get selectedCities;

  /// Create a copy of ProvinceCitySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceCitySelectStateImplCopyWith<_$ProvinceCitySelectStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
