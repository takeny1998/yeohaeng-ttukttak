package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelParticipant;

public record TravelParticipantDto(
        Long id, Long travelId, String inviterId, String inviteeId) {

    public static TravelParticipantDto of(TravelParticipant participant) {
        return new TravelParticipantDto(
                participant.getId(),
                participant.getTravel().id(),
                participant.getInviter().uuid(),
                participant.getInvitee().uuid());
    }

}
