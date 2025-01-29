package com.yeohaeng_ttukttak.server.application.travel.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.BaseTimeMetadata;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;

public record TravelParticipantDto(
        Long id,
        Long travelId,
        String inviteeId,
        String inviterId,
        BaseTimeMetadata metadata
) {

    public static TravelParticipantDto of (final TravelParticipant participant) {
        return new TravelParticipantDto(
                participant.getId(),
                participant.getTravel().id(),
                participant.getInvitee().uuid(),
                participant.getInviter().uuid(),
                BaseTimeMetadata.of(participant));
    }

}
