// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Reference<T, R> {
  T get entity => throw _privateConstructorUsedError;
  R get reference => throw _privateConstructorUsedError;

  /// Create a copy of Reference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferenceCopyWith<T, R, Reference<T, R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferenceCopyWith<T, R, $Res> {
  factory $ReferenceCopyWith(
          Reference<T, R> value, $Res Function(Reference<T, R>) then) =
      _$ReferenceCopyWithImpl<T, R, $Res, Reference<T, R>>;
  @useResult
  $Res call({T entity, R reference});
}

/// @nodoc
class _$ReferenceCopyWithImpl<T, R, $Res, $Val extends Reference<T, R>>
    implements $ReferenceCopyWith<T, R, $Res> {
  _$ReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = freezed,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as R,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReferenceImplCopyWith<T, R, $Res>
    implements $ReferenceCopyWith<T, R, $Res> {
  factory _$$ReferenceImplCopyWith(_$ReferenceImpl<T, R> value,
          $Res Function(_$ReferenceImpl<T, R>) then) =
      __$$ReferenceImplCopyWithImpl<T, R, $Res>;
  @override
  @useResult
  $Res call({T entity, R reference});
}

/// @nodoc
class __$$ReferenceImplCopyWithImpl<T, R, $Res>
    extends _$ReferenceCopyWithImpl<T, R, $Res, _$ReferenceImpl<T, R>>
    implements _$$ReferenceImplCopyWith<T, R, $Res> {
  __$$ReferenceImplCopyWithImpl(
      _$ReferenceImpl<T, R> _value, $Res Function(_$ReferenceImpl<T, R>) _then)
      : super(_value, _then);

  /// Create a copy of Reference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = freezed,
    Object? reference = freezed,
  }) {
    return _then(_$ReferenceImpl<T, R>(
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as T,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$ReferenceImpl<T, R> implements _Reference<T, R> {
  const _$ReferenceImpl({required this.entity, required this.reference});

  @override
  final T entity;
  @override
  final R reference;

  @override
  String toString() {
    return 'Reference<$T, $R>(entity: $entity, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferenceImpl<T, R> &&
            const DeepCollectionEquality().equals(other.entity, entity) &&
            const DeepCollectionEquality().equals(other.reference, reference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entity),
      const DeepCollectionEquality().hash(reference));

  /// Create a copy of Reference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferenceImplCopyWith<T, R, _$ReferenceImpl<T, R>> get copyWith =>
      __$$ReferenceImplCopyWithImpl<T, R, _$ReferenceImpl<T, R>>(
          this, _$identity);
}

abstract class _Reference<T, R> implements Reference<T, R> {
  const factory _Reference(
      {required final T entity,
      required final R reference}) = _$ReferenceImpl<T, R>;

  @override
  T get entity;
  @override
  R get reference;

  /// Create a copy of Reference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferenceImplCopyWith<T, R, _$ReferenceImpl<T, R>> get copyWith =>
      throw _privateConstructorUsedError;
}
