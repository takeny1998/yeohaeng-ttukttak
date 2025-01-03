// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attraction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttractionModel _$AttractionModelFromJson(Map<String, dynamic> json) {
  return _AttractionModel.fromJson(json);
}

/// @nodoc
mixin _$AttractionModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get roadAddress => throw _privateConstructorUsedError;
  String? get lotNumberAddress => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<PlaceCategoryType> get categoryTypes =>
      throw _privateConstructorUsedError;
  List<AttractionVisitReasonModel> get visitReasons =>
      throw _privateConstructorUsedError;

  /// Serializes this AttractionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttractionModelCopyWith<AttractionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionModelCopyWith<$Res> {
  factory $AttractionModelCopyWith(
          AttractionModel value, $Res Function(AttractionModel) then) =
      _$AttractionModelCopyWithImpl<$Res, AttractionModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? roadAddress,
      String? lotNumberAddress,
      double rating,
      List<PlaceCategoryType> categoryTypes,
      List<AttractionVisitReasonModel> visitReasons});
}

/// @nodoc
class _$AttractionModelCopyWithImpl<$Res, $Val extends AttractionModel>
    implements $AttractionModelCopyWith<$Res> {
  _$AttractionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? roadAddress = freezed,
    Object? lotNumberAddress = freezed,
    Object? rating = null,
    Object? categoryTypes = null,
    Object? visitReasons = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddress: freezed == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      lotNumberAddress: freezed == lotNumberAddress
          ? _value.lotNumberAddress
          : lotNumberAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      categoryTypes: null == categoryTypes
          ? _value.categoryTypes
          : categoryTypes // ignore: cast_nullable_to_non_nullable
              as List<PlaceCategoryType>,
      visitReasons: null == visitReasons
          ? _value.visitReasons
          : visitReasons // ignore: cast_nullable_to_non_nullable
              as List<AttractionVisitReasonModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttractionModelImplCopyWith<$Res>
    implements $AttractionModelCopyWith<$Res> {
  factory _$$AttractionModelImplCopyWith(_$AttractionModelImpl value,
          $Res Function(_$AttractionModelImpl) then) =
      __$$AttractionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? roadAddress,
      String? lotNumberAddress,
      double rating,
      List<PlaceCategoryType> categoryTypes,
      List<AttractionVisitReasonModel> visitReasons});
}

/// @nodoc
class __$$AttractionModelImplCopyWithImpl<$Res>
    extends _$AttractionModelCopyWithImpl<$Res, _$AttractionModelImpl>
    implements _$$AttractionModelImplCopyWith<$Res> {
  __$$AttractionModelImplCopyWithImpl(
      _$AttractionModelImpl _value, $Res Function(_$AttractionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? roadAddress = freezed,
    Object? lotNumberAddress = freezed,
    Object? rating = null,
    Object? categoryTypes = null,
    Object? visitReasons = null,
  }) {
    return _then(_$AttractionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      roadAddress: freezed == roadAddress
          ? _value.roadAddress
          : roadAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      lotNumberAddress: freezed == lotNumberAddress
          ? _value.lotNumberAddress
          : lotNumberAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      categoryTypes: null == categoryTypes
          ? _value._categoryTypes
          : categoryTypes // ignore: cast_nullable_to_non_nullable
              as List<PlaceCategoryType>,
      visitReasons: null == visitReasons
          ? _value._visitReasons
          : visitReasons // ignore: cast_nullable_to_non_nullable
              as List<AttractionVisitReasonModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttractionModelImpl implements _AttractionModel {
  const _$AttractionModelImpl(
      {required this.id,
      required this.name,
      required this.roadAddress,
      required this.lotNumberAddress,
      required this.rating,
      required final List<PlaceCategoryType> categoryTypes,
      required final List<AttractionVisitReasonModel> visitReasons})
      : _categoryTypes = categoryTypes,
        _visitReasons = visitReasons;

  factory _$AttractionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttractionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? roadAddress;
  @override
  final String? lotNumberAddress;
  @override
  final double rating;
  final List<PlaceCategoryType> _categoryTypes;
  @override
  List<PlaceCategoryType> get categoryTypes {
    if (_categoryTypes is EqualUnmodifiableListView) return _categoryTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryTypes);
  }

  final List<AttractionVisitReasonModel> _visitReasons;
  @override
  List<AttractionVisitReasonModel> get visitReasons {
    if (_visitReasons is EqualUnmodifiableListView) return _visitReasons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitReasons);
  }

  @override
  String toString() {
    return 'AttractionModel(id: $id, name: $name, roadAddress: $roadAddress, lotNumberAddress: $lotNumberAddress, rating: $rating, categoryTypes: $categoryTypes, visitReasons: $visitReasons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.roadAddress, roadAddress) ||
                other.roadAddress == roadAddress) &&
            (identical(other.lotNumberAddress, lotNumberAddress) ||
                other.lotNumberAddress == lotNumberAddress) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._categoryTypes, _categoryTypes) &&
            const DeepCollectionEquality()
                .equals(other._visitReasons, _visitReasons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      roadAddress,
      lotNumberAddress,
      rating,
      const DeepCollectionEquality().hash(_categoryTypes),
      const DeepCollectionEquality().hash(_visitReasons));

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionModelImplCopyWith<_$AttractionModelImpl> get copyWith =>
      __$$AttractionModelImplCopyWithImpl<_$AttractionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttractionModelImplToJson(
      this,
    );
  }
}

