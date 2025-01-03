// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'infinite_scroll_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfiniteScrollModel<T> _$InfiniteScrollModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _InfiniteScrollModel<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$InfiniteScrollModel<T> {
  List<T> get records => throw _privateConstructorUsedError;
  @JsonKey(name: '_metadata')
  InfiniteScrollMetadata get metadata => throw _privateConstructorUsedError;

  /// Serializes this InfiniteScrollModel to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of InfiniteScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfiniteScrollModelCopyWith<T, InfiniteScrollModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteScrollModelCopyWith<T, $Res> {
  factory $InfiniteScrollModelCopyWith(InfiniteScrollModel<T> value,
          $Res Function(InfiniteScrollModel<T>) then) =
      _$InfiniteScrollModelCopyWithImpl<T, $Res, InfiniteScrollModel<T>>;
  @useResult
  $Res call(
      {List<T> records,
      @JsonKey(name: '_metadata') InfiniteScrollMetadata metadata});

  $InfiniteScrollMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$InfiniteScrollModelCopyWithImpl<T, $Res,
        $Val extends InfiniteScrollModel<T>>
    implements $InfiniteScrollModelCopyWith<T, $Res> {
  _$InfiniteScrollModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfiniteScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? metadata = null,
  }) {
    return _then(_value.copyWith(
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<T>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as InfiniteScrollMetadata,
    ) as $Val);
  }

  /// Create a copy of InfiniteScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfiniteScrollMetadataCopyWith<$Res> get metadata {
    return $InfiniteScrollMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InfiniteScrollModelImplCopyWith<T, $Res>
    implements $InfiniteScrollModelCopyWith<T, $Res> {
  factory _$$InfiniteScrollModelImplCopyWith(_$InfiniteScrollModelImpl<T> value,
          $Res Function(_$InfiniteScrollModelImpl<T>) then) =
      __$$InfiniteScrollModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> records,
      @JsonKey(name: '_metadata') InfiniteScrollMetadata metadata});

  @override
  $InfiniteScrollMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$InfiniteScrollModelImplCopyWithImpl<T, $Res>
    extends _$InfiniteScrollModelCopyWithImpl<T, $Res,
        _$InfiniteScrollModelImpl<T>>
    implements _$$InfiniteScrollModelImplCopyWith<T, $Res> {
  __$$InfiniteScrollModelImplCopyWithImpl(_$InfiniteScrollModelImpl<T> _value,
      $Res Function(_$InfiniteScrollModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of InfiniteScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? metadata = null,
  }) {
    return _then(_$InfiniteScrollModelImpl<T>(
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<T>,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as InfiniteScrollMetadata,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$InfiniteScrollModelImpl<T> implements _InfiniteScrollModel<T> {
  const _$InfiniteScrollModelImpl(
      {required final List<T> records,
      @JsonKey(name: '_metadata') required this.metadata})
      : _records = records;

  factory _$InfiniteScrollModelImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$InfiniteScrollModelImplFromJson(json, fromJsonT);

  final List<T> _records;
  @override
  List<T> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  @JsonKey(name: '_metadata')
  final InfiniteScrollMetadata metadata;

  @override
  String toString() {
    return 'InfiniteScrollModel<$T>(records: $records, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteScrollModelImpl<T> &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_records), metadata);

  /// Create a copy of InfiniteScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfiniteScrollModelImplCopyWith<T, _$InfiniteScrollModelImpl<T>>
      get copyWith => __$$InfiniteScrollModelImplCopyWithImpl<T,
          _$InfiniteScrollModelImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$InfiniteScrollModelImplToJson<T>(this, toJsonT);
  }
}

abstract class _InfiniteScrollModel<T> implements InfiniteScrollModel<T> {
  const factory _InfiniteScrollModel(
          {required final List<T> records,
          @JsonKey(name: '_metadata')
          required final InfiniteScrollMetadata metadata}) =
      _$InfiniteScrollModelImpl<T>;

  factory _InfiniteScrollModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$InfiniteScrollModelImpl<T>.fromJson;

  @override
  List<T> get records;
  @override
  @JsonKey(name: '_metadata')
  InfiniteScrollMetadata get metadata;

  /// Create a copy of InfiniteScrollModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfiniteScrollModelImplCopyWith<T, _$InfiniteScrollModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

InfiniteScrollMetadata _$InfiniteScrollMetadataFromJson(
    Map<String, dynamic> json) {
  return _InfiniteScrollMetadata.fromJson(json);
}

/// @nodoc
mixin _$InfiniteScrollMetadata {
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  /// Serializes this InfiniteScrollMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfiniteScrollMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfiniteScrollMetadataCopyWith<InfiniteScrollMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfiniteScrollMetadataCopyWith<$Res> {
  factory $InfiniteScrollMetadataCopyWith(InfiniteScrollMetadata value,
          $Res Function(InfiniteScrollMetadata) then) =
      _$InfiniteScrollMetadataCopyWithImpl<$Res, InfiniteScrollMetadata>;
  @useResult
  $Res call({int pageNumber, int pageSize, bool hasNext});
}

/// @nodoc
class _$InfiniteScrollMetadataCopyWithImpl<$Res,
        $Val extends InfiniteScrollMetadata>
    implements $InfiniteScrollMetadataCopyWith<$Res> {
  _$InfiniteScrollMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfiniteScrollMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfiniteScrollMetadataImplCopyWith<$Res>
    implements $InfiniteScrollMetadataCopyWith<$Res> {
  factory _$$InfiniteScrollMetadataImplCopyWith(
          _$InfiniteScrollMetadataImpl value,
          $Res Function(_$InfiniteScrollMetadataImpl) then) =
      __$$InfiniteScrollMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageNumber, int pageSize, bool hasNext});
}

/// @nodoc
class __$$InfiniteScrollMetadataImplCopyWithImpl<$Res>
    extends _$InfiniteScrollMetadataCopyWithImpl<$Res,
        _$InfiniteScrollMetadataImpl>
    implements _$$InfiniteScrollMetadataImplCopyWith<$Res> {
  __$$InfiniteScrollMetadataImplCopyWithImpl(
      _$InfiniteScrollMetadataImpl _value,
      $Res Function(_$InfiniteScrollMetadataImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfiniteScrollMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? hasNext = null,
  }) {
    return _then(_$InfiniteScrollMetadataImpl(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfiniteScrollMetadataImpl implements _InfiniteScrollMetadata {
  const _$InfiniteScrollMetadataImpl(
      {required this.pageNumber,
      required this.pageSize,
      required this.hasNext});

  factory _$InfiniteScrollMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfiniteScrollMetadataImplFromJson(json);

  @override
  final int pageNumber;
  @override
  final int pageSize;
  @override
  final bool hasNext;

  @override
  String toString() {
    return 'InfiniteScrollMetadata(pageNumber: $pageNumber, pageSize: $pageSize, hasNext: $hasNext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfiniteScrollMetadataImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, pageSize, hasNext);

  /// Create a copy of InfiniteScrollMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfiniteScrollMetadataImplCopyWith<_$InfiniteScrollMetadataImpl>
      get copyWith => __$$InfiniteScrollMetadataImplCopyWithImpl<
          _$InfiniteScrollMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfiniteScrollMetadataImplToJson(
      this,
    );
  }
}

abstract class _InfiniteScrollMetadata implements InfiniteScrollMetadata {
  const factory _InfiniteScrollMetadata(
      {required final int pageNumber,
      required final int pageSize,
      required final bool hasNext}) = _$InfiniteScrollMetadataImpl;

  factory _InfiniteScrollMetadata.fromJson(Map<String, dynamic> json) =
      _$InfiniteScrollMetadataImpl.fromJson;

  @override
  int get pageNumber;
  @override
  int get pageSize;
  @override
  bool get hasNext;

  /// Create a copy of InfiniteScrollMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfiniteScrollMetadataImplCopyWith<_$InfiniteScrollMetadataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
