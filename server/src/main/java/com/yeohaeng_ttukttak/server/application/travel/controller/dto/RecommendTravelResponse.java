package com.yeohaeng_ttukttak.server.application.travel.controller.dto;

import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.travel.dto.TravelDto;
import com.yeohaeng_ttukttak.server.domain.travel.entity.Travel;

import java.util.List;

public record RecommendTravelResponse (
        List<TravelDto> travels,
        boolean hasNextPage
) {

    public static RecommendTravelResponse of(PageResult<Travel> pageResult) {
        return new RecommendTravelResponse(
                pageResult.data().stream().map(TravelDto::of).toList(),
                pageResult.hasNextPage()
        );
    }
}
