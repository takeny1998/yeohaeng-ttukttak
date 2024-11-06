package com.yeohaeng_ttukttak.server.application.place.controller.dto;

import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceMetricDto;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceMetricRecord;

import java.util.List;

public record FindPlacePoisResponse(
        List<PlaceMetricDto> places,
        boolean hasNextPage
) {

    public static FindPlacePoisResponse of(PageResult<PlaceMetricRecord> pageResult) {
        return new FindPlacePoisResponse(
                pageResult.data().stream()
                        .map(PlaceMetricDto::of)
                        .toList(),
                pageResult.hasNextPage()
        );
    }

}
