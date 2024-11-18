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
  int get placeId => throw _privateConstructorUsedError;
  TravelVisitRatingModel get rating => throw _privateConstructorUsedError;
  List<ImageModel> get images => throw _privateConstructorUsedError;
  DateTime? get visitedOn => throw _privateConstructorUsedError;
  int? get orderOfVisit => throw _privateConstructorUsedError;
  TravelVisitReasonType? get reasonType => throw _privateConstructorUsedError;

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
      int placeId,
      TravelVisitRatingModel rating,
      List<ImageModel> images,
      DateTime? visitedOn,
      int? orderOfVisit,
      TravelVisitReasonType? reasonType});

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
    Object? placeId = null,
    Object? rating = null,
    Object? images = null,
    Object? visitedOn = freezed,
    Object? orderOfVisit = freezed,
    Object? reasonType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as TravelVisitRatingModel,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      visitedOn: freezed == visitedOn
          ? _value.visitedOn
          : visitedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderOfVisit: freezed == orderOfVisit
          ? _value.orderOfVisit
          : orderOfVisit // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonType: freezed == reasonType
          ? _value.reasonType
          : reasonType // ignore: cast_nullable_to_non_nullable
              as TravelVisitReasonType?,
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
      int placeId,
      TravelVisitRatingModel rating,
      List<ImageModel> images,
      DateTime? visitedOn,
      int? orderOfVisit,
      TravelVisitReasonType? reasonType});

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
    Object? placeId = null,
    Object? rating = null,
    Object? images = null,
    Object? visitedOn = freezed,
    Object? orderOfVisit = freezed,
    Object? reasonType = freezed,
  }) {
    return _then(_$TravelVisitModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as TravelVisitRatingModel,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ImageModel>,
      visitedOn: freezed == visitedOn
          ? _value.visitedOn
          : visitedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      orderOfVisit: freezed == orderOfVisit
          ? _value.orderOfVisit
          : orderOfVisit // ignore: cast_nullable_to_non_nullable
              as int?,
      reasonType: freezed == reasonType
          ? _value.reasonType
          : reasonType // ignore: cast_nullable_to_non_nullable
              as TravelVisitReasonType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitModelImpl implements _TravelVisitModel {
  const _$TravelVisitModelImpl(
      {required this.id,
      required this.placeId,
      required this.rating,
      required final List<ImageModel> images,
      this.visitedOn,
      this.orderOfVisit,
      this.reasonType})
      : _images = images;

  factory _$TravelVisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitModelImplFromJson(json);

  @override
  final int id;
  @override
  final int placeId;
  @override
  final TravelVisitRatingModel rating;
  final List<ImageModel> _images;
  @override
  List<ImageModel> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final DateTime? visitedOn;
  @override
  final int? orderOfVisit;
  @override
  final TravelVisitReasonType? reasonType;

  @override
  String toString() {
    return 'TravelVisitModel(id: $id, placeId: $placeId, rating: $rating, images: $images, visitedOn: $visitedOn, orderOfVisit: $orderOfVisit, reasonType: $reasonType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelVisitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.visitedOn, visitedOn) ||
                other.visitedOn == visitedOn) &&
            (identical(other.orderOfVisit, orderOfVisit) ||
                other.orderOfVisit == orderOfVisit) &&
            (identical(other.reasonType, reasonType) ||
                other.reasonType == reasonType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      placeId,
      rating,
      const DeepCollectionEquality().hash(_images),
      visitedOn,
      orderOfVisit,
      reasonType);

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
      required final int placeId,
      required final TravelVisitRatingModel rating,
      required final List<ImageModel> images,
      final DateTime? visitedOn,
      final int? orderOfVisit,
      final TravelVisitReasonType? reasonType}) = _$TravelVisitModelImpl;

  factory _TravelVisitModel.fromJson(Map<String, dynamic> json) =
      _$TravelVisitModelImpl.fromJson;

  @override
  int get id;
  @override
  int get placeId;
  @override
  TravelVisitRatingModel get rating;
  @override
  List<ImageModel> get images;
  @override
  DateTime? get visitedOn;
  @override
  int? get orderOfVisit;
  @override
  TravelVisitReasonType? get reasonType;

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
  int? get satisfaction => throw _privateConstructorUsedError;
  int? get revisit => throw _privateConstructorUsedError;
  int? get recommend => throw _privateConstructorUsedError;

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
  $Res call({int? satisfaction, int? revisit, int? recommend});
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
    Object? satisfaction = freezed,
    Object? revisit = freezed,
    Object? recommend = freezed,
  }) {
    return _then(_value.copyWith(
      satisfaction: freezed == satisfaction
          ? _value.satisfaction
          : satisfaction // ignore: cast_nullable_to_non_nullable
              as int?,
      revisit: freezed == revisit
          ? _value.revisit
          : revisit // ignore: cast_nullable_to_non_nullable
              as int?,
      recommend: freezed == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call({int? satisfaction, int? revisit, int? recommend});
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
    Object? satisfaction = freezed,
    Object? revisit = freezed,
    Object? recommend = freezed,
  }) {
    return _then(_$TravelVisitRatingModelImpl(
      satisfaction: freezed == satisfaction
          ? _value.satisfaction
          : satisfaction // ignore: cast_nullable_to_non_nullable
              as int?,
      revisit: freezed == revisit
          ? _value.revisit
          : revisit // ignore: cast_nullable_to_non_nullable
              as int?,
      recommend: freezed == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitRatingModelImpl implements _TravelVisitRatingModel {
  const _$TravelVisitRatingModelImpl(
      {this.satisfaction, this.revisit, this.recommend});

  factory _$TravelVisitRatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitRatingModelImplFromJson(json);

  @override
  final int? satisfaction;
  @override
  final int? revisit;
  @override
  final int? recommend;

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
      {final int? satisfaction,
      final int? revisit,
      final int? recommend}) = _$TravelVisitRatingModelImpl;

  factory _TravelVisitRatingModel.fromJson(Map<String, dynamic> json) =
      _$TravelVisitRatingModelImpl.fromJson;

  @override
  int? get satisfaction;
  @override
  int? get revisit;
  @override
  int? get recommend;

  /// Create a copy of TravelVisitRatingModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelVisitRatingModelImplCopyWith<_$TravelVisitRatingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TravelVisitForm _$TravelVisitFormFromJson(Map<String, dynamic> json) {
  return _TravelVisitForm.fromJson(json);
}

/// @nodoc
mixin _$TravelVisitForm {
  int get placeId => throw _privateConstructorUsedError;

  /// Serializes this TravelVisitForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelVisitFormCopyWith<TravelVisitForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelVisitFormCopyWith<$Res> {
  factory $TravelVisitFormCopyWith(
          TravelVisitForm value, $Res Function(TravelVisitForm) then) =
      _$TravelVisitFormCopyWithImpl<$Res, TravelVisitForm>;
  @useResult
  $Res call({int placeId});
}

/// @nodoc
class _$TravelVisitFormCopyWithImpl<$Res, $Val extends TravelVisitForm>
    implements $TravelVisitFormCopyWith<$Res> {
  _$TravelVisitFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelVisitFormImplCopyWith<$Res>
    implements $TravelVisitFormCopyWith<$Res> {
  factory _$$TravelVisitFormImplCopyWith(_$TravelVisitFormImpl value,
          $Res Function(_$TravelVisitFormImpl) then) =
      __$$TravelVisitFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int placeId});
}

/// @nodoc
class __$$TravelVisitFormImplCopyWithImpl<$Res>
    extends _$TravelVisitFormCopyWithImpl<$Res, _$TravelVisitFormImpl>
    implements _$$TravelVisitFormImplCopyWith<$Res> {
  __$$TravelVisitFormImplCopyWithImpl(
      _$TravelVisitFormImpl _value, $Res Function(_$TravelVisitFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
  }) {
    return _then(_$TravelVisitFormImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitFormImpl implements _TravelVisitForm {
  const _$TravelVisitFormImpl({required this.placeId});

  factory _$TravelVisitFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitFormImplFromJson(json);

  @override
  final int placeId;

  @override
  String toString() {
    return 'TravelVisitForm(placeId: $placeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelVisitFormImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId);

  /// Create a copy of TravelVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelVisitFormImplCopyWith<_$TravelVisitFormImpl> get copyWith =>
      __$$TravelVisitFormImplCopyWithImpl<_$TravelVisitFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelVisitFormImplToJson(
      this,
    );
  }
}

abstract class _TravelVisitForm implements TravelVisitForm {
  const factory _TravelVisitForm({required final int placeId}) =
      _$TravelVisitFormImpl;

  factory _TravelVisitForm.fromJson(Map<String, dynamic> json) =
      _$TravelVisitFormImpl.fromJson;

  @override
  int get placeId;

  /// Create a copy of TravelVisitForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelVisitFormImplCopyWith<_$TravelVisitFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TravelVisitEditModel _$TravelVisitEditModelFromJson(Map<String, dynamic> json) {
  return _TravelVisitPlanModel.fromJson(json);
}

/// @nodoc
mixin _$TravelVisitEditModel {
  int get id => throw _privateConstructorUsedError;
  int get orderOfVisit => throw _privateConstructorUsedError;
  int get dayOfTravel => throw _privateConstructorUsedError;

  /// Serializes this TravelVisitEditModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelVisitEditModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelVisitEditModelCopyWith<TravelVisitEditModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelVisitEditModelCopyWith<$Res> {
  factory $TravelVisitEditModelCopyWith(TravelVisitEditModel value,
          $Res Function(TravelVisitEditModel) then) =
      _$TravelVisitEditModelCopyWithImpl<$Res, TravelVisitEditModel>;
  @useResult
  $Res call({int id, int orderOfVisit, int dayOfTravel});
}

/// @nodoc
class _$TravelVisitEditModelCopyWithImpl<$Res,
        $Val extends TravelVisitEditModel>
    implements $TravelVisitEditModelCopyWith<$Res> {
  _$TravelVisitEditModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelVisitEditModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderOfVisit = null,
    Object? dayOfTravel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderOfVisit: null == orderOfVisit
          ? _value.orderOfVisit
          : orderOfVisit // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfTravel: null == dayOfTravel
          ? _value.dayOfTravel
          : dayOfTravel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelVisitPlanModelImplCopyWith<$Res>
    implements $TravelVisitEditModelCopyWith<$Res> {
  factory _$$TravelVisitPlanModelImplCopyWith(_$TravelVisitPlanModelImpl value,
          $Res Function(_$TravelVisitPlanModelImpl) then) =
      __$$TravelVisitPlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int orderOfVisit, int dayOfTravel});
}

/// @nodoc
class __$$TravelVisitPlanModelImplCopyWithImpl<$Res>
    extends _$TravelVisitEditModelCopyWithImpl<$Res, _$TravelVisitPlanModelImpl>
    implements _$$TravelVisitPlanModelImplCopyWith<$Res> {
  __$$TravelVisitPlanModelImplCopyWithImpl(_$TravelVisitPlanModelImpl _value,
      $Res Function(_$TravelVisitPlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelVisitEditModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderOfVisit = null,
    Object? dayOfTravel = null,
  }) {
    return _then(_$TravelVisitPlanModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderOfVisit: null == orderOfVisit
          ? _value.orderOfVisit
          : orderOfVisit // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfTravel: null == dayOfTravel
          ? _value.dayOfTravel
          : dayOfTravel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelVisitPlanModelImpl implements _TravelVisitPlanModel {
  const _$TravelVisitPlanModelImpl(
      {required this.id,
      required this.orderOfVisit,
      required this.dayOfTravel});

  factory _$TravelVisitPlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelVisitPlanModelImplFromJson(json);

  @override
  final int id;
  @override
  final int orderOfVisit;
  @override
  final int dayOfTravel;

  @override
  String toString() {
    return 'TravelVisitEditModel(id: $id, orderOfVisit: $orderOfVisit, dayOfTravel: $dayOfTravel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelVisitPlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderOfVisit, orderOfVisit) ||
                other.orderOfVisit == orderOfVisit) &&
            (identical(other.dayOfTravel, dayOfTravel) ||
                other.dayOfTravel == dayOfTravel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderOfVisit, dayOfTravel);

  /// Create a copy of TravelVisitEditModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelVisitPlanModelImplCopyWith<_$TravelVisitPlanModelImpl>
      get copyWith =>
          __$$TravelVisitPlanModelImplCopyWithImpl<_$TravelVisitPlanModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelVisitPlanModelImplToJson(
      this,
    );
  }
}

abstract class _TravelVisitPlanModel implements TravelVisitEditModel {
  const factory _TravelVisitPlanModel(
      {required final int id,
      required final int orderOfVisit,
      required final int dayOfTravel}) = _$TravelVisitPlanModelImpl;

  factory _TravelVisitPlanModel.fromJson(Map<String, dynamic> json) =
      _$TravelVisitPlanModelImpl.fromJson;

  @override
  int get id;
  @override
  int get orderOfVisit;
  @override
  int get dayOfTravel;

  /// Create a copy of TravelVisitEditModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelVisitPlanModelImplCopyWith<_$TravelVisitPlanModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
