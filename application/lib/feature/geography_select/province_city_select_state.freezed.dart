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
  int? get selectedProvinceId => throw _privateConstructorUsedError;
  List<CityModel> get selectedCities => throw _privateConstructorUsedError;

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
  $Res call({int? selectedProvinceId, List<CityModel> selectedCities});
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
    Object? selectedProvinceId = freezed,
    Object? selectedCities = null,
  }) {
    return _then(_value.copyWith(
      selectedProvinceId: freezed == selectedProvinceId
          ? _value.selectedProvinceId
          : selectedProvinceId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedCities: null == selectedCities
          ? _value.selectedCities
          : selectedCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
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
  $Res call({int? selectedProvinceId, List<CityModel> selectedCities});
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
    Object? selectedProvinceId = freezed,
    Object? selectedCities = null,
  }) {
    return _then(_$ProvinceCitySelectStateImpl(
      selectedProvinceId: freezed == selectedProvinceId
          ? _value.selectedProvinceId
          : selectedProvinceId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedCities: null == selectedCities
          ? _value._selectedCities
          : selectedCities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>,
    ));
  }
}

/// @nodoc

class _$ProvinceCitySelectStateImpl implements _ProvinceCitySelectState {
  const _$ProvinceCitySelectStateImpl(
      {this.selectedProvinceId,
      final List<CityModel> selectedCities = const []})
      : _selectedCities = selectedCities;

  @override
  final int? selectedProvinceId;
  final List<CityModel> _selectedCities;
  @override
  @JsonKey()
  List<CityModel> get selectedCities {
    if (_selectedCities is EqualUnmodifiableListView) return _selectedCities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCities);
  }

  @override
  String toString() {
    return 'ProvinceCitySelectState(selectedProvinceId: $selectedProvinceId, selectedCities: $selectedCities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceCitySelectStateImpl &&
            (identical(other.selectedProvinceId, selectedProvinceId) ||
                other.selectedProvinceId == selectedProvinceId) &&
            const DeepCollectionEquality()
                .equals(other._selectedCities, _selectedCities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedProvinceId,
      const DeepCollectionEquality().hash(_selectedCities));

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
      {final int? selectedProvinceId,
      final List<CityModel> selectedCities}) = _$ProvinceCitySelectStateImpl;

  @override
  int? get selectedProvinceId;
  @override
  List<CityModel> get selectedCities;

  /// Create a copy of ProvinceCitySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceCitySelectStateImplCopyWith<_$ProvinceCitySelectStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
