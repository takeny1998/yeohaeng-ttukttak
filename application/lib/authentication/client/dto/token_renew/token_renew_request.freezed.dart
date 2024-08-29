// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_renew_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenRenewRequest _$TokenRenewRequestFromJson(Map<String, dynamic> json) {
  return _TokenRenewRequest.fromJson(json);
}

/// @nodoc
mixin _$TokenRenewRequest {
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenRenewRequestCopyWith<TokenRenewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRenewRequestCopyWith<$Res> {
  factory $TokenRenewRequestCopyWith(
          TokenRenewRequest value, $Res Function(TokenRenewRequest) then) =
      _$TokenRenewRequestCopyWithImpl<$Res, TokenRenewRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$TokenRenewRequestCopyWithImpl<$Res, $Val extends TokenRenewRequest>
    implements $TokenRenewRequestCopyWith<$Res> {
  _$TokenRenewRequestCopyWithImpl(this._value, this._then);

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
abstract class _$$TokenRenewRequestImplCopyWith<$Res>
    implements $TokenRenewRequestCopyWith<$Res> {
  factory _$$TokenRenewRequestImplCopyWith(_$TokenRenewRequestImpl value,
          $Res Function(_$TokenRenewRequestImpl) then) =
      __$$TokenRenewRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$TokenRenewRequestImplCopyWithImpl<$Res>
    extends _$TokenRenewRequestCopyWithImpl<$Res, _$TokenRenewRequestImpl>
    implements _$$TokenRenewRequestImplCopyWith<$Res> {
  __$$TokenRenewRequestImplCopyWithImpl(_$TokenRenewRequestImpl _value,
      $Res Function(_$TokenRenewRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$TokenRenewRequestImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenRenewRequestImpl implements _TokenRenewRequest {
  const _$TokenRenewRequestImpl({required this.refreshToken});

  factory _$TokenRenewRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenRenewRequestImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'TokenRenewRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenRenewRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenRenewRequestImplCopyWith<_$TokenRenewRequestImpl> get copyWith =>
      __$$TokenRenewRequestImplCopyWithImpl<_$TokenRenewRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenRenewRequestImplToJson(
      this,
    );
  }
}

abstract class _TokenRenewRequest implements TokenRenewRequest {
  const factory _TokenRenewRequest({required final String refreshToken}) =
      _$TokenRenewRequestImpl;

  factory _TokenRenewRequest.fromJson(Map<String, dynamic> json) =
      _$TokenRenewRequestImpl.fromJson;

  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$TokenRenewRequestImplCopyWith<_$TokenRenewRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
