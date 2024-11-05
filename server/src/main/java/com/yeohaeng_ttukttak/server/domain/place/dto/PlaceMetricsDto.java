package com.yeohaeng_ttukttak.server.domain.place.dto;

import com.querydsl.core.annotations.QueryProjection;
import com.yeohaeng_ttukttak.server.domain.place.dto.PlaceDto;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;

public record PlaceMetricsDto(
        PlaceDto place,
        Double rating,
        Long visitCount
) {

    @QueryProjection
    public PlaceMetricsDto  (Place place, Double rating, Long visitCount) {
        this(PlaceDto.of(place), rating, visitCount);
    }
}