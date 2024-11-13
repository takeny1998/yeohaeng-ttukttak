// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelVisitModel _$TravelVisitModelFromJson(Map<String, dynamic> json) {
  return _TravelVisitModel.fromJson(json);
}

/// @nodoc
mixin _$TravelVisitModel {
  int get id => throw _privateConstructorUsedError;
  int get seq => throw _privateConstructorUsedError;
  int get placeId => throw _privateConstructorUsedError;
  DateTime get visitedOn => throw _privateConstructorUsedError;
  TravelVisitRatingModel get rating => throw _privateConstructorUsedError;
  TravelVisitReasonType get reasonType => throw _privateConstructorUsedError;
  List<ImageModel> get images => throw _privateConstructorUsedError;

  /// Serializes this TravelVisitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelVisitModelCopyWith<TravelVisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelVisitModelCopyWith<$Res> {
  factory $TravelVisitModelCopyWith(
          TravelVisitModel value, $Res Function(TravelVisitModel) then) =
      _$TravelVisitModelCopyWithImpl<$Res, TravelVisitModel>;
  @useResult
  $Res call(
      {int id,
      int seq,
      int placeId,
      DateTime visitedOn,
      TravelVisitRatingModel rating,
      TravelVisitReasonType reasonType,
      List<ImageModel> images});

  $TravelVisitRatingModelCopyWith<$Res> get rating;
}

/// @nodoc
class _$TravelVisitModelCopyWithImpl<$Res, $Val extends TravelVisitModel>
    implements $TravelVisitModelCopyWith<$Res> {
  _$TravelVisitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seq = null,
    Object? placeId = null,
    Object? visitedOn = null,
    Object? rating = null,
    Object? reasonType = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      visitedOn: null == visitedOn
          ? _value.visitedOn
          : visitedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as TravelVisitRatingModel,
      reasonType: null == reasonType
          ? _value.reasonType
          : reasonType // ignore: cast_nullable_to_non_nullable
              as TravelVisitReasonType,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ) as $Val);
  }

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TravelVisitRatingModelCopyWith<$Res> get rating {
    return $TravelVisitRatingModelCopyWith<$Res>(_value.rating, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelVisitModelImplCopyWith<$Res>
    implements $TravelVisitModelCopyWith<$Res> {
  factory _$$TravelVisitModelImplCopyWith(_$TravelVisitModelImpl value,
          $Res Function(_$TravelVisitModelImpl) then) =
      __$$TravelVisitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int seq,
      int placeId,
      DateTime visitedOn,
      TravelVisitRatingModel rating,
      TravelVisitReasonType reasonType,
      List<ImageModel> images});

  @override
  $TravelVisitRatingModelCopyWith<$Res> get rating;
}

/// @nodoc
class __$$TravelVisitModelImplCopyWithImpl<$Res>
    extends _$TravelVisitModelCopyWithImpl<$Res, _$TravelVisitModelImpl>
    implements _$$TravelVisitModelImplCopyWith<$Res> {
  __$$TravelVisitModelImplCopyWithImpl(_$TravelVisitModelImpl _value,
      $Res Function(_$TravelVisitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seq = null,
    Object? placeId = null,
    Object? visitedOn = null,
    Object? rating = null,
    Object? reasonType = null,
    Object? images = null,
  }) {
    return _then(_$TravelVisitModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      visitedOn: null == visitedOn
          ? _value.visitedOn
          : visitedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as TravelVisitRatingModel,
      reasonType: null == reasonType
          ? _value.reasonType
          : reasonType // ignore: cast_nullable_to_non_nullable
              as TravelVisitReasonType,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitModelImpl implements _TravelVisitModel {
  const _$TravelVisitModelImpl(
      {required this.id,
      required this.seq,
      required this.placeId,
      required this.visitedOn,
      required this.rating,
      required this.reasonType,
      required final List<ImageModel> images})
      : _images = images;

  factory _$TravelVisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitModelImplFromJson(json);

  @override
  final int id;
  @override
  final int seq;
  @override
  final int placeId;
  @override
  final DateTime visitedOn;
  @override
  final TravelVisitRatingModel rating;
  @override
  final TravelVisitReasonType reasonType;
  final List<ImageModel> _images;
  @override
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'TravelVisitModel(id: $id, seq: $seq, placeId: $placeId, visitedOn: $visitedOn, rating: $rating, reasonType: $reasonType, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelVisitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.visitedOn, visitedOn) ||
                other.visitedOn == visitedOn) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reasonType, reasonType) ||
                other.reasonType == reasonType) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, seq, placeId, visitedOn,
      rating, reasonType, const DeepCollectionEquality().hash(_images));

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelVisitModelImplCopyWith<_$TravelVisitModelImpl> get copyWith =>
      __$$TravelVisitModelImplCopyWithImpl<_$TravelVisitModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelVisitModelImplToJson(
      this,
    );
  }
}

abstract class _TravelVisitModel implements TravelVisitModel {
  const factory _TravelVisitModel(
      {required final int id,
      required final int seq,
      required final int placeId,
      required final DateTime visitedOn,
      required final TravelVisitRatingModel rating,
      required final TravelVisitReasonType reasonType,
      required final List<ImageModel> images}) = _$TravelVisitModelImpl;

  factory _TravelVisitModel.fromJson(Map<String, dynamic> json) =
      _$TravelVisitModelImpl.fromJson;

  @override
  int get id;
  @override
  int get seq;
  @override
  int get placeId;
  @override
  DateTime get visitedOn;
  @override
  TravelVisitRatingModel get rating;
  @override
  TravelVisitReasonType get reasonType;
  @override
  List<ImageModel> get images;

  /// Create a copy of TravelVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelVisitModelImplCopyWith<_$TravelVisitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
