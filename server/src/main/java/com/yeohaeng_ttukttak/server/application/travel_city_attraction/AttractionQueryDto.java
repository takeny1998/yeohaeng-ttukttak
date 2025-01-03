package com.yeohaeng_ttukttak.server.application.travel_city_attraction;

import com.querydsl.core.annotations.QueryProjection;
import com.yeohaeng_ttukttak.server.domain.place.entity.Place;
import com.yeohaeng_ttukttak.server.domain.travel_city_attraction.AttractionDto;

public record AttractionQueryDto(Place place, Double rating) {

    @QueryProjection
    public AttractionQueryDto {}

    public AttractionDto toEntityDto() {
        return AttractionDto.of(place, rating);
    }

}
