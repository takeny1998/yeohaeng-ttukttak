package com.yeohaeng_ttukttak.server.domain.travel.dto;

import com.yeohaeng_ttukttak.server.domain.travel.entity.TravelInvitation;

public record TravelInvitationDto(
        String id,
        String memberId,
        Long travelId
) {

    public static TravelInvitationDto of(TravelInvitation invitation) {
        return new TravelInvitationDto(invitation.id(), invitation.memberId(), invitation.travelId());
    }

}
