// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_plan_comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TravelPlanCommentState {
  List<TravelPlanCommentModel> get comments =>
      throw _privateConstructorUsedError;
  Map<String, String> get fieldErrors => throw _privateConstructorUsedError;

  /// Create a copy of TravelPlanCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TravelPlanCommentStateCopyWith<TravelPlanCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPlanCommentStateCopyWith<$Res> {
  factory $TravelPlanCommentStateCopyWith(TravelPlanCommentState value,
          $Res Function(TravelPlanCommentState) then) =
      _$TravelPlanCommentStateCopyWithImpl<$Res, TravelPlanCommentState>;
  @useResult
  $Res call(
      {List<TravelPlanCommentModel> comments, Map<String, String> fieldErrors});
}

/// @nodoc
class _$TravelPlanCommentStateCopyWithImpl<$Res,
        $Val extends TravelPlanCommentState>
    implements $TravelPlanCommentStateCopyWith<$Res> {
  _$TravelPlanCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TravelPlanCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? fieldErrors = null,
  }) {
    return _then(_value.copyWith(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<TravelPlanCommentModel>,
      fieldErrors: null == fieldErrors
          ? _value.fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelPlanCommentStateImplCopyWith<$Res>
    implements $TravelPlanCommentStateCopyWith<$Res> {
  factory _$$TravelPlanCommentStateImplCopyWith(
          _$TravelPlanCommentStateImpl value,
          $Res Function(_$TravelPlanCommentStateImpl) then) =
      __$$TravelPlanCommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TravelPlanCommentModel> comments, Map<String, String> fieldErrors});
}

/// @nodoc
class __$$TravelPlanCommentStateImplCopyWithImpl<$Res>
    extends _$TravelPlanCommentStateCopyWithImpl<$Res,
        _$TravelPlanCommentStateImpl>
    implements _$$TravelPlanCommentStateImplCopyWith<$Res> {
  __$$TravelPlanCommentStateImplCopyWithImpl(
      _$TravelPlanCommentStateImpl _value,
      $Res Function(_$TravelPlanCommentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TravelPlanCommentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? fieldErrors = null,
  }) {
    return _then(_$TravelPlanCommentStateImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<TravelPlanCommentModel>,
      fieldErrors: null == fieldErrors
          ? _value._fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$TravelPlanCommentStateImpl implements _TravelPlanCommentState {
  const _$TravelPlanCommentStateImpl(
      {final List<TravelPlanCommentModel> comments = const [],
      final Map<String, String> fieldErrors = const {}})
      : _comments = comments,
        _fieldErrors = fieldErrors;

  final List<TravelPlanCommentModel> _comments;
  @override
  @JsonKey()
  List<TravelPlanCommentModel> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final Map<String, String> _fieldErrors;
  @override
  @JsonKey()
  Map<String, String> get fieldErrors {
    if (_fieldErrors is EqualUnmodifiableMapView) return _fieldErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fieldErrors);
  }

  @override
  String toString() {
    return 'TravelPlanCommentState(comments: $comments, fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelPlanCommentStateImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality()
                .equals(other._fieldErrors, _fieldErrors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_fieldErrors));

  /// Create a copy of TravelPlanCommentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelPlanCommentStateImplCopyWith<_$TravelPlanCommentStateImpl>
      get copyWith => __$$TravelPlanCommentStateImplCopyWithImpl<
          _$TravelPlanCommentStateImpl>(this, _$identity);
}

abstract class _TravelPlanCommentState implements TravelPlanCommentState {
  const factory _TravelPlanCommentState(
      {final List<TravelPlanCommentModel> comments,
      final Map<String, String> fieldErrors}) = _$TravelPlanCommentStateImpl;

  @override
  List<TravelPlanCommentModel> get comments;
  @override
  Map<String, String> get fieldErrors;

  /// Create a copy of TravelPlanCommentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TravelPlanCommentStateImplCopyWith<_$TravelPlanCommentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
