// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_recommend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaceRecommendModel {
  PlaceCategoryType get categoryType => throw _privateConstructorUsedError;
  List<PlaceModel> get places => throw _privateConstructorUsedError;

  /// Create a copy of PlaceRecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceRecommendModelCopyWith<PlaceRecommendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceRecommendModelCopyWith<$Res> {
  factory $PlaceRecommendModelCopyWith(
          PlaceRecommendModel value, $Res Function(PlaceRecommendModel) then) =
      _$PlaceRecommendModelCopyWithImpl<$Res, PlaceRecommendModel>;
  @useResult
  $Res call({PlaceCategoryType categoryType, List<PlaceModel> places});
}

/// @nodoc
class _$PlaceRecommendModelCopyWithImpl<$Res, $Val extends PlaceRecommendModel>
    implements $PlaceRecommendModelCopyWith<$Res> {
  _$PlaceRecommendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaceRecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as PlaceCategoryType,
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceRecommendModelImplCopyWith<$Res>
    implements $PlaceRecommendModelCopyWith<$Res> {
  factory _$$PlaceRecommendModelImplCopyWith(_$PlaceRecommendModelImpl value,
          $Res Function(_$PlaceRecommendModelImpl) then) =
      __$$PlaceRecommendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceCategoryType categoryType, List<PlaceModel> places});
}

/// @nodoc
class __$$PlaceRecommendModelImplCopyWithImpl<$Res>
    extends _$PlaceRecommendModelCopyWithImpl<$Res, _$PlaceRecommendModelImpl>
    implements _$$PlaceRecommendModelImplCopyWith<$Res> {
  __$$PlaceRecommendModelImplCopyWithImpl(_$PlaceRecommendModelImpl _value,
      $Res Function(_$PlaceRecommendModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaceRecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryType = null,
    Object? places = null,
  }) {
    return _then(_$PlaceRecommendModelImpl(
      categoryType: null == categoryType
          ? _value.categoryType
          : categoryType // ignore: cast_nullable_to_non_nullable
              as PlaceCategoryType,
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
    ));
  }
}

/// @nodoc

class _$PlaceRecommendModelImpl implements _PlaceRecommendModel {
  const _$PlaceRecommendModelImpl(
      {required this.categoryType, required final List<PlaceModel> places})
      : _places = places;

  @override
  final PlaceCategoryType categoryType;
  final List<PlaceModel> _places;
  @override
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'PlaceRecommendModel(categoryType: $categoryType, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceRecommendModelImpl &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryType, const DeepCollectionEquality().hash(_places));

  /// Create a copy of PlaceRecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceRecommendModelImplCopyWith<_$PlaceRecommendModelImpl> get copyWith =>
      __$$PlaceRecommendModelImplCopyWithImpl<_$PlaceRecommendModelImpl>(
          this, _$identity);
}

abstract class _PlaceRecommendModel implements PlaceRecommendModel {
  const factory _PlaceRecommendModel(
      {required final PlaceCategoryType categoryType,
      required final List<PlaceModel> places}) = _$PlaceRecommendModelImpl;

  @override
  PlaceCategoryType get categoryType;
  @override
  List<PlaceModel> get places;

  /// Create a copy of PlaceRecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceRecommendModelImplCopyWith<_$PlaceRecommendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
