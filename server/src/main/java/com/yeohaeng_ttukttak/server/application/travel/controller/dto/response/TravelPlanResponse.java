package com.yeohaeng_ttukttak.server.application.travel.controller.dto.response;

import com.yeohaeng_ttukttak.server.application.travel.service.dto.TravelPlanDto;
import com.yeohaeng_ttukttak.server.common.dto.ServerSuccessResponse;

public class TravelPlanResponse
        extends ServerSuccessResponse<TravelPlanResponse.TravelPlanResponseData> {

    public TravelPlanResponse(TravelPlanDto planDto) {
        super(new TravelPlanResponseData(planDto));
    }

    public record TravelPlanResponseData(TravelPlanDto plan) {}
}
