// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthSignInRequest _$AuthSignInRequestFromJson(Map<String, dynamic> json) {
  return _AuthSignInRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthSignInRequest {
  String get authorizationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthSignInRequestCopyWith<AuthSignInRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthSignInRequestCopyWith<$Res> {
  factory $AuthSignInRequestCopyWith(
          AuthSignInRequest value, $Res Function(AuthSignInRequest) then) =
      _$AuthSignInRequestCopyWithImpl<$Res, AuthSignInRequest>;
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class _$AuthSignInRequestCopyWithImpl<$Res, $Val extends AuthSignInRequest>
    implements $AuthSignInRequestCopyWith<$Res> {
  _$AuthSignInRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_value.copyWith(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthSignInRequestImplCopyWith<$Res>
    implements $AuthSignInRequestCopyWith<$Res> {
  factory _$$AuthSignInRequestImplCopyWith(_$AuthSignInRequestImpl value,
          $Res Function(_$AuthSignInRequestImpl) then) =
      __$$AuthSignInRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class __$$AuthSignInRequestImplCopyWithImpl<$Res>
    extends _$AuthSignInRequestCopyWithImpl<$Res, _$AuthSignInRequestImpl>
    implements _$$AuthSignInRequestImplCopyWith<$Res> {
  __$$AuthSignInRequestImplCopyWithImpl(_$AuthSignInRequestImpl _value,
      $Res Function(_$AuthSignInRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_$AuthSignInRequestImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthSignInRequestImpl implements _AuthSignInRequest {
  const _$AuthSignInRequestImpl({required this.authorizationCode});

  factory _$AuthSignInRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSignInRequestImplFromJson(json);

  @override
  final String authorizationCode;

  @override
  String toString() {
    return 'AuthSignInRequest(authorizationCode: $authorizationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInRequestImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorizationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignInRequestImplCopyWith<_$AuthSignInRequestImpl> get copyWith =>
      __$$AuthSignInRequestImplCopyWithImpl<_$AuthSignInRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSignInRequestImplToJson(
      this,
    );
  }
}

abstract class _AuthSignInRequest implements AuthSignInRequest {
  const factory _AuthSignInRequest({required final String authorizationCode}) =
      _$AuthSignInRequestImpl;

  factory _AuthSignInRequest.fromJson(Map<String, dynamic> json) =
      _$AuthSignInRequestImpl.fromJson;

  @override
  String get authorizationCode;
  @override
  @JsonKey(ignore: true)
  _$$AuthSignInRequestImplCopyWith<_$AuthSignInRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthDeleteRequest _$AuthDeleteRequestFromJson(Map<String, dynamic> json) {
  return _AuthDeleteRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthDeleteRequest {
  String get authorizationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthDeleteRequestCopyWith<AuthDeleteRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthDeleteRequestCopyWith<$Res> {
  factory $AuthDeleteRequestCopyWith(
          AuthDeleteRequest value, $Res Function(AuthDeleteRequest) then) =
      _$AuthDeleteRequestCopyWithImpl<$Res, AuthDeleteRequest>;
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class _$AuthDeleteRequestCopyWithImpl<$Res, $Val extends AuthDeleteRequest>
    implements $AuthDeleteRequestCopyWith<$Res> {
  _$AuthDeleteRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_value.copyWith(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthDeleteRequestImplCopyWith<$Res>
    implements $AuthDeleteRequestCopyWith<$Res> {
  factory _$$AuthDeleteRequestImplCopyWith(_$AuthDeleteRequestImpl value,
          $Res Function(_$AuthDeleteRequestImpl) then) =
      __$$AuthDeleteRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class __$$AuthDeleteRequestImplCopyWithImpl<$Res>
    extends _$AuthDeleteRequestCopyWithImpl<$Res, _$AuthDeleteRequestImpl>
    implements _$$AuthDeleteRequestImplCopyWith<$Res> {
  __$$AuthDeleteRequestImplCopyWithImpl(_$AuthDeleteRequestImpl _value,
      $Res Function(_$AuthDeleteRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_$AuthDeleteRequestImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthDeleteRequestImpl implements _AuthDeleteRequest {
  const _$AuthDeleteRequestImpl({required this.authorizationCode});

  factory _$AuthDeleteRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthDeleteRequestImplFromJson(json);

  @override
  final String authorizationCode;

  @override
  String toString() {
    return 'AuthDeleteRequest(authorizationCode: $authorizationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthDeleteRequestImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorizationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthDeleteRequestImplCopyWith<_$AuthDeleteRequestImpl> get copyWith =>
      __$$AuthDeleteRequestImplCopyWithImpl<_$AuthDeleteRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthDeleteRequestImplToJson(
      this,
    );
  }
}

abstract class _AuthDeleteRequest implements AuthDeleteRequest {
  const factory _AuthDeleteRequest({required final String authorizationCode}) =
      _$AuthDeleteRequestImpl;

  factory _AuthDeleteRequest.fromJson(Map<String, dynamic> json) =
      _$AuthDeleteRequestImpl.fromJson;

  @override
  String get authorizationCode;
  @override
  @JsonKey(ignore: true)
  _$$AuthDeleteRequestImplCopyWith<_$AuthDeleteRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthRenewRequest _$AuthRenewRequestFromJson(Map<String, dynamic> json) {
  return _AuthRenewRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthRenewRequest {
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthRenewRequestCopyWith<AuthRenewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthRenewRequestCopyWith<$Res> {
  factory $AuthRenewRequestCopyWith(
          AuthRenewRequest value, $Res Function(AuthRenewRequest) then) =
      _$AuthRenewRequestCopyWithImpl<$Res, AuthRenewRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$AuthRenewRequestCopyWithImpl<$Res, $Val extends AuthRenewRequest>
    implements $AuthRenewRequestCopyWith<$Res> {
  _$AuthRenewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthRenewRequestImplCopyWith<$Res>
    implements $AuthRenewRequestCopyWith<$Res> {
  factory _$$AuthRenewRequestImplCopyWith(_$AuthRenewRequestImpl value,
          $Res Function(_$AuthRenewRequestImpl) then) =
      __$$AuthRenewRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$AuthRenewRequestImplCopyWithImpl<$Res>
    extends _$AuthRenewRequestCopyWithImpl<$Res, _$AuthRenewRequestImpl>
    implements _$$AuthRenewRequestImplCopyWith<$Res> {
  __$$AuthRenewRequestImplCopyWithImpl(_$AuthRenewRequestImpl _value,
      $Res Function(_$AuthRenewRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$AuthRenewRequestImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthRenewRequestImpl implements _AuthRenewRequest {
  const _$AuthRenewRequestImpl({required this.refreshToken});

  factory _$AuthRenewRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthRenewRequestImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'AuthRenewRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthRenewRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthRenewRequestImplCopyWith<_$AuthRenewRequestImpl> get copyWith =>
      __$$AuthRenewRequestImplCopyWithImpl<_$AuthRenewRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthRenewRequestImplToJson(
      this,
    );
  }
}

abstract class _AuthRenewRequest implements AuthRenewRequest {
  const factory _AuthRenewRequest({required final String refreshToken}) =
      _$AuthRenewRequestImpl;

  factory _AuthRenewRequest.fromJson(Map<String, dynamic> json) =
      _$AuthRenewRequestImpl.fromJson;

  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$AuthRenewRequestImplCopyWith<_$AuthRenewRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
