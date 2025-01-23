package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelParticipantDto;

import java.util.List;

public final class TravelParticipantListResponse extends ServerSuccessResponse<TravelParticipantListResponse.TravelParticipantListData> {

    public TravelParticipantListResponse(List<TravelParticipantDto> participants) {
        super(new TravelParticipantListData(participants));
    }

    public record TravelParticipantListData(List<TravelParticipantDto> participants) { }

}
