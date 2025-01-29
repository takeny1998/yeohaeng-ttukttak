package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantTokenDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class TravelParticipantTokenResponse
        extends ServerSuccessResponse<TravelParticipantTokenResponse.ParticipantTokenData> {

    public TravelParticipantTokenResponse(final TravelParticipantTokenDto travelParticipantTokenDto) {
        super(new ParticipantTokenData(travelParticipantTokenDto));
    }

    public record ParticipantTokenData(TravelParticipantTokenDto token) {}

}
