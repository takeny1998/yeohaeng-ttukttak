// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_visit_rating_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelVisitRatingModel _$TravelVisitRatingModelFromJson(
    Map<String, dynamic> json) {
  return _TravelVisitRatingModel.fromJson(json);
}

/// @nodoc
mixin _$TravelVisitRatingModel {
  int get satisfaction => throw _privateConstructorUsedError;
  int get revisit => throw _privateConstructorUsedError;
  int get recommend => throw _privateConstructorUsedError;

  /// Serializes this TravelVisitRatingModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelVisitRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelVisitRatingModelCopyWith<TravelVisitRatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelVisitRatingModelCopyWith<$Res> {
  factory $TravelVisitRatingModelCopyWith(TravelVisitRatingModel value,
          $Res Function(TravelVisitRatingModel) then) =
      _$TravelVisitRatingModelCopyWithImpl<$Res, TravelVisitRatingModel>;
  @useResult
  $Res call({int satisfaction, int revisit, int recommend});
}

/// @nodoc
class _$TravelVisitRatingModelCopyWithImpl<$Res,
        $Val extends TravelVisitRatingModel>
    implements $TravelVisitRatingModelCopyWith<$Res> {
  _$TravelVisitRatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelVisitRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? satisfaction = null,
    Object? revisit = null,
    Object? recommend = null,
  }) {
    return _then(_value.copyWith(
      satisfaction: null == satisfaction
          ? _value.satisfaction
          : satisfaction // ignore: cast_nullable_to_non_nullable
              as int,
      revisit: null == revisit
          ? _value.revisit
          : revisit // ignore: cast_nullable_to_non_nullable
              as int,
      recommend: null == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelVisitRatingModelImplCopyWith<$Res>
    implements $TravelVisitRatingModelCopyWith<$Res> {
  factory _$$TravelVisitRatingModelImplCopyWith(
          _$TravelVisitRatingModelImpl value,
          $Res Function(_$TravelVisitRatingModelImpl) then) =
      __$$TravelVisitRatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int satisfaction, int revisit, int recommend});
}

/// @nodoc
class __$$TravelVisitRatingModelImplCopyWithImpl<$Res>
    extends _$TravelVisitRatingModelCopyWithImpl<$Res,
        _$TravelVisitRatingModelImpl>
    implements _$$TravelVisitRatingModelImplCopyWith<$Res> {
  __$$TravelVisitRatingModelImplCopyWithImpl(
      _$TravelVisitRatingModelImpl _value,
      $Res Function(_$TravelVisitRatingModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelVisitRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? satisfaction = null,
    Object? revisit = null,
    Object? recommend = null,
  }) {
    return _then(_$TravelVisitRatingModelImpl(
      satisfaction: null == satisfaction
          ? _value.satisfaction
          : satisfaction // ignore: cast_nullable_to_non_nullable
              as int,
      revisit: null == revisit
          ? _value.revisit
          : revisit // ignore: cast_nullable_to_non_nullable
              as int,
      recommend: null == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitRatingModelImpl implements _TravelVisitRatingModel {
  const _$TravelVisitRatingModelImpl(
      {required this.satisfaction,
      required this.revisit,
      required this.recommend});

  factory _$TravelVisitRatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitRatingModelImplFromJson(json);

  @override
  final int satisfaction;
  @override
  final int revisit;
  @override
  final int recommend;

  @override
  String toString() {
    return 'TravelVisitRatingModel(satisfaction: $satisfaction, revisit: $revisit, recommend: $recommend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelVisitRatingModelImpl &&
            (identical(other.satisfaction, satisfaction) ||
                other.satisfaction == satisfaction) &&
            (identical(other.revisit, revisit) || other.revisit == revisit) &&
            (identical(other.recommend, recommend) ||
                other.recommend == recommend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, satisfaction, revisit, recommend);

  /// Create a copy of TravelVisitRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelVisitRatingModelImplCopyWith<_$TravelVisitRatingModelImpl>
      get copyWith => __$$TravelVisitRatingModelImplCopyWithImpl<
          _$TravelVisitRatingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelVisitRatingModelImplToJson(
      this,
    );
  }
}

abstract class _TravelVisitRatingModel implements TravelVisitRatingModel {
  const factory _TravelVisitRatingModel(
      {required final int satisfaction,
      required final int revisit,
      required final int recommend}) = _$TravelVisitRatingModelImpl;

  factory _TravelVisitRatingModel.fromJson(Map<String, dynamic> json) =
      _$TravelVisitRatingModelImpl.fromJson;

  @override
  int get satisfaction;
  @override
  int get revisit;
  @override
  int get recommend;

  /// Create a copy of TravelVisitRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelVisitRatingModelImplCopyWith<_$TravelVisitRatingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
