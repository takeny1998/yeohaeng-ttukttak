package com.yeohaeng_ttukttak.server.application.participant.service.dto;

import com.yeohaeng_ttukttak.server.common.dto.BaseTimeMetadata;
import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;

public record ParticipantDto(
        Long id,
        Long travelId,
        String inviteeId,
        String inviterId,
        BaseTimeMetadata metadata
) {

    public static ParticipantDto of (final TravelParticipant participant) {
        return new ParticipantDto(
                participant.getId(),
                participant.getTravel().id(),
                participant.getInvitee().uuid(),
                participant.getInviter().uuid(),
                BaseTimeMetadata.of(participant));
    }

}
