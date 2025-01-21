package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;


public final class TravelInvitationResponse extends ServerSuccessResponse<TravelInvitationResponse.TravelInvitationData> {

    public TravelInvitationResponse(TravelInvitationDto invitation) {
        super(new TravelInvitationData(invitation));
    }

    public record TravelInvitationData(TravelInvitationDto invitation) {}

}
