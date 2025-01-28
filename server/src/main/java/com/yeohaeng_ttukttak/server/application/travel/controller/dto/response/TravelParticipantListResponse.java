package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelParticipantDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

import java.util.List;

public final class TravelParticipantListResponse extends ServerSuccessResponse<TravelParticipantListResponse.TravelParticipantListData> {

    public TravelParticipantListResponse(List<TravelParticipantDto> participants) {
        super(new TravelParticipantListData(participants));
    }

    public record TravelParticipantListData(List<TravelParticipantDto> participants) { }

}
