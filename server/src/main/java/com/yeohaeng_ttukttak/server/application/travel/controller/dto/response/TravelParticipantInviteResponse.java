package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelInvitationTokenDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class TravelParticipantInviteResponse extends ServerSuccessResponse<TravelInvitationTokenDto> {

    private TravelParticipantInviteResponse() {}

    public TravelParticipantInviteResponse(final TravelInvitationTokenDto tokenDto) {
        super(tokenDto);
    }

}