abstract class _AttractionModel implements AttractionModel {
  const factory _AttractionModel(
          {required final int id,
          required final String name,
          required final String? roadAddress,
          required final String? lotNumberAddress,
          required final double rating,
          required final List<PlaceCategoryType> categoryTypes,
          required final List<AttractionVisitReasonModel> visitReasons}) =
      _$AttractionModelImpl;

  factory _AttractionModel.fromJson(Map<String, dynamic> json) =
      _$AttractionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get roadAddress;
  @override
  String? get lotNumberAddress;
  @override
  double get rating;
  @override
  List<PlaceCategoryType> get categoryTypes;
  @override
  List<AttractionVisitReasonModel> get visitReasons;

  /// Create a copy of AttractionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttractionModelImplCopyWith<_$AttractionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AttractionVisitReasonModel _$AttractionVisitReasonModelFromJson(
    Map<String, dynamic> json) {
  return _AttractionVisitReasonModel.fromJson(json);
}

/// @nodoc
mixin _$AttractionVisitReasonModel {
  TravelVisitReasonType get reasonType => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this AttractionVisitReasonModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttractionVisitReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttractionVisitReasonModelCopyWith<AttractionVisitReasonModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttractionVisitReasonModelCopyWith<$Res> {
  factory $AttractionVisitReasonModelCopyWith(AttractionVisitReasonModel value,
          $Res Function(AttractionVisitReasonModel) then) =
      _$AttractionVisitReasonModelCopyWithImpl<$Res,
          AttractionVisitReasonModel>;
  @useResult
  $Res call({TravelVisitReasonType reasonType, int count});
}

/// @nodoc
class _$AttractionVisitReasonModelCopyWithImpl<$Res,
        $Val extends AttractionVisitReasonModel>
    implements $AttractionVisitReasonModelCopyWith<$Res> {
  _$AttractionVisitReasonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttractionVisitReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonType = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      reasonType: null == reasonType
          ? _value.reasonType
          : reasonType // ignore: cast_nullable_to_non_nullable
              as TravelVisitReasonType,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttractionVisitReasonModelImplCopyWith<$Res>
    implements $AttractionVisitReasonModelCopyWith<$Res> {
  factory _$$AttractionVisitReasonModelImplCopyWith(
          _$AttractionVisitReasonModelImpl value,
          $Res Function(_$AttractionVisitReasonModelImpl) then) =
      __$$AttractionVisitReasonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TravelVisitReasonType reasonType, int count});
}

/// @nodoc
class __$$AttractionVisitReasonModelImplCopyWithImpl<$Res>
    extends _$AttractionVisitReasonModelCopyWithImpl<$Res,
        _$AttractionVisitReasonModelImpl>
    implements _$$AttractionVisitReasonModelImplCopyWith<$Res> {
  __$$AttractionVisitReasonModelImplCopyWithImpl(
      _$AttractionVisitReasonModelImpl _value,
      $Res Function(_$AttractionVisitReasonModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttractionVisitReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonType = null,
    Object? count = null,
  }) {
    return _then(_$AttractionVisitReasonModelImpl(
      reasonType: null == reasonType
          ? _value.reasonType
          : reasonType // ignore: cast_nullable_to_non_nullable
              as TravelVisitReasonType,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttractionVisitReasonModelImpl implements _AttractionVisitReasonModel {
  const _$AttractionVisitReasonModelImpl(
      {required this.reasonType, required this.count});

  factory _$AttractionVisitReasonModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AttractionVisitReasonModelImplFromJson(json);

  @override
  final TravelVisitReasonType reasonType;
  @override
  final int count;

  @override
  String toString() {
    return 'AttractionVisitReasonModel(reasonType: $reasonType, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttractionVisitReasonModelImpl &&
            (identical(other.reasonType, reasonType) ||
                other.reasonType == reasonType) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reasonType, count);

  /// Create a copy of AttractionVisitReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttractionVisitReasonModelImplCopyWith<_$AttractionVisitReasonModelImpl>
      get copyWith => __$$AttractionVisitReasonModelImplCopyWithImpl<
          _$AttractionVisitReasonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttractionVisitReasonModelImplToJson(
      this,
    );
  }
}

abstract class _AttractionVisitReasonModel
    implements AttractionVisitReasonModel {
  const factory _AttractionVisitReasonModel(
      {required final TravelVisitReasonType reasonType,
      required final int count}) = _$AttractionVisitReasonModelImpl;

  factory _AttractionVisitReasonModel.fromJson(Map<String, dynamic> json) =
      _$AttractionVisitReasonModelImpl.fromJson;

  @override
  TravelVisitReasonType get reasonType;
  @override
  int get count;

  /// Create a copy of AttractionVisitReasonModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttractionVisitReasonModelImplCopyWith<_$AttractionVisitReasonModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
