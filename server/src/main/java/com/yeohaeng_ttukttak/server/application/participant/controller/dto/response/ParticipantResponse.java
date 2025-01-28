package com.yeohaeng_ttukttak.server.application.participant.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.participant.service.dto.ParticipantDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class ParticipantResponse
        extends ServerSuccessResponse<ParticipantResponse.ParticipantResponseData> {

    public ParticipantResponse(final ParticipantDto participantDto) {
        super(new ParticipantResponseData(participantDto));
    }

    public record ParticipantResponseData(ParticipantDto participant) {}

}
