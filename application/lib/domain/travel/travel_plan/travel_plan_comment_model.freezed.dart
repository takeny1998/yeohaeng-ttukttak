// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelPlanCommentModel _$TravelPlanCommentModelFromJson(
    Map<String, dynamic> json) {
  return _TravelPlanCommentModel.fromJson(json);
}

/// @nodoc
mixin _$TravelPlanCommentModel {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastModifiedAt => throw _privateConstructorUsedError;

  /// Serializes this TravelPlanCommentModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanCommentModelCopyWith<TravelPlanCommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanCommentModelCopyWith<$Res> {
  factory $TravelPlanCommentModelCopyWith(TravelPlanCommentModel value,
          $Res Function(TravelPlanCommentModel) then) =
      _$TravelPlanCommentModelCopyWithImpl<$Res, TravelPlanCommentModel>;
  @useResult
  $Res call(
      {int id,
      String content,
      String createdBy,
      DateTime createdAt,
      DateTime lastModifiedAt});
}

/// @nodoc
class _$TravelPlanCommentModelCopyWithImpl<$Res,
        $Val extends TravelPlanCommentModel>
    implements $TravelPlanCommentModelCopyWith<$Res> {
  _$TravelPlanCommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? lastModifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelPlanCommentModelImplCopyWith<$Res>
    implements $TravelPlanCommentModelCopyWith<$Res> {
  factory _$$TravelPlanCommentModelImplCopyWith(
          _$TravelPlanCommentModelImpl value,
          $Res Function(_$TravelPlanCommentModelImpl) then) =
      __$$TravelPlanCommentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      String createdBy,
      DateTime createdAt,
      DateTime lastModifiedAt});
}

/// @nodoc
class __$$TravelPlanCommentModelImplCopyWithImpl<$Res>
    extends _$TravelPlanCommentModelCopyWithImpl<$Res,
        _$TravelPlanCommentModelImpl>
    implements _$$TravelPlanCommentModelImplCopyWith<$Res> {
  __$$TravelPlanCommentModelImplCopyWithImpl(
      _$TravelPlanCommentModelImpl _value,
      $Res Function(_$TravelPlanCommentModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? createdBy = null,
    Object? createdAt = null,
    Object? lastModifiedAt = null,
  }) {
    return _then(_$TravelPlanCommentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModifiedAt: null == lastModifiedAt
          ? _value.lastModifiedAt
          : lastModifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelPlanCommentModelImpl implements _TravelPlanCommentModel {
  const _$TravelPlanCommentModelImpl(
      {required this.id,
      required this.content,
      required this.createdBy,
      required this.createdAt,
      required this.lastModifiedAt});

  factory _$TravelPlanCommentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelPlanCommentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  final String createdBy;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastModifiedAt;

  @override
  String toString() {
    return 'TravelPlanCommentModel(id: $id, content: $content, createdBy: $createdBy, createdAt: $createdAt, lastModifiedAt: $lastModifiedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanCommentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastModifiedAt, lastModifiedAt) ||
                other.lastModifiedAt == lastModifiedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, content, createdBy, createdAt, lastModifiedAt);

  /// Create a copy of TravelPlanCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanCommentModelImplCopyWith<_$TravelPlanCommentModelImpl>
      get copyWith => __$$TravelPlanCommentModelImplCopyWithImpl<
          _$TravelPlanCommentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelPlanCommentModelImplToJson(
      this,
    );
  }
}

abstract class _TravelPlanCommentModel implements TravelPlanCommentModel {
  const factory _TravelPlanCommentModel(
      {required final int id,
      required final String content,
      required final String createdBy,
      required final DateTime createdAt,
      required final DateTime lastModifiedAt}) = _$TravelPlanCommentModelImpl;

  factory _TravelPlanCommentModel.fromJson(Map<String, dynamic> json) =
      _$TravelPlanCommentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get content;
  @override
  String get createdBy;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastModifiedAt;

  /// Create a copy of TravelPlanCommentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanCommentModelImplCopyWith<_$TravelPlanCommentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
