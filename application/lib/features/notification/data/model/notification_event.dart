import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.freezed.dart';
part 'notification_event.g.dart';

@Freezed(unionKey: 'code', unionValueCase: FreezedUnionCase.screamingSnake)
class NotificationEvent with _$NotificationEvent {

  const factory NotificationEvent.newLoginDetected({
    @JsonKey(name: 'device_name') required String deviceName,
    @JsonKey(name: 'logged_in_at') required DateTime loggedInAt
  }) = NewLoginDetectedEvent;

  factory NotificationEvent.fromJson(Map<String, dynamic> json) =>
      _$NotificationEventFromJson(json);

}