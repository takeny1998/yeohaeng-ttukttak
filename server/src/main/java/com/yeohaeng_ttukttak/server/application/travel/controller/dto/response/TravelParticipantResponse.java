package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class TravelParticipantResponse
        extends ServerSuccessResponse<TravelParticipantResponse.ParticipantResponseData> {

    public TravelParticipantResponse(final TravelParticipantDto travelParticipantDto) {
        super(new ParticipantResponseData(travelParticipantDto));
    }

    public record ParticipantResponseData(TravelParticipantDto participant) {}

}
