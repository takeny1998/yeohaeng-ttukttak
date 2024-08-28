// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_redirect_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OAuthRedirectResponse _$OAuthRedirectResponseFromJson(
    Map<String, dynamic> json) {
  return _OAuthRedirectResponse.fromJson(json);
}

/// @nodoc
mixin _$OAuthRedirectResponse {
  String get redirectUri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OAuthRedirectResponseCopyWith<OAuthRedirectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuthRedirectResponseCopyWith<$Res> {
  factory $OAuthRedirectResponseCopyWith(OAuthRedirectResponse value,
          $Res Function(OAuthRedirectResponse) then) =
      _$OAuthRedirectResponseCopyWithImpl<$Res, OAuthRedirectResponse>;
  @useResult
  $Res call({String redirectUri});
}

/// @nodoc
class _$OAuthRedirectResponseCopyWithImpl<$Res,
        $Val extends OAuthRedirectResponse>
    implements $OAuthRedirectResponseCopyWith<$Res> {
  _$OAuthRedirectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirectUri = null,
  }) {
    return _then(_value.copyWith(
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OAuthRedirectResponseImplCopyWith<$Res>
    implements $OAuthRedirectResponseCopyWith<$Res> {
  factory _$$OAuthRedirectResponseImplCopyWith(
          _$OAuthRedirectResponseImpl value,
          $Res Function(_$OAuthRedirectResponseImpl) then) =
      __$$OAuthRedirectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String redirectUri});
}

/// @nodoc
class __$$OAuthRedirectResponseImplCopyWithImpl<$Res>
    extends _$OAuthRedirectResponseCopyWithImpl<$Res,
        _$OAuthRedirectResponseImpl>
    implements _$$OAuthRedirectResponseImplCopyWith<$Res> {
  __$$OAuthRedirectResponseImplCopyWithImpl(_$OAuthRedirectResponseImpl _value,
      $Res Function(_$OAuthRedirectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? redirectUri = null,
  }) {
    return _then(_$OAuthRedirectResponseImpl(
      redirectUri: null == redirectUri
          ? _value.redirectUri
          : redirectUri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OAuthRedirectResponseImpl implements _OAuthRedirectResponse {
  const _$OAuthRedirectResponseImpl({required this.redirectUri});

  factory _$OAuthRedirectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OAuthRedirectResponseImplFromJson(json);

  @override
  final String redirectUri;

  @override
  String toString() {
    return 'OAuthRedirectResponse(redirectUri: $redirectUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuthRedirectResponseImpl &&
            (identical(other.redirectUri, redirectUri) ||
                other.redirectUri == redirectUri));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, redirectUri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuthRedirectResponseImplCopyWith<_$OAuthRedirectResponseImpl>
      get copyWith => __$$OAuthRedirectResponseImplCopyWithImpl<
          _$OAuthRedirectResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OAuthRedirectResponseImplToJson(
      this,
    );
  }
}

abstract class _OAuthRedirectResponse implements OAuthRedirectResponse {
  const factory _OAuthRedirectResponse({required final String redirectUri}) =
      _$OAuthRedirectResponseImpl;

  factory _OAuthRedirectResponse.fromJson(Map<String, dynamic> json) =
      _$OAuthRedirectResponseImpl.fromJson;

  @override
  String get redirectUri;
  @override
  @JsonKey(ignore: true)
  _$$OAuthRedirectResponseImplCopyWith<_$OAuthRedirectResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
