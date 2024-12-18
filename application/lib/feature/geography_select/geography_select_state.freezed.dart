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
  int? get selectedId => throw _privateConstructorUsedError;

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
  $Res call({int? selectedId});
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
    Object? selectedId = freezed,
  }) {
    return _then(_value.copyWith(
      selectedId: freezed == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProvinceSelectStateImplCopyWith<$Res>
    implements $GeographySelectStateCopyWith<$Res> {
  factory _$$ProvinceSelectStateImplCopyWith(_$ProvinceSelectStateImpl value,
          $Res Function(_$ProvinceSelectStateImpl) then) =
      __$$ProvinceSelectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? selectedId});
}

/// @nodoc
class __$$ProvinceSelectStateImplCopyWithImpl<$Res>
    extends _$GeographySelectStateCopyWithImpl<$Res, _$ProvinceSelectStateImpl>
    implements _$$ProvinceSelectStateImplCopyWith<$Res> {
  __$$ProvinceSelectStateImplCopyWithImpl(_$ProvinceSelectStateImpl _value,
      $Res Function(_$ProvinceSelectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedId = freezed,
  }) {
    return _then(_$ProvinceSelectStateImpl(
      selectedId: freezed == selectedId
          ? _value.selectedId
          : selectedId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ProvinceSelectStateImpl implements _ProvinceSelectState {
  const _$ProvinceSelectStateImpl({this.selectedId});

  @override
  final int? selectedId;

  @override
  String toString() {
    return 'GeographySelectState(selectedId: $selectedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProvinceSelectStateImpl &&
            (identical(other.selectedId, selectedId) ||
                other.selectedId == selectedId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedId);

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProvinceSelectStateImplCopyWith<_$ProvinceSelectStateImpl> get copyWith =>
      __$$ProvinceSelectStateImplCopyWithImpl<_$ProvinceSelectStateImpl>(
          this, _$identity);
}

abstract class _ProvinceSelectState implements GeographySelectState {
  const factory _ProvinceSelectState({final int? selectedId}) =
      _$ProvinceSelectStateImpl;

  @override
  int? get selectedId;

  /// Create a copy of GeographySelectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProvinceSelectStateImplCopyWith<_$ProvinceSelectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
