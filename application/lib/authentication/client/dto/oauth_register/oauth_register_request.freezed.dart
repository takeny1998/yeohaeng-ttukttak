// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oauth_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OAuthRegisterRequest _$OAuthRegisterRequestFromJson(Map<String, dynamic> json) {
  return _OAuthRegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$OAuthRegisterRequest {
  String get authorizationCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OAuthRegisterRequestCopyWith<OAuthRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OAuthRegisterRequestCopyWith<$Res> {
  factory $OAuthRegisterRequestCopyWith(OAuthRegisterRequest value,
          $Res Function(OAuthRegisterRequest) then) =
      _$OAuthRegisterRequestCopyWithImpl<$Res, OAuthRegisterRequest>;
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class _$OAuthRegisterRequestCopyWithImpl<$Res,
        $Val extends OAuthRegisterRequest>
    implements $OAuthRegisterRequestCopyWith<$Res> {
  _$OAuthRegisterRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$OAuthRegisterRequestImplCopyWith<$Res>
    implements $OAuthRegisterRequestCopyWith<$Res> {
  factory _$$OAuthRegisterRequestImplCopyWith(_$OAuthRegisterRequestImpl value,
          $Res Function(_$OAuthRegisterRequestImpl) then) =
      __$$OAuthRegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String authorizationCode});
}

/// @nodoc
class __$$OAuthRegisterRequestImplCopyWithImpl<$Res>
    extends _$OAuthRegisterRequestCopyWithImpl<$Res, _$OAuthRegisterRequestImpl>
    implements _$$OAuthRegisterRequestImplCopyWith<$Res> {
  __$$OAuthRegisterRequestImplCopyWithImpl(_$OAuthRegisterRequestImpl _value,
      $Res Function(_$OAuthRegisterRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizationCode = null,
  }) {
    return _then(_$OAuthRegisterRequestImpl(
      authorizationCode: null == authorizationCode
          ? _value.authorizationCode
          : authorizationCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OAuthRegisterRequestImpl implements _OAuthRegisterRequest {
  const _$OAuthRegisterRequestImpl({required this.authorizationCode});

  factory _$OAuthRegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$OAuthRegisterRequestImplFromJson(json);

  @override
  final String authorizationCode;

  @override
  String toString() {
    return 'OAuthRegisterRequest(authorizationCode: $authorizationCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuthRegisterRequestImpl &&
            (identical(other.authorizationCode, authorizationCode) ||
                other.authorizationCode == authorizationCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorizationCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuthRegisterRequestImplCopyWith<_$OAuthRegisterRequestImpl>
      get copyWith =>
          __$$OAuthRegisterRequestImplCopyWithImpl<_$OAuthRegisterRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OAuthRegisterRequestImplToJson(
      this,
    );
  }
}

abstract class _OAuthRegisterRequest implements OAuthRegisterRequest {
  const factory _OAuthRegisterRequest(
      {required final String authorizationCode}) = _$OAuthRegisterRequestImpl;

  factory _OAuthRegisterRequest.fromJson(Map<String, dynamic> json) =
      _$OAuthRegisterRequestImpl.fromJson;

  @override
  String get authorizationCode;
  @override
  @JsonKey(ignore: true)
  _$$OAuthRegisterRequestImplCopyWith<_$OAuthRegisterRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
