import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel_invitation_model.freezed.dart';
part 'travel_invitation_model.g.dart';

@freezed
class TravelInvitationModel with _$TravelInvitationModel {
  const factory TravelInvitationModel({
    required String id,
    required int travelId,
  }) = _TravelInvitationModel;

  factory TravelInvitationModel.fromJson(Map<String, dynamic> json) =>
      _$TravelInvitationModelFromJson(json);
}
