// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_travels_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CityTravelsState {
  List<TravelModel> get travels => throw _privateConstructorUsedError;
  dynamic get hasNextPage => throw _privateConstructorUsedError;

  /// Create a copy of CityTravelsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CityTravelsStateCopyWith<CityTravelsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityTravelsStateCopyWith<$Res> {
  factory $CityTravelsStateCopyWith(
          CityTravelsState value, $Res Function(CityTravelsState) then) =
      _$CityTravelsStateCopyWithImpl<$Res, CityTravelsState>;
  @useResult
  $Res call({List<TravelModel> travels, dynamic hasNextPage});
}

/// @nodoc
class _$CityTravelsStateCopyWithImpl<$Res, $Val extends CityTravelsState>
    implements $CityTravelsStateCopyWith<$Res> {
  _$CityTravelsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CityTravelsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travels = null,
    Object? hasNextPage = freezed,
  }) {
    return _then(_value.copyWith(
      travels: null == travels
          ? _value.travels
          : travels // ignore: cast_nullable_to_non_nullable
              as List<TravelModel>,
      hasNextPage: freezed == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityTravelsStateImplCopyWith<$Res>
    implements $CityTravelsStateCopyWith<$Res> {
  factory _$$CityTravelsStateImplCopyWith(_$CityTravelsStateImpl value,
          $Res Function(_$CityTravelsStateImpl) then) =
      __$$CityTravelsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TravelModel> travels, dynamic hasNextPage});
}

/// @nodoc
class __$$CityTravelsStateImplCopyWithImpl<$Res>
    extends _$CityTravelsStateCopyWithImpl<$Res, _$CityTravelsStateImpl>
    implements _$$CityTravelsStateImplCopyWith<$Res> {
  __$$CityTravelsStateImplCopyWithImpl(_$CityTravelsStateImpl _value,
      $Res Function(_$CityTravelsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CityTravelsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travels = null,
    Object? hasNextPage = freezed,
  }) {
    return _then(_$CityTravelsStateImpl(
      travels: null == travels
          ? _value._travels
          : travels // ignore: cast_nullable_to_non_nullable
              as List<TravelModel>,
      hasNextPage: freezed == hasNextPage ? _value.hasNextPage! : hasNextPage,
    ));
  }
}

/// @nodoc

class _$CityTravelsStateImpl extends _CityTravelsState {
  const _$CityTravelsStateImpl(
      {final List<TravelModel> travels = const [], this.hasNextPage = false})
      : _travels = travels,
        super._();

  final List<TravelModel> _travels;
  @override
  @JsonKey()
  List<TravelModel> get travels {
    if (_travels is EqualUnmodifiableListView) return _travels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_travels);
  }

  @override
  @JsonKey()
  final dynamic hasNextPage;

  @override
  String toString() {
    return 'CityTravelsState(travels: $travels, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityTravelsStateImpl &&
            const DeepCollectionEquality().equals(other._travels, _travels) &&
            const DeepCollectionEquality()
                .equals(other.hasNextPage, hasNextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_travels),
      const DeepCollectionEquality().hash(hasNextPage));

  /// Create a copy of CityTravelsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CityTravelsStateImplCopyWith<_$CityTravelsStateImpl> get copyWith =>
      __$$CityTravelsStateImplCopyWithImpl<_$CityTravelsStateImpl>(
          this, _$identity);
}

abstract class _CityTravelsState extends CityTravelsState {
  const factory _CityTravelsState(
      {final List<TravelModel> travels,
      final dynamic hasNextPage}) = _$CityTravelsStateImpl;
  const _CityTravelsState._() : super._();

  @override
  List<TravelModel> get travels;
  @override
  dynamic get hasNextPage;

  /// Create a copy of CityTravelsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CityTravelsStateImplCopyWith<_$CityTravelsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
