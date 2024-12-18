// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geography_select_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeographySelectState {
  int? get selectedStateId => throw _privateConstructorUsedError;
  int? get selectedCityId => throw _privateConstructorUsedError;
  List<GeoJsonModel> get geoJsons => throw _privateConstructorUsedError;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeographySelectStateCopyWith<GeographySelectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeographySelectStateCopyWith<$Res> {
  factory $GeographySelectStateCopyWith(GeographySelectState value,
          $Res Function(GeographySelectState) then) =
      _$GeographySelectStateCopyWithImpl<$Res, GeographySelectState>;
  @useResult
  $Res call(
      {int? selectedStateId, int? selectedCityId, List<GeoJsonModel> geoJsons});
}

/// @nodoc
class _$GeographySelectStateCopyWithImpl<$Res,
        $Val extends GeographySelectState>
    implements $GeographySelectStateCopyWith<$Res> {
  _$GeographySelectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedStateId = freezed,
    Object? selectedCityId = freezed,
    Object? geoJsons = null,
  }) {
    return _then(_value.copyWith(
      selectedStateId: freezed == selectedStateId
          ? _value.selectedStateId
          : selectedStateId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedCityId: freezed == selectedCityId
          ? _value.selectedCityId
          : selectedCityId // ignore: cast_nullable_to_non_nullable
              as int?,
      geoJsons: null == geoJsons
          ? _value.geoJsons
          : geoJsons // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeographySelectStateImplCopyWith<$Res>
    implements $GeographySelectStateCopyWith<$Res> {
  factory _$$GeographySelectStateImplCopyWith(_$GeographySelectStateImpl value,
          $Res Function(_$GeographySelectStateImpl) then) =
      __$$GeographySelectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? selectedStateId, int? selectedCityId, List<GeoJsonModel> geoJsons});
}

/// @nodoc
class __$$GeographySelectStateImplCopyWithImpl<$Res>
    extends _$GeographySelectStateCopyWithImpl<$Res, _$GeographySelectStateImpl>
    implements _$$GeographySelectStateImplCopyWith<$Res> {
  __$$GeographySelectStateImplCopyWithImpl(_$GeographySelectStateImpl _value,
      $Res Function(_$GeographySelectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedStateId = freezed,
    Object? selectedCityId = freezed,
    Object? geoJsons = null,
  }) {
    return _then(_$GeographySelectStateImpl(
      selectedStateId: freezed == selectedStateId
          ? _value.selectedStateId
          : selectedStateId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectedCityId: freezed == selectedCityId
          ? _value.selectedCityId
          : selectedCityId // ignore: cast_nullable_to_non_nullable
              as int?,
      geoJsons: null == geoJsons
          ? _value._geoJsons
          : geoJsons // ignore: cast_nullable_to_non_nullable
              as List<GeoJsonModel>,
    ));
  }
}

/// @nodoc

class _$GeographySelectStateImpl implements _GeographySelectState {
  const _$GeographySelectStateImpl(
      {this.selectedStateId,
      this.selectedCityId,
      required final List<GeoJsonModel> geoJsons})
      : _geoJsons = geoJsons;

  @override
  final int? selectedStateId;
  @override
  final int? selectedCityId;
  final List<GeoJsonModel> _geoJsons;
  @override
  List<GeoJsonModel> get geoJsons {
    if (_geoJsons is EqualUnmodifiableListView) return _geoJsons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_geoJsons);
  }

  @override
  String toString() {
    return 'GeographySelectState(selectedStateId: $selectedStateId, selectedCityId: $selectedCityId, geoJsons: $geoJsons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeographySelectStateImpl &&
            (identical(other.selectedStateId, selectedStateId) ||
                other.selectedStateId == selectedStateId) &&
            (identical(other.selectedCityId, selectedCityId) ||
                other.selectedCityId == selectedCityId) &&
            const DeepCollectionEquality().equals(other._geoJsons, _geoJsons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedStateId, selectedCityId,
      const DeepCollectionEquality().hash(_geoJsons));

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeographySelectStateImplCopyWith<_$GeographySelectStateImpl>
      get copyWith =>
          __$$GeographySelectStateImplCopyWithImpl<_$GeographySelectStateImpl>(
              this, _$identity);
}

abstract class _GeographySelectState implements GeographySelectState {
  const factory _GeographySelectState(
      {final int? selectedStateId,
      final int? selectedCityId,
      required final List<GeoJsonModel> geoJsons}) = _$GeographySelectStateImpl;

  @override
  int? get selectedStateId;
  @override
  int? get selectedCityId;
  @override
  List<GeoJsonModel> get geoJsons;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeographySelectStateImplCopyWith<_$GeographySelectStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
