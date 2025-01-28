package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;
import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import io.swagger.v3.oas.annotations.media.Schema;

import java.util.List;

public final class TravelPlanListResponse extends ServerSuccessResponse<TravelPlanListResponse.TravelPlanListData> {

    public TravelPlanListResponse(List<TravelPlanDto> plans) {
        super(new TravelPlanListData(plans));
    }

    public record TravelPlanListData(List<TravelPlanDto> plans) { }
}
