package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelInvitationDto;


public final class TravelInvitationResponse extends ServerSuccessResponse<TravelInvitationResponse.Data> {

    public TravelInvitationResponse(TravelInvitationDto invitation) {
        super(new Data(invitation));
    }

    public record Data(TravelInvitationDto invitation) {}

}
