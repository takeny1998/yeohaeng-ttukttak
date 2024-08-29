// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OAuthRegisterResponse _$OAuthRegisterResponseFromJson(
    Map<String, dynamic> json) {
  return _OAuthRegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$OAuthRegisterResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OAuthRegisterResponseCopyWith<OAuthRegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuthRegisterResponseCopyWith<$Res> {
  factory $OAuthRegisterResponseCopyWith(OAuthRegisterResponse value,
          $Res Function(OAuthRegisterResponse) then) =
      _$OAuthRegisterResponseCopyWithImpl<$Res, OAuthRegisterResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$OAuthRegisterResponseCopyWithImpl<$Res,
        $Val extends OAuthRegisterResponse>
    implements $OAuthRegisterResponseCopyWith<$Res> {
  _$OAuthRegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OAuthRegisterResponseImplCopyWith<$Res>
    implements $OAuthRegisterResponseCopyWith<$Res> {
  factory _$$OAuthRegisterResponseImplCopyWith(
          _$OAuthRegisterResponseImpl value,
          $Res Function(_$OAuthRegisterResponseImpl) then) =
      __$$OAuthRegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$OAuthRegisterResponseImplCopyWithImpl<$Res>
    extends _$OAuthRegisterResponseCopyWithImpl<$Res,
        _$OAuthRegisterResponseImpl>
    implements _$$OAuthRegisterResponseImplCopyWith<$Res> {
  __$$OAuthRegisterResponseImplCopyWithImpl(_$OAuthRegisterResponseImpl _value,
      $Res Function(_$OAuthRegisterResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$OAuthRegisterResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OAuthRegisterResponseImpl implements _OAuthRegisterResponse {
  const _$OAuthRegisterResponseImpl(
      {required this.accessToken, required this.refreshToken});

  factory _$OAuthRegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OAuthRegisterResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'OAuthRegisterResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuthRegisterResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuthRegisterResponseImplCopyWith<_$OAuthRegisterResponseImpl>
      get copyWith => __$$OAuthRegisterResponseImplCopyWithImpl<
          _$OAuthRegisterResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OAuthRegisterResponseImplToJson(
      this,
    );
  }
}

abstract class _OAuthRegisterResponse implements OAuthRegisterResponse {
  const factory _OAuthRegisterResponse(
      {required final String accessToken,
      required final String refreshToken}) = _$OAuthRegisterResponseImpl;

  factory _OAuthRegisterResponse.fromJson(Map<String, dynamic> json) =
      _$OAuthRegisterResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$OAuthRegisterResponseImplCopyWith<_$OAuthRegisterResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
