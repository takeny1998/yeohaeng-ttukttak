// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerSuccessResponse<T> _$ServerSuccessResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ServerSuccessResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ServerSuccessResponse<T> {
  T get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerSuccessResponseCopyWith<T, ServerSuccessResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerSuccessResponseCopyWith<T, $Res> {
  factory $ServerSuccessResponseCopyWith(ServerSuccessResponse<T> value,
          $Res Function(ServerSuccessResponse<T>) then) =
      _$ServerSuccessResponseCopyWithImpl<T, $Res, ServerSuccessResponse<T>>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class _$ServerSuccessResponseCopyWithImpl<T, $Res,
        $Val extends ServerSuccessResponse<T>>
    implements $ServerSuccessResponseCopyWith<T, $Res> {
  _$ServerSuccessResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerSuccessResponseImplCopyWith<T, $Res>
    implements $ServerSuccessResponseCopyWith<T, $Res> {
  factory _$$ServerSuccessResponseImplCopyWith(
          _$ServerSuccessResponseImpl<T> value,
          $Res Function(_$ServerSuccessResponseImpl<T>) then) =
      __$$ServerSuccessResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ServerSuccessResponseImplCopyWithImpl<T, $Res>
    extends _$ServerSuccessResponseCopyWithImpl<T, $Res,
        _$ServerSuccessResponseImpl<T>>
    implements _$$ServerSuccessResponseImplCopyWith<T, $Res> {
  __$$ServerSuccessResponseImplCopyWithImpl(
      _$ServerSuccessResponseImpl<T> _value,
      $Res Function(_$ServerSuccessResponseImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ServerSuccessResponseImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ServerSuccessResponseImpl<T> implements _ServerSuccessResponse<T> {
  const _$ServerSuccessResponseImpl({required this.data});

  factory _$ServerSuccessResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ServerSuccessResponseImplFromJson(json, fromJsonT);

  @override
  final T data;

  @override
  String toString() {
    return 'ServerSuccessResponse<$T>(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerSuccessResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerSuccessResponseImplCopyWith<T, _$ServerSuccessResponseImpl<T>>
      get copyWith => __$$ServerSuccessResponseImplCopyWithImpl<T,
          _$ServerSuccessResponseImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ServerSuccessResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ServerSuccessResponse<T> implements ServerSuccessResponse<T> {
  const factory _ServerSuccessResponse({required final T data}) =
      _$ServerSuccessResponseImpl<T>;

  factory _ServerSuccessResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ServerSuccessResponseImpl<T>.fromJson;

  @override
  T get data;
  @override
  @JsonKey(ignore: true)
  _$$ServerSuccessResponseImplCopyWith<T, _$ServerSuccessResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

ServerErrorResponse _$ServerErrorResponseFromJson(Map<String, dynamic> json) {
  return _ServerErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$ServerErrorResponse {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServerErrorResponseCopyWith<ServerErrorResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerErrorResponseCopyWith<$Res> {
  factory $ServerErrorResponseCopyWith(
          ServerErrorResponse value, $Res Function(ServerErrorResponse) then) =
      _$ServerErrorResponseCopyWithImpl<$Res, ServerErrorResponse>;
  @useResult
  $Res call({String code, String message, String? target});
}

/// @nodoc
class _$ServerErrorResponseCopyWithImpl<$Res, $Val extends ServerErrorResponse>
    implements $ServerErrorResponseCopyWith<$Res> {
  _$ServerErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? target = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerErrorResponseImplCopyWith<$Res>
    implements $ServerErrorResponseCopyWith<$Res> {
  factory _$$ServerErrorResponseImplCopyWith(_$ServerErrorResponseImpl value,
          $Res Function(_$ServerErrorResponseImpl) then) =
      __$$ServerErrorResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message, String? target});
}

/// @nodoc
class __$$ServerErrorResponseImplCopyWithImpl<$Res>
    extends _$ServerErrorResponseCopyWithImpl<$Res, _$ServerErrorResponseImpl>
    implements _$$ServerErrorResponseImplCopyWith<$Res> {
  __$$ServerErrorResponseImplCopyWithImpl(_$ServerErrorResponseImpl _value,
      $Res Function(_$ServerErrorResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? target = freezed,
  }) {
    return _then(_$ServerErrorResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      target: freezed == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerErrorResponseImpl implements _ServerErrorResponse {
  const _$ServerErrorResponseImpl(
      {required this.code, required this.message, this.target});

  factory _$ServerErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerErrorResponseImplFromJson(json);

  @override
  final String code;
  @override
  final String message;
  @override
  final String? target;

  @override
  String toString() {
    return 'ServerErrorResponse(code: $code, message: $message, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorResponseImplCopyWith<_$ServerErrorResponseImpl> get copyWith =>
      __$$ServerErrorResponseImplCopyWithImpl<_$ServerErrorResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerErrorResponseImplToJson(
      this,
    );
  }
}

abstract class _ServerErrorResponse implements ServerErrorResponse {
  const factory _ServerErrorResponse(
      {required final String code,
      required final String message,
      final String? target}) = _$ServerErrorResponseImpl;

  factory _ServerErrorResponse.fromJson(Map<String, dynamic> json) =
      _$ServerErrorResponseImpl.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  String? get target;
  @override
  @JsonKey(ignore: true)
  _$$ServerErrorResponseImplCopyWith<_$ServerErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
