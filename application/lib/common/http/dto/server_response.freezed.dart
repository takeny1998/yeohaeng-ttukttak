// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServerResponse _$ServerResponseFromJson(Map<String, dynamic> json) {
  switch (json['status']) {
    case 'success':
      return ServerSuccessResponse.fromJson(json);
    case 'fail':
      return ServerFailResponse.fromJson(json);
    case 'error':
      return ServerErrorResponse.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'status', 'ServerResponse',
          'Invalid union type "${json['status']}"!');
  }
}

/// @nodoc
mixin _$ServerResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) success,
    required TResult Function(Map<String, dynamic> data) fail,
    required TResult Function(String code, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? success,
    TResult? Function(Map<String, dynamic> data)? fail,
    TResult? Function(String code, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? success,
    TResult Function(Map<String, dynamic> data)? fail,
    TResult Function(String code, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse value) success,
    required TResult Function(ServerFailResponse value) fail,
    required TResult Function(ServerErrorResponse value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse value)? success,
    TResult? Function(ServerFailResponse value)? fail,
    TResult? Function(ServerErrorResponse value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse value)? success,
    TResult Function(ServerFailResponse value)? fail,
    TResult Function(ServerErrorResponse value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ServerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerResponseCopyWith<$Res> {
  factory $ServerResponseCopyWith(
          ServerResponse value, $Res Function(ServerResponse) then) =
      _$ServerResponseCopyWithImpl<$Res, ServerResponse>;
}

/// @nodoc
class _$ServerResponseCopyWithImpl<$Res, $Val extends ServerResponse>
    implements $ServerResponseCopyWith<$Res> {
  _$ServerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerSuccessResponseImplCopyWith<$Res> {
  factory _$$ServerSuccessResponseImplCopyWith(
          _$ServerSuccessResponseImpl value,
          $Res Function(_$ServerSuccessResponseImpl) then) =
      __$$ServerSuccessResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$ServerSuccessResponseImplCopyWithImpl<$Res>
    extends _$ServerResponseCopyWithImpl<$Res, _$ServerSuccessResponseImpl>
    implements _$$ServerSuccessResponseImplCopyWith<$Res> {
  __$$ServerSuccessResponseImplCopyWithImpl(_$ServerSuccessResponseImpl _value,
      $Res Function(_$ServerSuccessResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ServerSuccessResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerSuccessResponseImpl implements ServerSuccessResponse {
  const _$ServerSuccessResponseImpl(
      {final Map<String, dynamic> data = const {}, final String? $type})
      : _data = data,
        $type = $type ?? 'success';

  factory _$ServerSuccessResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerSuccessResponseImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'status')
  final String $type;

  @override
  String toString() {
    return 'ServerResponse.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerSuccessResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerSuccessResponseImplCopyWith<_$ServerSuccessResponseImpl>
      get copyWith => __$$ServerSuccessResponseImplCopyWithImpl<
          _$ServerSuccessResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) success,
    required TResult Function(Map<String, dynamic> data) fail,
    required TResult Function(String code, String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? success,
    TResult? Function(Map<String, dynamic> data)? fail,
    TResult? Function(String code, String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? success,
    TResult Function(Map<String, dynamic> data)? fail,
    TResult Function(String code, String message)? error,
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
    required TResult Function(ServerSuccessResponse value) success,
    required TResult Function(ServerFailResponse value) fail,
    required TResult Function(ServerErrorResponse value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse value)? success,
    TResult? Function(ServerFailResponse value)? fail,
    TResult? Function(ServerErrorResponse value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse value)? success,
    TResult Function(ServerFailResponse value)? fail,
    TResult Function(ServerErrorResponse value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerSuccessResponseImplToJson(
      this,
    );
  }
}

abstract class ServerSuccessResponse implements ServerResponse {
  const factory ServerSuccessResponse({final Map<String, dynamic> data}) =
      _$ServerSuccessResponseImpl;

  factory ServerSuccessResponse.fromJson(Map<String, dynamic> json) =
      _$ServerSuccessResponseImpl.fromJson;

  Map<String, dynamic> get data;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerSuccessResponseImplCopyWith<_$ServerSuccessResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailResponseImplCopyWith<$Res> {
  factory _$$ServerFailResponseImplCopyWith(_$ServerFailResponseImpl value,
          $Res Function(_$ServerFailResponseImpl) then) =
      __$$ServerFailResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$ServerFailResponseImplCopyWithImpl<$Res>
    extends _$ServerResponseCopyWithImpl<$Res, _$ServerFailResponseImpl>
    implements _$$ServerFailResponseImplCopyWith<$Res> {
  __$$ServerFailResponseImplCopyWithImpl(_$ServerFailResponseImpl _value,
      $Res Function(_$ServerFailResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ServerFailResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerFailResponseImpl implements ServerFailResponse {
  const _$ServerFailResponseImpl(
      {final Map<String, dynamic> data = const {}, final String? $type})
      : _data = data,
        $type = $type ?? 'fail';

  factory _$ServerFailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerFailResponseImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @JsonKey(name: 'status')
  final String $type;

  @override
  String toString() {
    return 'ServerResponse.fail(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailResponseImplCopyWith<_$ServerFailResponseImpl> get copyWith =>
      __$$ServerFailResponseImplCopyWithImpl<_$ServerFailResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) success,
    required TResult Function(Map<String, dynamic> data) fail,
    required TResult Function(String code, String message) error,
  }) {
    return fail(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? success,
    TResult? Function(Map<String, dynamic> data)? fail,
    TResult? Function(String code, String message)? error,
  }) {
    return fail?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? success,
    TResult Function(Map<String, dynamic> data)? fail,
    TResult Function(String code, String message)? error,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse value) success,
    required TResult Function(ServerFailResponse value) fail,
    required TResult Function(ServerErrorResponse value) error,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse value)? success,
    TResult? Function(ServerFailResponse value)? fail,
    TResult? Function(ServerErrorResponse value)? error,
  }) {
    return fail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse value)? success,
    TResult Function(ServerFailResponse value)? fail,
    TResult Function(ServerErrorResponse value)? error,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerFailResponseImplToJson(
      this,
    );
  }
}

abstract class ServerFailResponse implements ServerResponse {
  const factory ServerFailResponse({final Map<String, dynamic> data}) =
      _$ServerFailResponseImpl;

  factory ServerFailResponse.fromJson(Map<String, dynamic> json) =
      _$ServerFailResponseImpl.fromJson;

  Map<String, dynamic> get data;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailResponseImplCopyWith<_$ServerFailResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorResponseImplCopyWith<$Res> {
  factory _$$ServerErrorResponseImplCopyWith(_$ServerErrorResponseImpl value,
          $Res Function(_$ServerErrorResponseImpl) then) =
      __$$ServerErrorResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class __$$ServerErrorResponseImplCopyWithImpl<$Res>
    extends _$ServerResponseCopyWithImpl<$Res, _$ServerErrorResponseImpl>
    implements _$$ServerErrorResponseImplCopyWith<$Res> {
  __$$ServerErrorResponseImplCopyWithImpl(_$ServerErrorResponseImpl _value,
      $Res Function(_$ServerErrorResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServerErrorResponseImpl implements ServerErrorResponse {
  const _$ServerErrorResponseImpl(
      {required this.code, required this.message, final String? $type})
      : $type = $type ?? 'error';

  factory _$ServerErrorResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServerErrorResponseImplFromJson(json);

  @override
  final String code;
  @override
  final String message;

  @JsonKey(name: 'status')
  final String $type;

  @override
  String toString() {
    return 'ServerResponse.error(code: $code, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorResponseImplCopyWith<_$ServerErrorResponseImpl> get copyWith =>
      __$$ServerErrorResponseImplCopyWithImpl<_$ServerErrorResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> data) success,
    required TResult Function(Map<String, dynamic> data) fail,
    required TResult Function(String code, String message) error,
  }) {
    return error(code, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data)? success,
    TResult? Function(Map<String, dynamic> data)? fail,
    TResult? Function(String code, String message)? error,
  }) {
    return error?.call(code, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data)? success,
    TResult Function(Map<String, dynamic> data)? fail,
    TResult Function(String code, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(code, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerSuccessResponse value) success,
    required TResult Function(ServerFailResponse value) fail,
    required TResult Function(ServerErrorResponse value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerSuccessResponse value)? success,
    TResult? Function(ServerFailResponse value)? fail,
    TResult? Function(ServerErrorResponse value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerSuccessResponse value)? success,
    TResult Function(ServerFailResponse value)? fail,
    TResult Function(ServerErrorResponse value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ServerErrorResponseImplToJson(
      this,
    );
  }
}

abstract class ServerErrorResponse implements ServerResponse {
  const factory ServerErrorResponse(
      {required final String code,
      required final String message}) = _$ServerErrorResponseImpl;

  factory ServerErrorResponse.fromJson(Map<String, dynamic> json) =
      _$ServerErrorResponseImpl.fromJson;

  String get code;
  String get message;

  /// Create a copy of ServerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorResponseImplCopyWith<_$ServerErrorResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
