package com.yeohaeng_ttukttak.server.domain.place.dto;

import com.querydsl.core.annotations.QueryProjection;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;

public record PlaceMetricRecord(
        Place place,
        Double rating,
        Long visitCount
) {

    @QueryProjection
    public PlaceMetricRecord {}
}
