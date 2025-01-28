package com.yeohaeng_ttukttak.server.application.participant.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.participant.service.dto.ParticipantTokenDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class ParticipantTokenResponse
        extends ServerSuccessResponse<ParticipantTokenResponse.ParticipantTokenData> {

    public ParticipantTokenResponse(final ParticipantTokenDto participantTokenDto) {
        super(new ParticipantTokenData(participantTokenDto));
    }

    public record ParticipantTokenData(ParticipantTokenDto token) {}

}
