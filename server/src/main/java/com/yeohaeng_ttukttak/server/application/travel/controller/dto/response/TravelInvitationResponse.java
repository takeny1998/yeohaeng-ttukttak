package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelInvitationDto;


public final class TravelInvitationResponse extends ServerSuccessResponse<TravelInvitationResponse.TravelInvitationData> {

    public TravelInvitationResponse(TravelInvitationDto invitation) {
        super(new TravelInvitationData(invitation));
    }

    public record TravelInvitationData(TravelInvitationDto invitation) {}

}
