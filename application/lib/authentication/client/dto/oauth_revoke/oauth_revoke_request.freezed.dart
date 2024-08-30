// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_revoke_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OAuthRevokeRequest _$OAuthRevokeRequestFromJson(Map<String, dynamic> json) {
  return _OAuthRevokeRequest.fromJson(json);
}

/// @nodoc
mixin _$OAuthRevokeRequest {
  String get authorizationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OAuthRevokeRequestCopyWith<OAuthRevokeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuthRevokeRequestCopyWith<$Res> {
  factory $OAuthRevokeRequestCopyWith(
          OAuthRevokeRequest value, $Res Function(OAuthRevokeRequest) then) =
      _$OAuthRevokeRequestCopyWithImpl<$Res, OAuthRevokeRequest>;
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class _$OAuthRevokeRequestCopyWithImpl<$Res, $Val extends OAuthRevokeRequest>
    implements $OAuthRevokeRequestCopyWith<$Res> {
  _$OAuthRevokeRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$OAuthRevokeRequestImplCopyWith<$Res>
    implements $OAuthRevokeRequestCopyWith<$Res> {
  factory _$$OAuthRevokeRequestImplCopyWith(_$OAuthRevokeRequestImpl value,
          $Res Function(_$OAuthRevokeRequestImpl) then) =
      __$$OAuthRevokeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class __$$OAuthRevokeRequestImplCopyWithImpl<$Res>
    extends _$OAuthRevokeRequestCopyWithImpl<$Res, _$OAuthRevokeRequestImpl>
    implements _$$OAuthRevokeRequestImplCopyWith<$Res> {
  __$$OAuthRevokeRequestImplCopyWithImpl(_$OAuthRevokeRequestImpl _value,
      $Res Function(_$OAuthRevokeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_$OAuthRevokeRequestImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OAuthRevokeRequestImpl implements _OAuthRevokeRequest {
  const _$OAuthRevokeRequestImpl({required this.authorizationCode});

  factory _$OAuthRevokeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OAuthRevokeRequestImplFromJson(json);

  @override
  final String authorizationCode;

  @override
  String toString() {
    return 'OAuthRevokeRequest(authorizationCode: $authorizationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuthRevokeRequestImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorizationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuthRevokeRequestImplCopyWith<_$OAuthRevokeRequestImpl> get copyWith =>
      __$$OAuthRevokeRequestImplCopyWithImpl<_$OAuthRevokeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OAuthRevokeRequestImplToJson(
      this,
    );
  }
}

abstract class _OAuthRevokeRequest implements OAuthRevokeRequest {
  const factory _OAuthRevokeRequest({required final String authorizationCode}) =
      _$OAuthRevokeRequestImpl;

  factory _OAuthRevokeRequest.fromJson(Map<String, dynamic> json) =
      _$OAuthRevokeRequestImpl.fromJson;

  @override
  String get authorizationCode;
  @override
  @JsonKey(ignore: true)
  _$$OAuthRevokeRequestImplCopyWith<_$OAuthRevokeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
