// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_place_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CityPlaceMapState {
  List<Marker> get markers => throw _privateConstructorUsedError;
  int get selectedId => throw _privateConstructorUsedError;

  /// Create a copy of CityPlaceMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityPlaceMapStateCopyWith<CityPlaceMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityPlaceMapStateCopyWith<$Res> {
  factory $CityPlaceMapStateCopyWith(
          CityPlaceMapState value, $Res Function(CityPlaceMapState) then) =
      _$CityPlaceMapStateCopyWithImpl<$Res, CityPlaceMapState>;
  @useResult
  $Res call({List<Marker> markers, int selectedId});
}

/// @nodoc
class _$CityPlaceMapStateCopyWithImpl<$Res, $Val extends CityPlaceMapState>
    implements $CityPlaceMapStateCopyWith<$Res> {
  _$CityPlaceMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityPlaceMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? selectedId = null,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      selectedId: null == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityPlaceMapStateImplCopyWith<$Res>
    implements $CityPlaceMapStateCopyWith<$Res> {
  factory _$$CityPlaceMapStateImplCopyWith(_$CityPlaceMapStateImpl value,
          $Res Function(_$CityPlaceMapStateImpl) then) =
      __$$CityPlaceMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Marker> markers, int selectedId});
}

/// @nodoc
class __$$CityPlaceMapStateImplCopyWithImpl<$Res>
    extends _$CityPlaceMapStateCopyWithImpl<$Res, _$CityPlaceMapStateImpl>
    implements _$$CityPlaceMapStateImplCopyWith<$Res> {
  __$$CityPlaceMapStateImplCopyWithImpl(_$CityPlaceMapStateImpl _value,
      $Res Function(_$CityPlaceMapStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityPlaceMapState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? selectedId = null,
  }) {
    return _then(_$CityPlaceMapStateImpl(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<Marker>,
      selectedId: null == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CityPlaceMapStateImpl implements _CityPlaceMapState {
  const _$CityPlaceMapStateImpl(
      {required final List<Marker> markers, required this.selectedId})
      : _markers = markers;

  final List<Marker> _markers;
  @override
  List<Marker> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  final int selectedId;

  @override
  String toString() {
    return 'CityPlaceMapState(markers: $markers, selectedId: $selectedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityPlaceMapStateImpl &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_markers), selectedId);

  /// Create a copy of CityPlaceMapState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityPlaceMapStateImplCopyWith<_$CityPlaceMapStateImpl> get copyWith =>
      __$$CityPlaceMapStateImplCopyWithImpl<_$CityPlaceMapStateImpl>(
          this, _$identity);
}

abstract class _CityPlaceMapState implements CityPlaceMapState {
  const factory _CityPlaceMapState(
      {required final List<Marker> markers,
      required final int selectedId}) = _$CityPlaceMapStateImpl;

  @override
  List<Marker> get markers;
  @override
  int get selectedId;

  /// Create a copy of CityPlaceMapState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityPlaceMapStateImplCopyWith<_$CityPlaceMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
