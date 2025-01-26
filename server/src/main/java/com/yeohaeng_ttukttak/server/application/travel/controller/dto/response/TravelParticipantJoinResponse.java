package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class TravelParticipantJoinResponse extends ServerSuccessResponse<TravelDto> {

    public TravelParticipantJoinResponse(TravelDto data) {
        super(data);
    }

}
