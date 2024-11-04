package com.yeohaeng_ttukttak.server.application.place.controller.dto;

import com.yeohaeng_ttukttak.server.common.util.dto.PageResult;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;

import java.util.List;

public record PlaceRecommendationResponse(
        List<PlaceDto> places,
        boolean hasNextPage
) {

    public static PlaceRecommendationResponse of(PageResult<Place> pageResult) {
        return new PlaceRecommendationResponse(
                pageResult.data().stream().map(PlaceDto::of).toList(),
                pageResult.hasNextPage()
        );
    }

}
