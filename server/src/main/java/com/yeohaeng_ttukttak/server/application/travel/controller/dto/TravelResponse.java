package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import lombok.ToString;

@ToString
public final class TravelResponse extends ServerSuccessResponse<TravelResponse.TravelData> {

    public TravelResponse(TravelDto travel) {
        super(new TravelData(travel));
    }

    public record TravelData(TravelDto travel) {}

}