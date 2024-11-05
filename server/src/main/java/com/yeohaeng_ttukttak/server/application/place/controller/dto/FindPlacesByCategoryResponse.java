package com.yeohaeng_ttukttak.server.application.place.controller.dto;

import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceMetricsDto;

import java.util.List;

public record FindPlacesByCategoryResponse(
        List<PlaceMetricsDto> places,
        boolean hasNextPage
) {

    public static FindPlacesByCategoryResponse of(PageResult<PlaceMetricsDto> pageResult) {
        return new FindPlacesByCategoryResponse(
                pageResult.data(),
                pageResult.hasNextPage()
        );
    }

}
