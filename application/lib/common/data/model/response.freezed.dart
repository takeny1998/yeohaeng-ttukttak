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

ServerResponse<T> _$ServerResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['status']) {
    case 'success':
      return ServerSuccessResponse<T>.fromJson(json, fromJsonT);
    case 'fail':
      return ServerFailResponse<T>.fromJson(json, fromJsonT);
    case 'error':
      return ServerErrorResponse<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'status', 'ServerResponse',
          'Invalid union type "${json['status']}"!');
  }
}

/// @nodoc
mixin _$ServerResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String? message, Map<String, String>? data) fail,
    required TResult Function(String message, int? code) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String? message, Map<String, String>? data)? fail,
    TResult? Function(String message, int? code)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String? message, Map<String, String>? data)? fail,
    TResult Function(String message, int? code)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse<T> value) success,
    required TResult Function(ServerFailResponse<T> value) fail,
    required TResult Function(ServerErrorResponse<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse<T> value)? success,
    TResult? Function(ServerFailResponse<T> value)? fail,
    TResult? Function(ServerErrorResponse<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse<T> value)? success,
    TResult Function(ServerFailResponse<T> value)? fail,
    TResult Function(ServerErrorResponse<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ServerResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerResponseCopyWith<T, $Res> {
  factory $ServerResponseCopyWith(
          ServerResponse<T> value, $Res Function(ServerResponse<T>) then) =
      _$ServerResponseCopyWithImpl<T, $Res, ServerResponse<T>>;
}

/// @nodoc
class _$ServerResponseCopyWithImpl<T, $Res, $Val extends ServerResponse<T>>
    implements $ServerResponseCopyWith<T, $Res> {
  _$ServerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerSuccessResponseImplCopyWith<T, $Res> {
  factory _$$ServerSuccessResponseImplCopyWith(
          _$ServerSuccessResponseImpl<T> value,
          $Res Function(_$ServerSuccessResponseImpl<T>) then) =
      __$$ServerSuccessResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ServerSuccessResponseImplCopyWithImpl<T, $Res>
    extends _$ServerResponseCopyWithImpl<T, $Res,
        _$ServerSuccessResponseImpl<T>>
    implements _$$ServerSuccessResponseImplCopyWith<T, $Res> {
  __$$ServerSuccessResponseImplCopyWithImpl(
      _$ServerSuccessResponseImpl<T> _value,
      $Res Function(_$ServerSuccessResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
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
class _$ServerSuccessResponseImpl<T> implements ServerSuccessResponse<T> {
  const _$ServerSuccessResponseImpl({required this.data, final String? $type})
      : $type = $type ?? 'success';

  factory _$ServerSuccessResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ServerSuccessResponseImplFromJson(json, fromJsonT);

  @override
  final T data;

  @JsonKey(name: 'status')
  final String $type;

  @override
  String toString() {
    return 'ServerResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerSuccessResponseImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerSuccessResponseImplCopyWith<T, _$ServerSuccessResponseImpl<T>>
      get copyWith => __$$ServerSuccessResponseImplCopyWithImpl<T,
          _$ServerSuccessResponseImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String? message, Map<String, String>? data) fail,
    required TResult Function(String message, int? code) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String? message, Map<String, String>? data)? fail,
    TResult? Function(String message, int? code)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String? message, Map<String, String>? data)? fail,
    TResult Function(String message, int? code)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse<T> value) success,
    required TResult Function(ServerFailResponse<T> value) fail,
    required TResult Function(ServerErrorResponse<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse<T> value)? success,
    TResult? Function(ServerFailResponse<T> value)? fail,
    TResult? Function(ServerErrorResponse<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse<T> value)? success,
    TResult Function(ServerFailResponse<T> value)? fail,
    TResult Function(ServerErrorResponse<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ServerSuccessResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class ServerSuccessResponse<T> implements ServerResponse<T> {
  const factory ServerSuccessResponse({required final T data}) =
      _$ServerSuccessResponseImpl<T>;

  factory ServerSuccessResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ServerSuccessResponseImpl<T>.fromJson;

  T get data;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerSuccessResponseImplCopyWith<T, _$ServerSuccessResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailResponseImplCopyWith<T, $Res> {
  factory _$$ServerFailResponseImplCopyWith(_$ServerFailResponseImpl<T> value,
          $Res Function(_$ServerFailResponseImpl<T>) then) =
      __$$ServerFailResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? message, Map<String, String>? data});
}

/// @nodoc
class __$$ServerFailResponseImplCopyWithImpl<T, $Res>
    extends _$ServerResponseCopyWithImpl<T, $Res, _$ServerFailResponseImpl<T>>
    implements _$$ServerFailResponseImplCopyWith<T, $Res> {
  __$$ServerFailResponseImplCopyWithImpl(_$ServerFailResponseImpl<T> _value,
      $Res Function(_$ServerFailResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ServerFailResponseImpl<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ServerFailResponseImpl<T> implements ServerFailResponse<T> {
  const _$ServerFailResponseImpl(
      {this.message, final Map<String, String>? data, final String? $type})
      : _data = data,
        $type = $type ?? 'fail';

  factory _$ServerFailResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ServerFailResponseImplFromJson(json, fromJsonT);

  @override
  final String? message;
  final Map<String, String>? _data;
  @override
  Map<String, String>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @JsonKey(name: 'status')
  final String $type;

  @override
  String toString() {
    return 'ServerResponse<$T>.fail(message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailResponseImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailResponseImplCopyWith<T, _$ServerFailResponseImpl<T>>
      get copyWith => __$$ServerFailResponseImplCopyWithImpl<T,
          _$ServerFailResponseImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String? message, Map<String, String>? data) fail,
    required TResult Function(String message, int? code) error,
  }) {
    return fail(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String? message, Map<String, String>? data)? fail,
    TResult? Function(String message, int? code)? error,
  }) {
    return fail?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String? message, Map<String, String>? data)? fail,
    TResult Function(String message, int? code)? error,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse<T> value) success,
    required TResult Function(ServerFailResponse<T> value) fail,
    required TResult Function(ServerErrorResponse<T> value) error,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse<T> value)? success,
    TResult? Function(ServerFailResponse<T> value)? fail,
    TResult? Function(ServerErrorResponse<T> value)? error,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse<T> value)? success,
    TResult Function(ServerFailResponse<T> value)? fail,
    TResult Function(ServerErrorResponse<T> value)? error,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ServerFailResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class ServerFailResponse<T> implements ServerResponse<T> {
  const factory ServerFailResponse(
      {final String? message,
      final Map<String, String>? data}) = _$ServerFailResponseImpl<T>;

  factory ServerFailResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ServerFailResponseImpl<T>.fromJson;

  String? get message;
  Map<String, String>? get data;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailResponseImplCopyWith<T, _$ServerFailResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorResponseImplCopyWith<T, $Res> {
  factory _$$ServerErrorResponseImplCopyWith(_$ServerErrorResponseImpl<T> value,
          $Res Function(_$ServerErrorResponseImpl<T>) then) =
      __$$ServerErrorResponseImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message, int? code});
}

/// @nodoc
class __$$ServerErrorResponseImplCopyWithImpl<T, $Res>
    extends _$ServerResponseCopyWithImpl<T, $Res, _$ServerErrorResponseImpl<T>>
    implements _$$ServerErrorResponseImplCopyWith<T, $Res> {
  __$$ServerErrorResponseImplCopyWithImpl(_$ServerErrorResponseImpl<T> _value,
      $Res Function(_$ServerErrorResponseImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? code = freezed,
  }) {
    return _then(_$ServerErrorResponseImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ServerErrorResponseImpl<T> implements ServerErrorResponse<T> {
  const _$ServerErrorResponseImpl(
      {required this.message, this.code, final String? $type})
      : $type = $type ?? 'error';

  factory _$ServerErrorResponseImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ServerErrorResponseImplFromJson(json, fromJsonT);

  @override
  final String message;
  @override
  final int? code;

  @JsonKey(name: 'status')
  final String $type;

  @override
  String toString() {
    return 'ServerResponse<$T>.error(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorResponseImpl<T> &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorResponseImplCopyWith<T, _$ServerErrorResponseImpl<T>>
      get copyWith => __$$ServerErrorResponseImplCopyWithImpl<T,
          _$ServerErrorResponseImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String? message, Map<String, String>? data) fail,
    required TResult Function(String message, int? code) error,
  }) {
    return error(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? success,
    TResult? Function(String? message, Map<String, String>? data)? fail,
    TResult? Function(String message, int? code)? error,
  }) {
    return error?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String? message, Map<String, String>? data)? fail,
    TResult Function(String message, int? code)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse<T> value) success,
    required TResult Function(ServerFailResponse<T> value) fail,
    required TResult Function(ServerErrorResponse<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse<T> value)? success,
    TResult? Function(ServerFailResponse<T> value)? fail,
    TResult? Function(ServerErrorResponse<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse<T> value)? success,
    TResult Function(ServerFailResponse<T> value)? fail,
    TResult Function(ServerErrorResponse<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ServerErrorResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class ServerErrorResponse<T> implements ServerResponse<T> {
  const factory ServerErrorResponse(
      {required final String message,
      final int? code}) = _$ServerErrorResponseImpl<T>;

  factory ServerErrorResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ServerErrorResponseImpl<T>.fromJson;

  String get message;
  int? get code;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorResponseImplCopyWith<T, _$ServerErrorResponseImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
