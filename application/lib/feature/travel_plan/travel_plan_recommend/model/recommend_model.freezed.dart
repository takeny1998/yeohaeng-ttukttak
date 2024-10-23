// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecommendModel {
  RecommendTarget get target => throw _privateConstructorUsedError;
  PlaceCategory get category => throw _privateConstructorUsedError;
  List<PlaceModel> get places => throw _privateConstructorUsedError;

  /// Create a copy of RecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendModelCopyWith<RecommendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendModelCopyWith<$Res> {
  factory $RecommendModelCopyWith(
          RecommendModel value, $Res Function(RecommendModel) then) =
      _$RecommendModelCopyWithImpl<$Res, RecommendModel>;
  @useResult
  $Res call(
      {RecommendTarget target,
      PlaceCategory category,
      List<PlaceModel> places});
}

/// @nodoc
class _$RecommendModelCopyWithImpl<$Res, $Val extends RecommendModel>
    implements $RecommendModelCopyWith<$Res> {
  _$RecommendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? category = null,
    Object? places = null,
  }) {
    return _then(_value.copyWith(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as RecommendTarget,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PlaceCategory,
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendModelImplCopyWith<$Res>
    implements $RecommendModelCopyWith<$Res> {
  factory _$$RecommendModelImplCopyWith(_$RecommendModelImpl value,
          $Res Function(_$RecommendModelImpl) then) =
      __$$RecommendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecommendTarget target,
      PlaceCategory category,
      List<PlaceModel> places});
}

/// @nodoc
class __$$RecommendModelImplCopyWithImpl<$Res>
    extends _$RecommendModelCopyWithImpl<$Res, _$RecommendModelImpl>
    implements _$$RecommendModelImplCopyWith<$Res> {
  __$$RecommendModelImplCopyWithImpl(
      _$RecommendModelImpl _value, $Res Function(_$RecommendModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? target = null,
    Object? category = null,
    Object? places = null,
  }) {
    return _then(_$RecommendModelImpl(
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as RecommendTarget,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PlaceCategory,
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<PlaceModel>,
    ));
  }
}

/// @nodoc

class _$RecommendModelImpl implements _RecommendModel {
  const _$RecommendModelImpl(
      {required this.target,
      required this.category,
      required final List<PlaceModel> places})
      : _places = places;

  @override
  final RecommendTarget target;
  @override
  final PlaceCategory category;
  final List<PlaceModel> _places;
  @override
  List<PlaceModel> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'RecommendModel(target: $target, category: $category, places: $places)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendModelImpl &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @override
  int get hashCode => Object.hash(runtimeType, target, category,
      const DeepCollectionEquality().hash(_places));

  /// Create a copy of RecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendModelImplCopyWith<_$RecommendModelImpl> get copyWith =>
      __$$RecommendModelImplCopyWithImpl<_$RecommendModelImpl>(
          this, _$identity);
}

abstract class _RecommendModel implements RecommendModel {
  const factory _RecommendModel(
      {required final RecommendTarget target,
      required final PlaceCategory category,
      required final List<PlaceModel> places}) = _$RecommendModelImpl;

  @override
  RecommendTarget get target;
  @override
  PlaceCategory get category;
  @override
  List<PlaceModel> get places;

  /// Create a copy of RecommendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendModelImplCopyWith<_$RecommendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
