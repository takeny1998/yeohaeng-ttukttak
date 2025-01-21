package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelParticipantDto;

import java.util.List;

public final class TravelParticipantListResponse extends ServerSuccessResponse<TravelParticipantListResponse.Data> {

    public TravelParticipantListResponse(List<TravelParticipantDto> participants) {
        super(new Data(participants));
    }

    public record Data(List<TravelParticipantDto> participants) { }

}
