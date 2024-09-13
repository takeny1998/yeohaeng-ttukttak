// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationEvent _$NotificationEventFromJson(Map<String, dynamic> json) {
  return NewLoginDetectedEvent.fromJson(json);
}

/// @nodoc
mixin _$NotificationEvent {
  @JsonKey(name: 'device_name')
  String get deviceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'logged_in_at')
  DateTime get loggedInAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'device_name') String deviceName,
            @JsonKey(name: 'logged_in_at') DateTime loggedInAt)
        newLoginDetected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'device_name') String deviceName,
            @JsonKey(name: 'logged_in_at') DateTime loggedInAt)?
        newLoginDetected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'device_name') String deviceName,
            @JsonKey(name: 'logged_in_at') DateTime loggedInAt)?
        newLoginDetected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewLoginDetectedEvent value) newLoginDetected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewLoginDetectedEvent value)? newLoginDetected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewLoginDetectedEvent value)? newLoginDetected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationEventCopyWith<NotificationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'device_name') String deviceName,
      @JsonKey(name: 'logged_in_at') DateTime loggedInAt});
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? loggedInAt = null,
  }) {
    return _then(_value.copyWith(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      loggedInAt: null == loggedInAt
          ? _value.loggedInAt
          : loggedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewLoginDetectedEventImplCopyWith<$Res>
    implements $NotificationEventCopyWith<$Res> {
  factory _$$NewLoginDetectedEventImplCopyWith(
          _$NewLoginDetectedEventImpl value,
          $Res Function(_$NewLoginDetectedEventImpl) then) =
      __$$NewLoginDetectedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'device_name') String deviceName,
      @JsonKey(name: 'logged_in_at') DateTime loggedInAt});
}

/// @nodoc
class __$$NewLoginDetectedEventImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$NewLoginDetectedEventImpl>
    implements _$$NewLoginDetectedEventImplCopyWith<$Res> {
  __$$NewLoginDetectedEventImplCopyWithImpl(_$NewLoginDetectedEventImpl _value,
      $Res Function(_$NewLoginDetectedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceName = null,
    Object? loggedInAt = null,
  }) {
    return _then(_$NewLoginDetectedEventImpl(
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      loggedInAt: null == loggedInAt
          ? _value.loggedInAt
          : loggedInAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewLoginDetectedEventImpl implements NewLoginDetectedEvent {
  const _$NewLoginDetectedEventImpl(
      {@JsonKey(name: 'device_name') required this.deviceName,
      @JsonKey(name: 'logged_in_at') required this.loggedInAt});

  factory _$NewLoginDetectedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewLoginDetectedEventImplFromJson(json);

  @override
  @JsonKey(name: 'device_name')
  final String deviceName;
  @override
  @JsonKey(name: 'logged_in_at')
  final DateTime loggedInAt;

  @override
  String toString() {
    return 'NotificationEvent.newLoginDetected(deviceName: $deviceName, loggedInAt: $loggedInAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewLoginDetectedEventImpl &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.loggedInAt, loggedInAt) ||
                other.loggedInAt == loggedInAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, deviceName, loggedInAt);

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewLoginDetectedEventImplCopyWith<_$NewLoginDetectedEventImpl>
      get copyWith => __$$NewLoginDetectedEventImplCopyWithImpl<
          _$NewLoginDetectedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@JsonKey(name: 'device_name') String deviceName,
            @JsonKey(name: 'logged_in_at') DateTime loggedInAt)
        newLoginDetected,
  }) {
    return newLoginDetected(deviceName, loggedInAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@JsonKey(name: 'device_name') String deviceName,
            @JsonKey(name: 'logged_in_at') DateTime loggedInAt)?
        newLoginDetected,
  }) {
    return newLoginDetected?.call(deviceName, loggedInAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@JsonKey(name: 'device_name') String deviceName,
            @JsonKey(name: 'logged_in_at') DateTime loggedInAt)?
        newLoginDetected,
    required TResult orElse(),
  }) {
    if (newLoginDetected != null) {
      return newLoginDetected(deviceName, loggedInAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewLoginDetectedEvent value) newLoginDetected,
  }) {
    return newLoginDetected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewLoginDetectedEvent value)? newLoginDetected,
  }) {
    return newLoginDetected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewLoginDetectedEvent value)? newLoginDetected,
    required TResult orElse(),
  }) {
    if (newLoginDetected != null) {
      return newLoginDetected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NewLoginDetectedEventImplToJson(
      this,
    );
  }
}

abstract class NewLoginDetectedEvent implements NotificationEvent {
  const factory NewLoginDetectedEvent(
          {@JsonKey(name: 'device_name') required final String deviceName,
          @JsonKey(name: 'logged_in_at') required final DateTime loggedInAt}) =
      _$NewLoginDetectedEventImpl;

  factory NewLoginDetectedEvent.fromJson(Map<String, dynamic> json) =
      _$NewLoginDetectedEventImpl.fromJson;

  @override
  @JsonKey(name: 'device_name')
  String get deviceName;
  @override
  @JsonKey(name: 'logged_in_at')
  DateTime get loggedInAt;

  /// Create a copy of NotificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewLoginDetectedEventImplCopyWith<_$NewLoginDetectedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
